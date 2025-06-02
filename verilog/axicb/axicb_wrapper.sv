`timescale 1ps/1ps

module axicb_wrapper (
    input logic clk,
    input logic rst,
    input logic [3:0] s_axi_awid,
    input logic [30:0] s_axi_awaddr,
    input logic [7:0] s_axi_awlen,
    input logic [2:0] s_axi_awsize,
    input logic [1:0] s_axi_awburst,
    input logic [0:0] s_axi_awlock,
    input logic [3:0] s_axi_awcache,
    input logic [2:0] s_axi_awprot,
    input logic [3:0] s_axi_awqos,
    input logic [0:0] s_axi_awvalid,
    output logic [0:0] s_axi_awready,
    input logic [63:0] s_axi_wdata,
    input logic [7:0] s_axi_wstrb,
    input logic [0:0] s_axi_wlast,
    input logic [0:0] s_axi_wvalid,
    output logic [0:0] s_axi_wready,
    output logic [3:0] s_axi_bid,
    output logic [1:0] s_axi_bresp,
    output logic [0:0] s_axi_bvalid,
    input logic [0:0] s_axi_bready,
    input logic [3:0] s_axi_arid,
    input logic [30:0] s_axi_araddr,
    input logic [7:0] s_axi_arlen,
    input logic [2:0] s_axi_arsize,
    input logic [1:0] s_axi_arburst,
    input logic [0:0] s_axi_arlock,
    input logic [3:0] s_axi_arcache,
    input logic [2:0] s_axi_arprot,
    input logic [3:0] s_axi_arqos,
    input logic [0:0] s_axi_arvalid,
    output logic [0:0] s_axi_arready,
    output logic [3:0] s_axi_rid,
    output logic [63:0] s_axi_rdata,
    output logic [1:0] s_axi_rresp,
    output logic [0:0] s_axi_rlast,
    output logic [0:0] s_axi_rvalid,
    input logic [0:0] s_axi_rready,
    output logic [7:0] m_axi_awid,
    output logic [61:0] m_axi_awaddr,
    output logic [15:0] m_axi_awlen,
    output logic [5:0] m_axi_awsize,
    output logic [3:0] m_axi_awburst,
    output logic [1:0] m_axi_awlock,
    output logic [7:0] m_axi_awcache,
    output logic [5:0] m_axi_awprot,
    output logic [7:0] m_axi_awregion,
    output logic [7:0] m_axi_awqos,
    output logic [1:0] m_axi_awvalid,
    input logic [1:0] m_axi_awready,
    output logic [127:0] m_axi_wdata,
    output logic [15:0] m_axi_wstrb,
    output logic [1:0] m_axi_wlast,
    output logic [1:0] m_axi_wvalid,
    input logic [1:0] m_axi_wready,
    input logic [7:0] m_axi_bid,
    input logic [3:0] m_axi_bresp,
    input logic [1:0] m_axi_bvalid,
    output logic [1:0] m_axi_bready,
    output logic [7:0] m_axi_arid,
    output logic [61:0] m_axi_araddr,
    output logic [15:0] m_axi_arlen,
    output logic [5:0] m_axi_arsize,
    output logic [3:0] m_axi_arburst,
    output logic [1:0] m_axi_arlock,
    output logic [7:0] m_axi_arcache,
    output logic [5:0] m_axi_arprot,
    output logic [7:0] m_axi_arregion,
    output logic [7:0] m_axi_arqos,
    output logic [1:0] m_axi_arvalid,
    input logic [1:0] m_axi_arready,
    input logic [7:0] m_axi_rid,
    input logic [127:0] m_axi_rdata,
    input logic [3:0] m_axi_rresp,
    input logic [1:0] m_axi_rlast,
    input logic [1:0] m_axi_rvalid,
    output logic [1:0] m_axi_rready
);

    logic mst0_awvalid;
    logic mst0_awready;
    logic [30:0] mst0_awaddr;
    logic [7:0] mst0_awlen;
    logic [2:0] mst0_awsize;
    logic [1:0] mst0_awburst;
    logic mst0_awlock;
    logic [3:0] mst0_awcache;
    logic [2:0] mst0_awprot;
    logic [3:0] mst0_awqos;
    logic [3:0] mst0_awregion;
    logic [3:0] mst0_awid;
    logic [0:0] mst0_awuser;
    logic mst0_wvalid;
    logic mst0_wready;
    logic mst0_wlast;
    logic [63:0] mst0_wdata;
    logic [7:0] mst0_wstrb;
    logic [0:0] mst0_wuser;
    logic mst0_bvalid;
    logic mst0_bready;
    logic [3:0] mst0_bid;
    logic [1:0] mst0_bresp;
    logic [0:0] mst0_buser;
    logic mst0_arvalid;
    logic mst0_arready;
    logic [30:0] mst0_araddr;
    logic [7:0] mst0_arlen;
    logic [2:0] mst0_arsize;
    logic [1:0] mst0_arburst;
    logic mst0_arlock;
    logic [3:0] mst0_arcache;
    logic [2:0] mst0_arprot;
    logic [3:0] mst0_arqos;
    logic [3:0] mst0_arregion;
    logic [3:0] mst0_arid;
    logic [0:0] mst0_aruser;
    logic mst0_rvalid;
    logic mst0_rready;
    logic [3:0] mst0_rid;
    logic [1:0] mst0_rresp;
    logic [63:0] mst0_rdata;
    logic mst0_rlast;
    logic [0:0] mst0_ruser;

    logic mst1_awvalid;
    logic mst1_awready;
    logic [30:0] mst1_awaddr;
    logic [7:0] mst1_awlen;
    logic [2:0] mst1_awsize;
    logic [1:0] mst1_awburst;
    logic mst1_awlock;
    logic [3:0] mst1_awcache;
    logic [2:0] mst1_awprot;
    logic [3:0] mst1_awqos;
    logic [3:0] mst1_awregion;
    logic [3:0] mst1_awid;
    logic [0:0] mst1_awuser;
    logic mst1_wvalid;
    logic mst1_wready;
    logic mst1_wlast;
    logic [63:0] mst1_wdata;
    logic [7:0] mst1_wstrb;
    logic [0:0] mst1_wuser;
    logic mst1_bvalid;
    logic mst1_bready;
    logic [3:0] mst1_bid;
    logic [1:0] mst1_bresp;
    logic [0:0] mst1_buser;
    logic mst1_arvalid;
    logic mst1_arready;
    logic [30:0] mst1_araddr;
    logic [7:0] mst1_arlen;
    logic [2:0] mst1_arsize;
    logic [1:0] mst1_arburst;
    logic mst1_arlock;
    logic [3:0] mst1_arcache;
    logic [2:0] mst1_arprot;
    logic [3:0] mst1_arqos;
    logic [3:0] mst1_arregion;
    logic [3:0] mst1_arid;
    logic [0:0] mst1_aruser;
    logic mst1_rvalid;
    logic mst1_rready;
    logic [3:0] mst1_rid;
    logic [1:0] mst1_rresp;
    logic [63:0] mst1_rdata;
    logic mst1_rlast;
    logic [0:0] mst1_ruser;

    assign m_axi_awvalid = {mst1_awvalid,mst0_awvalid};
    assign mst0_awready = m_axi_awready[0];
    assign mst1_awready = m_axi_awready[1];
    assign m_axi_awaddr = {mst1_awaddr,mst0_awaddr};
    assign m_axi_awlen = {mst1_awlen,mst0_awlen};
    assign m_axi_awsize = {mst1_awsize,mst0_awsize};
    assign m_axi_awburst = {mst1_awburst,mst0_awburst};
    assign m_axi_awlock = {mst1_awlock,mst0_awlock};
    assign m_axi_awcache = {mst1_awcache,mst0_awcache};
    assign m_axi_awprot = {mst1_awprot,mst0_awprot};
    assign m_axi_awqos = {mst1_awqos,mst0_awqos};
    assign m_axi_awregion = {mst1_awregion,mst0_awregion};
    assign m_axi_awid = {mst1_awid,mst0_awid};

    assign m_axi_wvalid = {mst1_wvalid,mst0_wvalid};
    assign mst0_wready = m_axi_wready[0];
    assign mst1_wready = m_axi_wready[1];
    assign m_axi_wlast = {mst1_wlast,mst0_wlast};
    assign m_axi_wdata = {mst1_wdata,mst0_wdata};
    assign m_axi_wstrb = {mst1_wstrb,mst0_wstrb};

    assign mst0_bvalid = m_axi_bvalid[0];
    assign mst1_bvalid = m_axi_bvalid[1];
    assign m_axi_bready[0] = mst0_bready;
    assign m_axi_bready[1] = mst1_bready;
    assign mst0_bid = m_axi_bid[3:0];
    assign mst1_bid = m_axi_bid[7:4];
    assign mst0_bresp = m_axi_bresp[1:0];
    assign mst1_bresp = m_axi_bresp[3:2];
    assign mst1_buser = '0;
    assign mst0_buser = '0;

    assign m_axi_arvalid = {mst1_arvalid,mst0_arvalid};
    assign mst0_arready = m_axi_arready[0];
    assign mst1_arready = m_axi_arready[1];
    assign m_axi_araddr = {mst1_araddr,mst0_araddr};
    assign m_axi_arlen = {mst1_arlen,mst0_arlen};
    assign m_axi_arsize = {mst1_arsize,mst0_arsize};
    assign m_axi_arburst = {mst1_arburst,mst0_arburst};
    assign m_axi_arlock = {mst1_arlock,mst0_arlock};
    assign m_axi_arcache = {mst1_arcache,mst0_arcache};
    assign m_axi_arprot = {mst1_arprot,mst0_arprot};
    assign m_axi_arqos = {mst1_arqos,mst0_arqos};
    assign m_axi_arregion = {mst1_arregion,mst0_arregion};
    assign m_axi_arid = {mst1_arid,mst0_arid};

    assign mst0_rvalid = m_axi_rvalid[0];
    assign mst1_rvalid = m_axi_rvalid[1];
    assign m_axi_rready[0] = mst0_rready;
    assign m_axi_rready[1] = mst1_rready;
    assign mst0_rid = m_axi_rid[3:0];
    assign mst1_rid = m_axi_rid[7:4];
    assign mst0_rresp = m_axi_rresp[1:0];
    assign mst1_rresp = m_axi_rresp[3:2];
    assign mst0_rdata = m_axi_rdata[63:0];
    assign mst1_rdata = m_axi_rdata[127:64];
    assign mst0_rlast = m_axi_rlast[0];
    assign mst1_rlast = m_axi_rlast[1];
    assign mst0_ruser = '0;
    assign mst1_ruser = '0;

    axicb #(
        .DATA_WIDTH        (64        ),
        .ADDR_WIDTH        (31        ),
        .S_ID_WIDTH        (4        ),
        .M00_BASE_ADDR     (32'h60000000),
        .M00_ADDR_WIDTH    (16    ),
        .M01_BASE_ADDR     (32'h60010000),
        .M01_ADDR_WIDTH    (16    )
    ) u_axicb(
        .clk              (clk            ),
        .rst              (rst            ),
        .s00_axi_awid     (s_axi_awid     ),
        .s00_axi_awaddr   (s_axi_awaddr   ),
        .s00_axi_awlen    (s_axi_awlen    ),
        .s00_axi_awsize   (s_axi_awsize   ),
        .s00_axi_awburst  (s_axi_awburst  ),
        .s00_axi_awlock   (s_axi_awlock   ),
        .s00_axi_awcache  (s_axi_awcache  ),
        .s00_axi_awprot   (s_axi_awprot   ),
        .s00_axi_awqos    (s_axi_awqos    ),
        .s00_axi_awuser   (s_axi_awuser   ),
        .s00_axi_awvalid  (s_axi_awvalid  ),
        .s00_axi_awready  (s_axi_awready  ),
        .s00_axi_wdata    (s_axi_wdata    ),
        .s00_axi_wstrb    (s_axi_wstrb    ),
        .s00_axi_wlast    (s_axi_wlast    ),
        .s00_axi_wuser    (s_axi_wuser    ),
        .s00_axi_wvalid   (s_axi_wvalid   ),
        .s00_axi_wready   (s_axi_wready   ),
        .s00_axi_bid      (s_axi_bid      ),
        .s00_axi_bresp    (s_axi_bresp    ),
        .s00_axi_buser    (s_axi_buser    ),
        .s00_axi_bvalid   (s_axi_bvalid   ),
        .s00_axi_bready   (s_axi_bready   ),
        .s00_axi_arid     (s_axi_arid     ),
        .s00_axi_araddr   (s_axi_araddr   ),
        .s00_axi_arlen    (s_axi_arlen    ),
        .s00_axi_arsize   (s_axi_arsize   ),
        .s00_axi_arburst  (s_axi_arburst  ),
        .s00_axi_arlock   (s_axi_arlock   ),
        .s00_axi_arcache  (s_axi_arcache  ),
        .s00_axi_arprot   (s_axi_arprot   ),
        .s00_axi_arqos    (s_axi_arqos    ),
        .s00_axi_aruser   (s_axi_aruser   ),
        .s00_axi_arvalid  (s_axi_arvalid  ),
        .s00_axi_arready  (s_axi_arready  ),
        .s00_axi_rid      (s_axi_rid      ),
        .s00_axi_rdata    (s_axi_rdata    ),
        .s00_axi_rresp    (s_axi_rresp    ),
        .s00_axi_rlast    (s_axi_rlast    ),
        .s00_axi_ruser    (s_axi_ruser    ),
        .s00_axi_rvalid   (s_axi_rvalid   ),
        .s00_axi_rready   (s_axi_rready   ),
        .m00_axi_awid     (mst0_awid     ),
        .m00_axi_awaddr   (mst0_awaddr   ),
        .m00_axi_awlen    (mst0_awlen    ),
        .m00_axi_awsize   (mst0_awsize   ),
        .m00_axi_awburst  (mst0_awburst  ),
        .m00_axi_awlock   (mst0_awlock   ),
        .m00_axi_awcache  (mst0_awcache  ),
        .m00_axi_awprot   (mst0_awprot   ),
        .m00_axi_awqos    (mst0_awqos    ),
        .m00_axi_awregion (mst0_awregion ),
        .m00_axi_awuser   (mst0_awuser   ),
        .m00_axi_awvalid  (mst0_awvalid  ),
        .m00_axi_awready  (mst0_awready  ),
        .m00_axi_wdata    (mst0_wdata    ),
        .m00_axi_wstrb    (mst0_wstrb    ),
        .m00_axi_wlast    (mst0_wlast    ),
        .m00_axi_wuser    (mst0_wuser    ),
        .m00_axi_wvalid   (mst0_wvalid   ),
        .m00_axi_wready   (mst0_wready   ),
        .m00_axi_bid      (mst0_bid      ),
        .m00_axi_bresp    (mst0_bresp    ),
        .m00_axi_buser    (mst0_buser    ),
        .m00_axi_bvalid   (mst0_bvalid   ),
        .m00_axi_bready   (mst0_bready   ),
        .m00_axi_arid     (mst0_arid     ),
        .m00_axi_araddr   (mst0_araddr   ),
        .m00_axi_arlen    (mst0_arlen    ),
        .m00_axi_arsize   (mst0_arsize   ),
        .m00_axi_arburst  (mst0_arburst  ),
        .m00_axi_arlock   (mst0_arlock   ),
        .m00_axi_arcache  (mst0_arcache  ),
        .m00_axi_arprot   (mst0_arprot   ),
        .m00_axi_arqos    (mst0_arqos    ),
        .m00_axi_arregion (mst0_arregion ),
        .m00_axi_aruser   (mst0_aruser   ),
        .m00_axi_arvalid  (mst0_arvalid  ),
        .m00_axi_arready  (mst0_arready  ),
        .m00_axi_rid      (mst0_rid      ),
        .m00_axi_rdata    (mst0_rdata    ),
        .m00_axi_rresp    (mst0_rresp    ),
        .m00_axi_rlast    (mst0_rlast    ),
        .m00_axi_ruser    (mst0_ruser    ),
        .m00_axi_rvalid   (mst0_rvalid   ),
        .m00_axi_rready   (mst0_rready   ),
        .m01_axi_awid     (mst1_awid     ),
        .m01_axi_awaddr   (mst1_awaddr   ),
        .m01_axi_awlen    (mst1_awlen    ),
        .m01_axi_awsize   (mst1_awsize   ),
        .m01_axi_awburst  (mst1_awburst  ),
        .m01_axi_awlock   (mst1_awlock   ),
        .m01_axi_awcache  (mst1_awcache  ),
        .m01_axi_awprot   (mst1_awprot   ),
        .m01_axi_awqos    (mst1_awqos    ),
        .m01_axi_awregion (mst1_awregion ),
        .m01_axi_awuser   (mst1_awuser   ),
        .m01_axi_awvalid  (mst1_awvalid  ),
        .m01_axi_awready  (mst1_awready  ),
        .m01_axi_wdata    (mst1_wdata    ),
        .m01_axi_wstrb    (mst1_wstrb    ),
        .m01_axi_wlast    (mst1_wlast    ),
        .m01_axi_wuser    (mst1_wuser    ),
        .m01_axi_wvalid   (mst1_wvalid   ),
        .m01_axi_wready   (mst1_wready   ),
        .m01_axi_bid      (mst1_bid      ),
        .m01_axi_bresp    (mst1_bresp    ),
        .m01_axi_buser    (mst1_buser    ),
        .m01_axi_bvalid   (mst1_bvalid   ),
        .m01_axi_bready   (mst1_bready   ),
        .m01_axi_arid     (mst1_arid     ),
        .m01_axi_araddr   (mst1_araddr   ),
        .m01_axi_arlen    (mst1_arlen    ),
        .m01_axi_arsize   (mst1_arsize   ),
        .m01_axi_arburst  (mst1_arburst  ),
        .m01_axi_arlock   (mst1_arlock   ),
        .m01_axi_arcache  (mst1_arcache  ),
        .m01_axi_arprot   (mst1_arprot   ),
        .m01_axi_arqos    (mst1_arqos    ),
        .m01_axi_arregion (mst1_arregion ),
        .m01_axi_aruser   (mst1_aruser   ),
        .m01_axi_arvalid  (mst1_arvalid  ),
        .m01_axi_arready  (mst1_arready  ),
        .m01_axi_rid      (mst1_rid      ),
        .m01_axi_rdata    (mst1_rdata    ),
        .m01_axi_rresp    (mst1_rresp    ),
        .m01_axi_rlast    (mst1_rlast    ),
        .m01_axi_ruser    (mst1_ruser    ),
        .m01_axi_rvalid   (mst1_rvalid   ),
        .m01_axi_rready   (mst1_rready   )
    );
endmodule