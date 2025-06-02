`timescale 1ps/1ps

module axi2axis # (
    parameter int MM_DWIDTH = 32,
    parameter int S_DWIDTH = 8,
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
// AXI stream slave (sink) signals
    input logic s_axis_tvalid,
    output logic s_axis_tready,
    input logic [MM_DWIDTH-1:0] s_axis_tdata,
    input logic s_axis_tlast,
// AXI stream master (source) signals
    output logic m_axis_tvalid,
    input logic m_axis_tready,
    output logic [S_DWIDTH-1:0] m_axis_tdata,
    output logic [S_DWIDTH/8-1:0] m_axis_tkeep,
    output logic m_axis_tlast
);
    assign s_axi_awready = 1'b1;
    assign s_axi_arready = 1'b1;

    assign s_axis_tready = 1'b1;
    assign s_axi_bid = '0;
    assign s_axi_bresp = 2'b00;

    assign s_axi_rvalid = 1'b0;
    assign s_axi_rid = '0;
    assign s_axi_rdata = '0;
    assign s_axi_rresp = 2'b00;
    assign s_axi_rlast = 1'b0;


    logic axis_tvalid;
    logic axis_tready;
    logic [MM_DWIDTH-1:0] axis_tdata;
    logic [MM_DWIDTH/8-1:0] axis_tkeep;
    logic axis_tlast;

    logic s_axi_wdone;
    logic [ID_WIDTH-1:0] s_axi_awdone_id;
    logic s_axi_awdone;

    easy_fifo #(
        .DWIDTH (ID_WIDTH)
    ) aw_fifo(
        .clk           (clk),
        .rst           (rst),
        .s_axis_tdata  (s_axi_awid),
        .s_axis_tvalid (s_axi_awvalid && s_axi_awready),
        .s_axis_tready (),
        .m_axis_tdata  (s_axi_awdone_id),
        .m_axis_tvalid (s_axi_awdone),
        .m_axis_tready (s_axi_bready && s_axi_wdone)
    );

    easy_fifo #(
        .DWIDTH (1)
    ) w_fifo(
        .clk           (clk),
        .rst           (rst),
        .s_axis_tdata  (1'b0),
        .s_axis_tvalid (s_axi_wlast && s_axi_wvalid && s_axi_wready),
        .s_axis_tready (),
        .m_axis_tdata  (),
        .m_axis_tvalid (s_axi_wdone),
        .m_axis_tready (s_axi_bready && s_axi_awdone)
    );

    assign s_axi_bvalid = s_axi_wdone && s_axi_awdone;
    assign s_axi_bid = s_axi_awdone_id;

    always_ff @(posedge clk) begin
        if (rst) begin
            axis_tdata <= '0;
            axis_tvalid <= 1'b0;
            axis_tlast <= 1'b0;
            axis_tkeep <= '0;
        end
        else if (axis_tready) begin
            axis_tdata <= s_axi_wdata;
            axis_tvalid <= s_axi_wvalid;
            axis_tlast <= s_axi_wlast;
            axis_tkeep <= s_axi_wstrb;
        end
    end
    assign s_axi_wready = axis_tready;
    axis_adapter #(
        .S_DATA_WIDTH  (MM_DWIDTH  ),
        .M_DATA_WIDTH  (S_DWIDTH  )
    ) u_axis_adapter(
        .clk           (clk),
        .rst           (rst),
        .s_axis_tdata  (axis_tdata  ),
        .s_axis_tkeep  (axis_tkeep  ),
        .s_axis_tvalid (axis_tvalid ),
        .s_axis_tready (axis_tready ),
        .s_axis_tlast  (axis_tlast  ),
        .s_axis_tid    (),
        .s_axis_tdest  (),
        .s_axis_tuser  (),
        .m_axis_tdata  (m_axis_tdata  ),
        .m_axis_tkeep  (m_axis_tkeep  ),
        .m_axis_tvalid (m_axis_tvalid ),
        .m_axis_tready (m_axis_tready ),
        .m_axis_tlast  (m_axis_tlast  ),
        .m_axis_tid    (),
        .m_axis_tdest  (),
        .m_axis_tuser  ()
    );
endmodule