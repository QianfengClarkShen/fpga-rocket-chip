`timescale 1ns/1ps
`define SIM_ENABLE_DDR
module chip_top
(
  input wire clk,
  input wire rst,
//uart
    output wire [7:0] uart_axis_tdata,
    output wire uart_axis_tvalid,
    input wire uart_axis_tready
 );

  //dut wires
  wire  dut_clock;
  wire  dut_reset;

  wire  dut_debug_ndreset;
  wire  dut_debug_dmactive;
  //mmio
  wire  dut_mmio_axi4_0_aw_ready;
  wire  dut_mmio_axi4_0_aw_valid;
  wire [3:0] dut_mmio_axi4_0_aw_id;
  wire [30:0] dut_mmio_axi4_0_aw_addr;
  wire [7:0] dut_mmio_axi4_0_aw_len;
  wire [2:0] dut_mmio_axi4_0_aw_size;
  wire [1:0] dut_mmio_axi4_0_aw_burst;
  wire  dut_mmio_axi4_0_aw_lock;
  wire [3:0] dut_mmio_axi4_0_aw_cache;
  wire [2:0] dut_mmio_axi4_0_aw_prot;
  wire [3:0] dut_mmio_axi4_0_aw_qos;
  wire  dut_mmio_axi4_0_w_ready;
  wire  dut_mmio_axi4_0_w_valid;
  wire [63:0] dut_mmio_axi4_0_w_data;
  wire [7:0] dut_mmio_axi4_0_w_strb;
  wire  dut_mmio_axi4_0_w_last;
  wire  dut_mmio_axi4_0_b_ready;
  wire  dut_mmio_axi4_0_b_valid;
  wire [3:0] dut_mmio_axi4_0_b_id;
  wire [1:0] dut_mmio_axi4_0_b_resp;
  wire  dut_mmio_axi4_0_ar_ready;
  wire  dut_mmio_axi4_0_ar_valid;
  wire [3:0] dut_mmio_axi4_0_ar_id;
  wire [30:0] dut_mmio_axi4_0_ar_addr;
  wire [7:0] dut_mmio_axi4_0_ar_len;
  wire [2:0] dut_mmio_axi4_0_ar_size;
  wire [1:0] dut_mmio_axi4_0_ar_burst;
  wire  dut_mmio_axi4_0_ar_lock;
  wire [3:0] dut_mmio_axi4_0_ar_cache;
  wire [2:0] dut_mmio_axi4_0_ar_prot;
  wire [3:0] dut_mmio_axi4_0_ar_qos;
  wire  dut_mmio_axi4_0_r_ready;
  wire  dut_mmio_axi4_0_r_valid;
  wire [3:0] dut_mmio_axi4_0_r_id;
  wire [63:0] dut_mmio_axi4_0_r_data;
  wire [1:0] dut_mmio_axi4_0_r_resp;
  wire  dut_mmio_axi4_0_r_last;
  // above: those wires connected to the dut module

  // mmio
  wire  mmio_clock;
  wire  mmio_reset;
  wire  mmio_io_axi4_0_aw_ready;
  wire  mmio_io_axi4_0_aw_valid;
  wire [3:0] mmio_io_axi4_0_aw_id;
  wire [30:0] mmio_io_axi4_0_aw_addr;
  wire [7:0] mmio_io_axi4_0_aw_len;
  wire [2:0] mmio_io_axi4_0_aw_size;
  wire [1:0] mmio_io_axi4_0_aw_burst;
  wire  mmio_io_axi4_0_w_ready;
  wire  mmio_io_axi4_0_w_valid;
  wire [63:0] mmio_io_axi4_0_w_data;
  wire [7:0] mmio_io_axi4_0_w_strb;
  wire  mmio_io_axi4_0_w_last;
  wire  mmio_io_axi4_0_b_ready;
  wire  mmio_io_axi4_0_b_valid;
  wire [3:0] mmio_io_axi4_0_b_id;
  wire [1:0] mmio_io_axi4_0_b_resp;
  wire  mmio_io_axi4_0_ar_ready;
  wire  mmio_io_axi4_0_ar_valid;
  wire [3:0] mmio_io_axi4_0_ar_id;
  wire [30:0] mmio_io_axi4_0_ar_addr;
  wire [7:0] mmio_io_axi4_0_ar_len;
  wire [2:0] mmio_io_axi4_0_ar_size;
  wire [1:0] mmio_io_axi4_0_ar_burst;
  wire  mmio_io_axi4_0_r_ready;
  wire  mmio_io_axi4_0_r_valid;
  wire [3:0] mmio_io_axi4_0_r_id;
  wire [63:0] mmio_io_axi4_0_r_data;
  wire [1:0] mmio_io_axi4_0_r_resp;
  wire  mmio_io_axi4_0_r_last;

  ExampleRocketSystem dut (
      .clock(dut_clock),
      .reset(dut_reset),

      .debug_systemjtag_jtag_TCK(1'b0),
      .debug_systemjtag_jtag_TMS(1'b0),
      .debug_systemjtag_jtag_TDI(1'b0),
      .debug_systemjtag_jtag_TDO_data(),
      .debug_systemjtag_jtag_TDO_driven(),
      .debug_systemjtag_reset(1'b0),
      .debug_systemjtag_mfr_id(11'b0),

      .debug_ndreset(dut_debug_ndreset),
      .debug_dmactive(),
      .interrupts(2'b0),

      .mem_axi4_0_aw_ready(1'b1),
      .mem_axi4_0_aw_valid(),
      .mem_axi4_0_aw_bits_id(),
      .mem_axi4_0_aw_bits_addr(),
      .mem_axi4_0_aw_bits_len(),
      .mem_axi4_0_aw_bits_size(),
      .mem_axi4_0_aw_bits_burst(),
      .mem_axi4_0_aw_bits_lock(),
      .mem_axi4_0_aw_bits_cache(),
      .mem_axi4_0_aw_bits_prot(),
      .mem_axi4_0_aw_bits_qos(),
      .mem_axi4_0_w_ready(1'b1),
      .mem_axi4_0_w_valid(),
      .mem_axi4_0_w_bits_data(),
      .mem_axi4_0_w_bits_strb(),
      .mem_axi4_0_w_bits_last(),
      .mem_axi4_0_b_ready(),
      .mem_axi4_0_b_valid(1'b0),
      .mem_axi4_0_b_bits_id(4'b0),
      .mem_axi4_0_b_bits_resp(2'b0),
      .mem_axi4_0_ar_ready(1'b1),
      .mem_axi4_0_ar_valid(),
      .mem_axi4_0_ar_bits_id(),
      .mem_axi4_0_ar_bits_addr(),
      .mem_axi4_0_ar_bits_len(),
      .mem_axi4_0_ar_bits_size(),
      .mem_axi4_0_ar_bits_burst(),
      .mem_axi4_0_ar_bits_lock(),
      .mem_axi4_0_ar_bits_cache(),
      .mem_axi4_0_ar_bits_prot(),
      .mem_axi4_0_ar_bits_qos(),
      .mem_axi4_0_r_ready(),
      .mem_axi4_0_r_valid(1'b0),
      .mem_axi4_0_r_bits_id(4'b0),
      .mem_axi4_0_r_bits_data(64'b0),
      .mem_axi4_0_r_bits_resp(2'b0),
      .mem_axi4_0_r_bits_last(1'b0),

      .mmio_axi4_0_aw_ready(dut_mmio_axi4_0_aw_ready),
      .mmio_axi4_0_aw_valid(dut_mmio_axi4_0_aw_valid),
      .mmio_axi4_0_aw_bits_id(dut_mmio_axi4_0_aw_id),
      .mmio_axi4_0_aw_bits_addr(dut_mmio_axi4_0_aw_addr),
      .mmio_axi4_0_aw_bits_len(dut_mmio_axi4_0_aw_len),
      .mmio_axi4_0_aw_bits_size(dut_mmio_axi4_0_aw_size),
      .mmio_axi4_0_aw_bits_burst(dut_mmio_axi4_0_aw_burst),
      .mmio_axi4_0_aw_bits_lock(dut_mmio_axi4_0_aw_lock),
      .mmio_axi4_0_aw_bits_cache(dut_mmio_axi4_0_aw_cache),
      .mmio_axi4_0_aw_bits_prot(dut_mmio_axi4_0_aw_prot),
      .mmio_axi4_0_aw_bits_qos(dut_mmio_axi4_0_aw_qos),
      .mmio_axi4_0_w_ready(dut_mmio_axi4_0_w_ready),
      .mmio_axi4_0_w_valid(dut_mmio_axi4_0_w_valid),
      .mmio_axi4_0_w_bits_data(dut_mmio_axi4_0_w_data),
      .mmio_axi4_0_w_bits_strb(dut_mmio_axi4_0_w_strb),
      .mmio_axi4_0_w_bits_last(dut_mmio_axi4_0_w_last),
      .mmio_axi4_0_b_ready(dut_mmio_axi4_0_b_ready),
      .mmio_axi4_0_b_valid(dut_mmio_axi4_0_b_valid),
      .mmio_axi4_0_b_bits_id(dut_mmio_axi4_0_b_id),
      .mmio_axi4_0_b_bits_resp(dut_mmio_axi4_0_b_resp),
      .mmio_axi4_0_ar_ready(dut_mmio_axi4_0_ar_ready),
      .mmio_axi4_0_ar_valid(dut_mmio_axi4_0_ar_valid),
      .mmio_axi4_0_ar_bits_id(dut_mmio_axi4_0_ar_id),
      .mmio_axi4_0_ar_bits_addr(dut_mmio_axi4_0_ar_addr),
      .mmio_axi4_0_ar_bits_len(dut_mmio_axi4_0_ar_len),
      .mmio_axi4_0_ar_bits_size(dut_mmio_axi4_0_ar_size),
      .mmio_axi4_0_ar_bits_burst(dut_mmio_axi4_0_ar_burst),
      .mmio_axi4_0_ar_bits_lock(dut_mmio_axi4_0_ar_lock),
      .mmio_axi4_0_ar_bits_cache(dut_mmio_axi4_0_ar_cache),
      .mmio_axi4_0_ar_bits_prot(dut_mmio_axi4_0_ar_prot),
      .mmio_axi4_0_ar_bits_qos(dut_mmio_axi4_0_ar_qos),
      .mmio_axi4_0_r_ready(dut_mmio_axi4_0_r_ready),
      .mmio_axi4_0_r_valid(dut_mmio_axi4_0_r_valid),
      .mmio_axi4_0_r_bits_id(dut_mmio_axi4_0_r_id),
      .mmio_axi4_0_r_bits_data(dut_mmio_axi4_0_r_data),
      .mmio_axi4_0_r_bits_resp(dut_mmio_axi4_0_r_resp),
      .mmio_axi4_0_r_bits_last(dut_mmio_axi4_0_r_last),
      .l2_frontend_bus_axi4_0_aw_ready(),
      .l2_frontend_bus_axi4_0_aw_valid(1'b0),
      .l2_frontend_bus_axi4_0_aw_bits_id(4'b0),
      .l2_frontend_bus_axi4_0_aw_bits_addr(32'b0),
      .l2_frontend_bus_axi4_0_aw_bits_len(8'b0),
      .l2_frontend_bus_axi4_0_aw_bits_size(3'b0),
      .l2_frontend_bus_axi4_0_aw_bits_burst(2'b0),
      .l2_frontend_bus_axi4_0_aw_bits_lock(1'b0),
      .l2_frontend_bus_axi4_0_aw_bits_cache(4'b0),
      .l2_frontend_bus_axi4_0_aw_bits_prot(3'b0),
      .l2_frontend_bus_axi4_0_aw_bits_qos(4'b0),
      .l2_frontend_bus_axi4_0_w_ready(),
      .l2_frontend_bus_axi4_0_w_valid(1'b0),
      .l2_frontend_bus_axi4_0_w_bits_data(64'b0),
      .l2_frontend_bus_axi4_0_w_bits_strb(8'b0),
      .l2_frontend_bus_axi4_0_w_bits_last(1'b0),
      .l2_frontend_bus_axi4_0_b_ready(1'b1),
      .l2_frontend_bus_axi4_0_b_valid(),
      .l2_frontend_bus_axi4_0_b_bits_id(),
      .l2_frontend_bus_axi4_0_b_bits_resp(),
      .l2_frontend_bus_axi4_0_ar_ready(),
      .l2_frontend_bus_axi4_0_ar_valid(1'b0),
      .l2_frontend_bus_axi4_0_ar_bits_id(4'b0),
      .l2_frontend_bus_axi4_0_ar_bits_addr(32'b0),
      .l2_frontend_bus_axi4_0_ar_bits_len(8'b0),
      .l2_frontend_bus_axi4_0_ar_bits_size(3'b0),
      .l2_frontend_bus_axi4_0_ar_bits_burst(2'b0),
      .l2_frontend_bus_axi4_0_ar_bits_lock(1'b0),
      .l2_frontend_bus_axi4_0_ar_bits_cache(4'b0),
      .l2_frontend_bus_axi4_0_ar_bits_prot(3'b0),
      .l2_frontend_bus_axi4_0_ar_bits_qos(4'b0),
      .l2_frontend_bus_axi4_0_r_ready(1'b1),
      .l2_frontend_bus_axi4_0_r_valid(),
      .l2_frontend_bus_axi4_0_r_bits_id(),
      .l2_frontend_bus_axi4_0_r_bits_data(),
      .l2_frontend_bus_axi4_0_r_bits_resp(),
      .l2_frontend_bus_axi4_0_r_bits_last()
    );

  AXIMmio mmio (
    .clock(mmio_clock),
    .reset(mmio_reset),

    .io_axi4_0_aw_ready(mmio_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mmio_io_axi4_0_aw_valid),
    .io_axi4_0_aw_id(mmio_io_axi4_0_aw_id),
    .io_axi4_0_aw_addr(mmio_io_axi4_0_aw_addr),
    .io_axi4_0_aw_len(mmio_io_axi4_0_aw_len),
    .io_axi4_0_aw_size(mmio_io_axi4_0_aw_size),
    .io_axi4_0_aw_burst(mmio_io_axi4_0_aw_burst),
    .io_axi4_0_w_ready(mmio_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mmio_io_axi4_0_w_valid),
    .io_axi4_0_w_data(mmio_io_axi4_0_w_data),
    .io_axi4_0_w_strb(mmio_io_axi4_0_w_strb),
    .io_axi4_0_w_last(mmio_io_axi4_0_w_last),
    .io_axi4_0_b_ready(mmio_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mmio_io_axi4_0_b_valid),
    .io_axi4_0_b_id(mmio_io_axi4_0_b_id),
    .io_axi4_0_b_resp(mmio_io_axi4_0_b_resp),
    .io_axi4_0_ar_ready(mmio_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mmio_io_axi4_0_ar_valid),
    .io_axi4_0_ar_id(mmio_io_axi4_0_ar_id),
    .io_axi4_0_ar_addr(mmio_io_axi4_0_ar_addr),
    .io_axi4_0_ar_len(mmio_io_axi4_0_ar_len),
    .io_axi4_0_ar_size(mmio_io_axi4_0_ar_size),
    .io_axi4_0_ar_burst(mmio_io_axi4_0_ar_burst),
    .io_axi4_0_r_ready(mmio_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mmio_io_axi4_0_r_valid),
    .io_axi4_0_r_id(mmio_io_axi4_0_r_id),
    .io_axi4_0_r_data(mmio_io_axi4_0_r_data),
    .io_axi4_0_r_resp(mmio_io_axi4_0_r_resp),
    .io_axi4_0_r_last(mmio_io_axi4_0_r_last),

    //HW devices' pins
        .uart_axis_tdata  (uart_axis_tdata  ),
        .uart_axis_tvalid (uart_axis_tvalid ),
        .uart_axis_tready (uart_axis_tready )
  );

  //-------------------------connect all the module together---- very verbose by Chisel generated, I will change it later

  assign dut_clock = clk;
  assign dut_reset = rst | dut_debug_ndreset;

  //  ***** mmio module *****
  // CR inheritance
  assign mmio_clock = clk;
  assign mmio_reset = rst;
  //  drived by outside module
  assign dut_mmio_axi4_0_aw_ready = mmio_io_axi4_0_aw_ready;
  assign dut_mmio_axi4_0_w_ready = mmio_io_axi4_0_w_ready;
  assign dut_mmio_axi4_0_b_valid = mmio_io_axi4_0_b_valid;
  assign dut_mmio_axi4_0_b_id = mmio_io_axi4_0_b_id;
  assign dut_mmio_axi4_0_b_resp = mmio_io_axi4_0_b_resp;
  assign dut_mmio_axi4_0_ar_ready = mmio_io_axi4_0_ar_ready;
  assign dut_mmio_axi4_0_r_valid = mmio_io_axi4_0_r_valid;
  assign dut_mmio_axi4_0_r_id = mmio_io_axi4_0_r_id;
  assign dut_mmio_axi4_0_r_data = mmio_io_axi4_0_r_data;
  assign dut_mmio_axi4_0_r_resp = mmio_io_axi4_0_r_resp;
  assign dut_mmio_axi4_0_r_last = mmio_io_axi4_0_r_last;
  //  output to outside module
  assign mmio_io_axi4_0_aw_valid = dut_mmio_axi4_0_aw_valid;
  assign mmio_io_axi4_0_aw_id = dut_mmio_axi4_0_aw_id;
  assign mmio_io_axi4_0_aw_addr = dut_mmio_axi4_0_aw_addr;
  assign mmio_io_axi4_0_aw_len = dut_mmio_axi4_0_aw_len;
  assign mmio_io_axi4_0_aw_size = dut_mmio_axi4_0_aw_size;
  assign mmio_io_axi4_0_aw_burst = dut_mmio_axi4_0_aw_burst;
  assign mmio_io_axi4_0_w_valid = dut_mmio_axi4_0_w_valid;
  assign mmio_io_axi4_0_w_data = dut_mmio_axi4_0_w_data;
  assign mmio_io_axi4_0_w_strb = dut_mmio_axi4_0_w_strb;
  assign mmio_io_axi4_0_w_last = dut_mmio_axi4_0_w_last;
  assign mmio_io_axi4_0_b_ready = dut_mmio_axi4_0_b_ready;
  assign mmio_io_axi4_0_ar_valid = dut_mmio_axi4_0_ar_valid;
  assign mmio_io_axi4_0_ar_id = dut_mmio_axi4_0_ar_id;
  assign mmio_io_axi4_0_ar_addr = dut_mmio_axi4_0_ar_addr;
  assign mmio_io_axi4_0_ar_len = dut_mmio_axi4_0_ar_len;
  assign mmio_io_axi4_0_ar_size = dut_mmio_axi4_0_ar_size;
  assign mmio_io_axi4_0_ar_burst = dut_mmio_axi4_0_ar_burst;
  assign mmio_io_axi4_0_r_ready = dut_mmio_axi4_0_r_ready;

endmodule //end of top
