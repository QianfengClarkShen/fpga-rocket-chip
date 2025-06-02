module axi_uart # (
    parameter int MM_DWIDTH = 32,
    parameter int AWIDTH = 32,
    parameter int ID_WIDTH = 2
)(
    input logic clk,
    input logic rst,
// AXI4 slave interface
    // Write address channel
    input logic s_axi_awvalid,
    output logic s_axi_awready,
    input logic [ID_WIDTH-1:0] s_axi_awid,
    input logic [AWIDTH-1:0] s_axi_awaddr,
    input logic [7:0] s_axi_awlen,
    input logic [2:0] s_axi_awsize,
    input logic [1:0] s_axi_awburst,
    input logic s_axi_awlock,
    input logic [3:0] s_axi_awcache,
    input logic [2:0] s_axi_awprot,
    input logic [3:0] s_axi_awqos,
    // Write data channel
    input logic s_axi_wvalid,
    output logic s_axi_wready,
    input logic [MM_DWIDTH-1:0] s_axi_wdata,
    input logic [(MM_DWIDTH/8)-1:0] s_axi_wstrb,
    input logic s_axi_wlast,
    // Write return channel
    output logic s_axi_bvalid,
    input logic s_axi_bready,
    output logic [ID_WIDTH-1:0] s_axi_bid,
    output logic [1:0] s_axi_bresp,
    // Read address channel
    input logic s_axi_arvalid,
    output logic s_axi_arready,
    input logic [ID_WIDTH-1:0] s_axi_arid,
    input logic [AWIDTH-1:0] s_axi_araddr,
    input logic [7:0] s_axi_arlen,
    input logic [2:0] s_axi_arsize,
    input logic [1:0] s_axi_arburst,
    input logic s_axi_arlock,
    input logic [3:0] s_axi_arcache,
    input logic [2:0] s_axi_arprot,
    input logic [3:0] s_axi_arqos,
    // Read data channel
    output logic s_axi_rvalid,
    input logic s_axi_rready,
    output logic [ID_WIDTH-1:0] s_axi_rid,
    output logic [MM_DWIDTH-1:0] s_axi_rdata,
    output logic [1:0] s_axi_rresp,
    output logic s_axi_rlast,
    //uart
    output logic [7:0] uart_axis_tdata,
    output logic uart_axis_tvalid,
    input logic uart_axis_tready

);
    logic s_axis_tvalid;
    logic s_axis_tready;
    logic [MM_DWIDTH-1:0] s_axis_tdata;
    logic s_axis_tlast;
    logic m_axis_tvalid;
    logic m_axis_tready;
    logic [7:0] m_axis_tdata;
    logic [0:0] m_axis_tkeep;
    logic m_axis_tlast;

    axi2axis #(
        .MM_DWIDTH (MM_DWIDTH ),
        .S_DWIDTH  (8  ),
        .AWIDTH    (AWIDTH    ),
        .ID_WIDTH  (ID_WIDTH  )
    ) u_axi2axis(.*);

    easy_fifo #(
        .DWIDTH (8),
        .DEPTH  (256)
    ) u_easy_fifo_1(
        .clk           (clk           ),
        .rst           (rst           ),
        .s_axis_tdata  (m_axis_tdata  ),
        .s_axis_tvalid (m_axis_tvalid ),
        .s_axis_tready (m_axis_tready ),
        .m_axis_tdata  (uart_axis_tdata  ),
        .m_axis_tvalid (uart_axis_tvalid ),
        .m_axis_tready (uart_axis_tready )
    );
endmodule