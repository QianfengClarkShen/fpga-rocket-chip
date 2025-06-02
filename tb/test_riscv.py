from email.quoprimime import header_check
import logging
from operator import ge
import os
from xml.etree.ElementInclude import include

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer, with_timeout
from cocotb.regression import TestFactory
from cocotb.runner import get_runner
from cocotb.utils import get_sim_time
from cocotb.handle import SimHandleBase
from cocotb.binary import BinaryValue

from cocotbext.axi import AxiBus, AxiMaster
from cocotbext.axi import AxiStreamFrame, AxiStreamBus, AxiStreamSource, AxiStreamSink, AxiStreamMonitor
from pathlib import Path

TOP_MODULE = "chip_top"

class FirmwareReader:
    def __init__(self, file_path):
        self.file_path = file_path

    def read(self):
        byte_array_list = []
        try:
            with open(self.file_path, 'r') as file:
                for line in file:
                    # Remove whitespace and convert hex string to bytearray
                    hex_data = line.strip().replace(" ", "")
                    if hex_data:  # Skip empty lines
                        byte_array = bytearray.fromhex(hex_data)
                        # Flip the endianness by reversing the bytearray
                        byte_array_list.append(bytearray(reversed(byte_array)))
        except FileNotFoundError:
            print(f"Error: File '{self.file_path}' not found.")
        except ValueError as e:
            print(f"Error: Invalid hex data in file. {e}")
        return byte_array_list

class TB:
    def __init__(self, dut):
        self.dut = dut

        self.log = logging.getLogger("cocotb.tb")
        self.log.setLevel(logging.DEBUG)

        self.axis_sink = AxiStreamSink(AxiStreamBus.from_prefix(dut, "uart_axis"), dut.clk, dut.rst)
        self.mem = self.dut.mmio.u_axi_ram.mem

async def run_test(dut,size=None):

    tb = TB(dut)

    file_path = Path(__file__).resolve().parent.parent / "firmware" / "firmware.hex"
    reader = FirmwareReader(file_path)
    mem_value = BinaryValue(0, n_bits=64, bigEndian=False)

    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

    firm = reader.read()
    if not firm:
        tb.log.error("Firmware data is empty or could not be read.")
        return
    for i, data in enumerate(firm):
        mem_value.buff = data
        tb.mem[i].value = mem_value

    dut.rst.setimmediatevalue(0)
    for _ in range(10):
        await RisingEdge(dut.clk)
    dut.rst.value = 1
    for _ in range(20):
        await RisingEdge(dut.clk)
    dut.rst.value = 0
    for _ in range(20):
        await RisingEdge(dut.clk)

    #write
    cnt = 0
    resp = bytearray()
    while True:
        try:
            rx_frame = await with_timeout(tb.axis_sink.recv(), 100, 'us')
        except TimeoutError:
            break
        else:
            resp.extend(rx_frame.tdata)
            cnt += 1
    tb.log.info(f"{resp.decode('utf-8')}")

def test_runner():
    #os.environ["COCOTB_RESOLVE_X"] = "ZEROS"
    sim = os.getenv("SIM", "verilator")
    #sim = os.getenv("SIM", "icarus")

    rtl_path = Path(__file__).resolve().parent.parent / "verilog"
    cpu_path = Path(__file__).resolve().parent.parent / "rocket-chip" / "vsim" / "generated-src"
    print(f"RTL path: {rtl_path}")

    module_name = Path(__file__).stem

    verilog_sources = list(rtl_path.rglob("*.sv")) + list(rtl_path.rglob("*.v")) + list(cpu_path.rglob("*.v"))

#    parameters = {
#        "MM_DWIDTH": 64,
#        "AWIDTH": 12
#    }

    runner = get_runner(sim)

    runner.build(
        hdl_toplevel=TOP_MODULE,
        verilog_sources=verilog_sources,
#        parameters=parameters,
        defines=dict(PRINTF_COND="0", RANDOMIZE_DELAY="0"),
        build_args=["--timing", "-Wno-INITIALDLY", "-Wno-UNOPTFLAT", "-Wno-SELRANGE", "-Wno-WIDTH", "-Wno-lint", "-Wno-style", "-Wno-context", "-Wno-UNOPT", "+1800-2012ext+sv", "--trace", "--trace-structs", "--build-jobs", "8"],
#        includes=[firm_path,header_path],
        waves=True
       # always=True
    )

    runner.test(
        hdl_toplevel=TOP_MODULE,
        hdl_toplevel_lang="verilog",
        waves=True,
        test_module=module_name
    )

if cocotb.SIM_NAME:
    factory = TestFactory(run_test)
    factory.generate_tests()

if __name__ == "__main__":
    test_runner()