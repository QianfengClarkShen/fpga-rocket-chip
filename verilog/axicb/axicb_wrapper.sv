`timescale 1ps/1ps
`default_nettype none
module axicb_wrapper (
    input wire aclk,
    input wire aresetn,
    input wire [3:0] s_axi_awid,
    input wire [30:0] s_axi_awaddr,
    input wire [7:0] s_axi_awlen,
    input wire [2:0] s_axi_awsize,
    input wire [1:0] s_axi_awburst,
    input wire [0:0] s_axi_awlock,
    input wire [3:0] s_axi_awcache,
    input wire [2:0] s_axi_awprot,
    input wire [3:0] s_axi_awqos,
    input wire [0:0] s_axi_awvalid,
    output wire [0:0] s_axi_awready,
    input wire [63:0] s_axi_wdata,
    input wire [7:0] s_axi_wstrb,
    input wire [0:0] s_axi_wlast,
    input wire [0:0] s_axi_wvalid,
    output wire [0:0] s_axi_wready,
    output wire [3:0] s_axi_bid,
    output wire [1:0] s_axi_bresp,
    output wire [0:0] s_axi_bvalid,
    input wire [0:0] s_axi_bready,
    input wire [3:0] s_axi_arid,
    input wire [30:0] s_axi_araddr,
    input wire [7:0] s_axi_arlen,
    input wire [2:0] s_axi_arsize,
    input wire [1:0] s_axi_arburst,
    input wire [0:0] s_axi_arlock,
    input wire [3:0] s_axi_arcache,
    input wire [2:0] s_axi_arprot,
    input wire [3:0] s_axi_arqos,
    input wire [0:0] s_axi_arvalid,
    output wire [0:0] s_axi_arready,
    output wire [3:0] s_axi_rid,
    output wire [63:0] s_axi_rdata,
    output wire [1:0] s_axi_rresp,
    output wire [0:0] s_axi_rlast,
    output wire [0:0] s_axi_rvalid,
    input wire [0:0] s_axi_rready,
    output wire [7:0] m_axi_awid,
    output wire [61:0] m_axi_awaddr,
    output wire [15:0] m_axi_awlen,
    output wire [5:0] m_axi_awsize,
    output wire [3:0] m_axi_awburst,
    output wire [1:0] m_axi_awlock,
    output wire [7:0] m_axi_awcache,
    output wire [5:0] m_axi_awprot,
    output wire [7:0] m_axi_awregion,
    output wire [7:0] m_axi_awqos,
    output wire [1:0] m_axi_awvalid,
    input wire [1:0] m_axi_awready,
    output wire [127:0] m_axi_wdata,
    output wire [15:0] m_axi_wstrb,
    output wire [1:0] m_axi_wlast,
    output wire [1:0] m_axi_wvalid,
    input wire [1:0] m_axi_wready,
    input wire [7:0] m_axi_bid,
    input wire [3:0] m_axi_bresp,
    input wire [1:0] m_axi_bvalid,
    output wire [1:0] m_axi_bready,
    output wire [7:0] m_axi_arid,
    output wire [61:0] m_axi_araddr,
    output wire [15:0] m_axi_arlen,
    output wire [5:0] m_axi_arsize,
    output wire [3:0] m_axi_arburst,
    output wire [1:0] m_axi_arlock,
    output wire [7:0] m_axi_arcache,
    output wire [5:0] m_axi_arprot,
    output wire [7:0] m_axi_arregion,
    output wire [7:0] m_axi_arqos,
    output wire [1:0] m_axi_arvalid,
    input wire [1:0] m_axi_arready,
    input wire [7:0] m_axi_rid,
    input wire [127:0] m_axi_rdata,
    input wire [3:0] m_axi_rresp,
    input wire [1:0] m_axi_rlast,
    input wire [1:0] m_axi_rvalid,
    output wire [1:0] m_axi_rready
);

    logic slv0_awvalid;
    logic slv0_awready;
    logic [30:0] slv0_awaddr;
    logic [7:0] slv0_awlen;
    logic [2:0] slv0_awsize;
    logic [1:0] slv0_awburst;
    logic slv0_awlock;
    logic [3:0] slv0_awcache;
    logic [2:0] slv0_awprot;
    logic [3:0] slv0_awqos;
    logic [3:0] slv0_awregion;
    logic [3:0] slv0_awid;
    logic [0:0] slv0_awuser;
    logic slv0_wvalid;
    logic slv0_wready;
    logic slv0_wlast;
    logic [63:0] slv0_wdata;
    logic [7:0] slv0_wstrb;
    logic [0:0] slv0_wuser;
    logic slv0_bvalid;
    logic slv0_bready;
    logic [3:0] slv0_bid;
    logic [1:0] slv0_bresp;
    logic [0:0] slv0_buser;
    logic slv0_arvalid;
    logic slv0_arready;
    logic [30:0] slv0_araddr;
    logic [7:0] slv0_arlen;
    logic [2:0] slv0_arsize;
    logic [1:0] slv0_arburst;
    logic slv0_arlock;
    logic [3:0] slv0_arcache;
    logic [2:0] slv0_arprot;
    logic [3:0] slv0_arqos;
    logic [3:0] slv0_arregion;
    logic [3:0] slv0_arid;
    logic [0:0] slv0_aruser;
    logic slv0_rvalid;
    logic slv0_rready;
    logic [3:0] slv0_rid;
    logic [1:0] slv0_rresp;
    logic [63:0] slv0_rdata;
    logic slv0_rlast;
    logic [0:0] slv0_ruser;

    assign slv0_awvalid = s_axi_awvalid;
    assign s_axi_awready = slv0_awready;
    assign slv0_awaddr = s_axi_awaddr;
    assign slv0_awlen = s_axi_awlen;
    assign slv0_awsize = s_axi_awsize;
    assign slv0_awburst = s_axi_awburst;
    assign slv0_awlock = s_axi_awlock;
    assign slv0_awcache = s_axi_awcache;
    assign slv0_awprot = s_axi_awprot;
    assign slv0_awqos = s_axi_awqos;
    assign slv0_awregion = 4'b0;
    assign slv0_awid = s_axi_awid;
    assign slv0_awuser = 1'b0;

    assign slv0_wvalid = s_axi_wvalid;
    assign s_axi_wready = slv0_wready;
    assign slv0_wlast = s_axi_wlast;
    assign slv0_wdata = s_axi_wdata;
    assign slv0_wstrb = s_axi_wstrb;
    assign slv0_wuser = 1'b0;

    assign s_axi_bvalid = slv0_bvalid;
    assign slv0_bready = s_axi_bready;
    assign s_axi_bid = slv0_bid;
    assign s_axi_bresp = slv0_bresp;

    assign slv0_arvalid = s_axi_arvalid;
    assign s_axi_arready = slv0_arready;
    assign slv0_araddr = s_axi_araddr;
    assign slv0_arlen = s_axi_arlen;
    assign slv0_arsize = s_axi_arsize;
    assign slv0_arburst = s_axi_arburst;
    assign slv0_arlock = s_axi_arlock;
    assign slv0_arcache = s_axi_arcache;
    assign slv0_arprot = s_axi_arprot;
    assign slv0_arqos = s_axi_arqos;
    assign slv0_arregion = 4'b0;
    assign slv0_arid = s_axi_arid;
    assign slv0_aruser = 1'b0;

    assign s_axi_rvalid = slv0_rvalid;
    assign slv0_rready = s_axi_rready;
    assign s_axi_rid = slv0_rid;
    assign s_axi_rresp = slv0_rresp;
    assign s_axi_rdata = slv0_rdata;
    assign s_axi_rlast = slv0_rlast;

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

    logic slv1_awvalid;
    logic slv1_awready;
    logic [30:0] slv1_awaddr;
    logic [7:0] slv1_awlen;
    logic [2:0] slv1_awsize;
    logic [1:0] slv1_awburst;
    logic slv1_awlock;
    logic [3:0] slv1_awcache;
    logic [2:0] slv1_awprot;
    logic [3:0] slv1_awqos;
    logic [3:0] slv1_awregion;
    logic [3:0] slv1_awid;
    logic [0:0] slv1_awuser;
    logic slv1_wvalid;
    logic slv1_wready;
    logic slv1_wlast;
    logic [63:0] slv1_wdata;
    logic [7:0] slv1_wstrb;
    logic [0:0] slv1_wuser;
    logic slv1_bvalid;
    logic slv1_bready;
    logic [3:0] slv1_bid;
    logic [1:0] slv1_bresp;
    logic [0:0] slv1_buser;
    logic slv1_arvalid;
    logic slv1_arready;
    logic [30:0] slv1_araddr;
    logic [7:0] slv1_arlen;
    logic [2:0] slv1_arsize;
    logic [1:0] slv1_arburst;
    logic slv1_arlock;
    logic [3:0] slv1_arcache;
    logic [2:0] slv1_arprot;
    logic [3:0] slv1_arqos;
    logic [3:0] slv1_arregion;
    logic [3:0] slv1_arid;
    logic [0:0] slv1_aruser;
    logic slv1_rvalid;
    logic slv1_rready;
    logic [3:0] slv1_rid;
    logic [1:0] slv1_rresp;
    logic [63:0] slv1_rdata;
    logic slv1_rlast;
    logic [0:0] slv1_ruser;

    assign slv1_awvalid = 'b0;
    assign slv1_awaddr = 'b0;
    assign slv1_awlen = 'b0;
    assign slv1_awsize = 'b0;
    assign slv1_awburst = 'b0;
    assign slv1_awlock = 'b0;
    assign slv1_awcache = 'b0;
    assign slv1_awprot = 'b0;
    assign slv1_awqos = 'b0;
    assign slv1_awregion = 'b0;
    assign slv1_awid = 'b0;
    assign slv1_awuser = 'b0;

    assign slv1_wvalid = 'b0;
    assign slv1_wlast = 'b0;
    assign slv1_wdata = 'b0;
    assign slv1_wstrb = 'b0;
    assign slv1_wuser = 'b0;

    assign slv1_bready = 'b0;

    assign slv1_arvalid = 'b0;
    assign slv1_araddr = 'b0;
    assign slv1_arlen = 'b0;
    assign slv1_arsize = 'b0;
    assign slv1_arburst = 'b0;
    assign slv1_arlock = 'b0;
    assign slv1_arcache = 'b0;
    assign slv1_arprot = 'b0;
    assign slv1_arqos = 'b0;
    assign slv1_arregion = 'b0;
    assign slv1_arid = 'b0;
    assign slv1_aruser = 'b0;

    assign slv1_rready = 'b0;

    logic slv2_awvalid;
    logic slv2_awready;
    logic [30:0] slv2_awaddr;
    logic [7:0] slv2_awlen;
    logic [2:0] slv2_awsize;
    logic [1:0] slv2_awburst;
    logic slv2_awlock;
    logic [3:0] slv2_awcache;
    logic [2:0] slv2_awprot;
    logic [3:0] slv2_awqos;
    logic [3:0] slv2_awregion;
    logic [3:0] slv2_awid;
    logic [0:0] slv2_awuser;
    logic slv2_wvalid;
    logic slv2_wready;
    logic slv2_wlast;
    logic [63:0] slv2_wdata;
    logic [7:0] slv2_wstrb;
    logic [0:0] slv2_wuser;
    logic slv2_bvalid;
    logic slv2_bready;
    logic [3:0] slv2_bid;
    logic [1:0] slv2_bresp;
    logic [0:0] slv2_buser;
    logic slv2_arvalid;
    logic slv2_arready;
    logic [30:0] slv2_araddr;
    logic [7:0] slv2_arlen;
    logic [2:0] slv2_arsize;
    logic [1:0] slv2_arburst;
    logic slv2_arlock;
    logic [3:0] slv2_arcache;
    logic [2:0] slv2_arprot;
    logic [3:0] slv2_arqos;
    logic [3:0] slv2_arregion;
    logic [3:0] slv2_arid;
    logic [0:0] slv2_aruser;
    logic slv2_rvalid;
    logic slv2_rready;
    logic [3:0] slv2_rid;
    logic [1:0] slv2_rresp;
    logic [63:0] slv2_rdata;
    logic slv2_rlast;
    logic [0:0] slv2_ruser;

    assign slv2_awvalid = 'b0;
    assign slv2_awaddr = 'b0;
    assign slv2_awlen = 'b0;
    assign slv2_awsize = 'b0;
    assign slv2_awburst = 'b0;
    assign slv2_awlock = 'b0;
    assign slv2_awcache = 'b0;
    assign slv2_awprot = 'b0;
    assign slv2_awqos = 'b0;
    assign slv2_awregion = 'b0;
    assign slv2_awid = 'b0;
    assign slv2_awuser = 'b0;

    assign slv2_wvalid = 'b0;
    assign slv2_wlast = 'b0;
    assign slv2_wdata = 'b0;
    assign slv2_wstrb = 'b0;
    assign slv2_wuser = 'b0;

    assign slv2_bready = 'b0;

    assign slv2_arvalid = 'b0;
    assign slv2_araddr = 'b0;
    assign slv2_arlen = 'b0;
    assign slv2_arsize = 'b0;
    assign slv2_arburst = 'b0;
    assign slv2_arlock = 'b0;
    assign slv2_arcache = 'b0;
    assign slv2_arprot = 'b0;
    assign slv2_arqos = 'b0;
    assign slv2_arregion = 'b0;
    assign slv2_arid = 'b0;
    assign slv2_aruser = 'b0;

    assign slv2_rready = 'b0;

    logic slv3_awvalid;
    logic slv3_awready;
    logic [30:0] slv3_awaddr;
    logic [7:0] slv3_awlen;
    logic [2:0] slv3_awsize;
    logic [1:0] slv3_awburst;
    logic slv3_awlock;
    logic [3:0] slv3_awcache;
    logic [2:0] slv3_awprot;
    logic [3:0] slv3_awqos;
    logic [3:0] slv3_awregion;
    logic [3:0] slv3_awid;
    logic [0:0] slv3_awuser;
    logic slv3_wvalid;
    logic slv3_wready;
    logic slv3_wlast;
    logic [63:0] slv3_wdata;
    logic [7:0] slv3_wstrb;
    logic [0:0] slv3_wuser;
    logic slv3_bvalid;
    logic slv3_bready;
    logic [3:0] slv3_bid;
    logic [1:0] slv3_bresp;
    logic [0:0] slv3_buser;
    logic slv3_arvalid;
    logic slv3_arready;
    logic [30:0] slv3_araddr;
    logic [7:0] slv3_arlen;
    logic [2:0] slv3_arsize;
    logic [1:0] slv3_arburst;
    logic slv3_arlock;
    logic [3:0] slv3_arcache;
    logic [2:0] slv3_arprot;
    logic [3:0] slv3_arqos;
    logic [3:0] slv3_arregion;
    logic [3:0] slv3_arid;
    logic [0:0] slv3_aruser;
    logic slv3_rvalid;
    logic slv3_rready;
    logic [3:0] slv3_rid;
    logic [1:0] slv3_rresp;
    logic [63:0] slv3_rdata;
    logic slv3_rlast;
    logic [0:0] slv3_ruser;

    assign slv3_awvalid = 'b0;
    assign slv3_awaddr = 'b0;
    assign slv3_awlen = 'b0;
    assign slv3_awsize = 'b0;
    assign slv3_awburst = 'b0;
    assign slv3_awlock = 'b0;
    assign slv3_awcache = 'b0;
    assign slv3_awprot = 'b0;
    assign slv3_awqos = 'b0;
    assign slv3_awregion = 'b0;
    assign slv3_awid = 'b0;
    assign slv3_awuser = 'b0;

    assign slv3_wvalid = 'b0;
    assign slv3_wlast = 'b0;
    assign slv3_wdata = 'b0;
    assign slv3_wstrb = 'b0;
    assign slv3_wuser = 'b0;

    assign slv3_bready = 'b0;

    assign slv3_arvalid = 'b0;
    assign slv3_araddr = 'b0;
    assign slv3_arlen = 'b0;
    assign slv3_arsize = 'b0;
    assign slv3_arburst = 'b0;
    assign slv3_arlock = 'b0;
    assign slv3_arcache = 'b0;
    assign slv3_arprot = 'b0;
    assign slv3_arqos = 'b0;
    assign slv3_arregion = 'b0;
    assign slv3_arid = 'b0;
    assign slv3_aruser = 'b0;

    assign slv3_rready = 'b0;


    logic mst2_awvalid;
    logic mst2_awready;
    logic [30:0] mst2_awaddr;
    logic [7:0] mst2_awlen;
    logic [2:0] mst2_awsize;
    logic [1:0] mst2_awburst;
    logic mst2_awlock;
    logic [3:0] mst2_awcache;
    logic [2:0] mst2_awprot;
    logic [3:0] mst2_awqos;
    logic [3:0] mst2_awregion;
    logic [3:0] mst2_awid;
    logic [0:0] mst2_awuser;
    logic mst2_wvalid;
    logic mst2_wready;
    logic mst2_wlast;
    logic [63:0] mst2_wdata;
    logic [7:0] mst2_wstrb;
    logic [0:0] mst2_wuser;
    logic mst2_bvalid;
    logic mst2_bready;
    logic [3:0] mst2_bid;
    logic [1:0] mst2_bresp;
    logic [0:0] mst2_buser;
    logic mst2_arvalid;
    logic mst2_arready;
    logic [30:0] mst2_araddr;
    logic [7:0] mst2_arlen;
    logic [2:0] mst2_arsize;
    logic [1:0] mst2_arburst;
    logic mst2_arlock;
    logic [3:0] mst2_arcache;
    logic [2:0] mst2_arprot;
    logic [3:0] mst2_arqos;
    logic [3:0] mst2_arregion;
    logic [3:0] mst2_arid;
    logic [0:0] mst2_aruser;
    logic mst2_rvalid;
    logic mst2_rready;
    logic [3:0] mst2_rid;
    logic [1:0] mst2_rresp;
    logic [63:0] mst2_rdata;
    logic mst2_rlast;
    logic [0:0] mst2_ruser;

    assign mst2_awready = '1;

    assign mst2_wready = '1;

    assign mst2_bvalid = '0;
    assign mst2_bid = '0;
    assign mst2_bresp = '0;
    assign mst2_buser = '0;

    assign mst2_arready = '1;

    assign mst2_rvalid = '0;
    assign mst2_rid = '0;
    assign mst2_rresp = '0;
    assign mst2_rdata = '0;
    assign mst2_rlast = '0;
    assign mst2_ruser = '0;

    logic mst3_awvalid;
    logic mst3_awready;
    logic [30:0] mst3_awaddr;
    logic [7:0] mst3_awlen;
    logic [2:0] mst3_awsize;
    logic [1:0] mst3_awburst;
    logic mst3_awlock;
    logic [3:0] mst3_awcache;
    logic [2:0] mst3_awprot;
    logic [3:0] mst3_awqos;
    logic [3:0] mst3_awregion;
    logic [3:0] mst3_awid;
    logic [0:0] mst3_awuser;
    logic mst3_wvalid;
    logic mst3_wready;
    logic mst3_wlast;
    logic [63:0] mst3_wdata;
    logic [7:0] mst3_wstrb;
    logic [0:0] mst3_wuser;
    logic mst3_bvalid;
    logic mst3_bready;
    logic [3:0] mst3_bid;
    logic [1:0] mst3_bresp;
    logic [0:0] mst3_buser;
    logic mst3_arvalid;
    logic mst3_arready;
    logic [30:0] mst3_araddr;
    logic [7:0] mst3_arlen;
    logic [2:0] mst3_arsize;
    logic [1:0] mst3_arburst;
    logic mst3_arlock;
    logic [3:0] mst3_arcache;
    logic [2:0] mst3_arprot;
    logic [3:0] mst3_arqos;
    logic [3:0] mst3_arregion;
    logic [3:0] mst3_arid;
    logic [0:0] mst3_aruser;
    logic mst3_rvalid;
    logic mst3_rready;
    logic [3:0] mst3_rid;
    logic [1:0] mst3_rresp;
    logic [63:0] mst3_rdata;
    logic mst3_rlast;
    logic [0:0] mst3_ruser;

    assign mst3_awready = '1;

    assign mst3_wready = '1;

    assign mst3_bvalid = '0;
    assign mst3_bid = '0;
    assign mst3_bresp = '0;
    assign mst3_buser = '0;

    assign mst3_arready = '1;

    assign mst3_rvalid = '0;
    assign mst3_rid = '0;
    assign mst3_rresp = '0;
    assign mst3_rdata = '0;
    assign mst3_rlast = '0;
    assign mst3_ruser = '0;


    axicb_crossbar_top #(
        .AXI_ADDR_W          (31                  ),
        .AXI_ID_W            (4                   ),
        .AXI_DATA_W          (64                  ),
        .MST_NB              (4              ),
        .SLV_NB              (4              ),
        .AXI_SIGNALING       (1       ),
        .SLV0_START_ADDR     (32'h60000000     ),
        .SLV0_END_ADDR       (32'h6000FFFF     ),
        .SLV1_START_ADDR     (32'h60010000     ),
        .SLV1_END_ADDR       (32'h6001FFFF     )
    ) u_axicb_crossbar_top(
        .aclk          (aclk          ),
        .aresetn       (aresetn       ),
        .srst          (1'b0          ),
        .slv0_aclk     (aclk     ),
        .slv0_aresetn  (aresetn  ),
        .slv0_srst     (1'b0     ),
        .slv0_awvalid  (slv0_awvalid  ),
        .slv0_awready  (slv0_awready  ),
        .slv0_awaddr   (slv0_awaddr   ),
        .slv0_awlen    (slv0_awlen    ),
        .slv0_awsize   (slv0_awsize   ),
        .slv0_awburst  (slv0_awburst  ),
        .slv0_awlock   (slv0_awlock   ),
        .slv0_awcache  (slv0_awcache  ),
        .slv0_awprot   (slv0_awprot   ),
        .slv0_awqos    (slv0_awqos    ),
        .slv0_awregion (slv0_awregion ),
        .slv0_awid     (slv0_awid     ),
        .slv0_awuser   (slv0_awuser   ),
        .slv0_wvalid   (slv0_wvalid   ),
        .slv0_wready   (slv0_wready   ),
        .slv0_wlast    (slv0_wlast    ),
        .slv0_wdata    (slv0_wdata    ),
        .slv0_wstrb    (slv0_wstrb    ),
        .slv0_wuser    (slv0_wuser    ),
        .slv0_bvalid   (slv0_bvalid   ),
        .slv0_bready   (slv0_bready   ),
        .slv0_bid      (slv0_bid      ),
        .slv0_bresp    (slv0_bresp    ),
        .slv0_buser    (slv0_buser    ),
        .slv0_arvalid  (slv0_arvalid  ),
        .slv0_arready  (slv0_arready  ),
        .slv0_araddr   (slv0_araddr   ),
        .slv0_arlen    (slv0_arlen    ),
        .slv0_arsize   (slv0_arsize   ),
        .slv0_arburst  (slv0_arburst  ),
        .slv0_arlock   (slv0_arlock   ),
        .slv0_arcache  (slv0_arcache  ),
        .slv0_arprot   (slv0_arprot   ),
        .slv0_arqos    (slv0_arqos    ),
        .slv0_arregion (slv0_arregion ),
        .slv0_arid     (slv0_arid     ),
        .slv0_aruser   (slv0_aruser   ),
        .slv0_rvalid   (slv0_rvalid   ),
        .slv0_rready   (slv0_rready   ),
        .slv0_rid      (slv0_rid      ),
        .slv0_rresp    (slv0_rresp    ),
        .slv0_rdata    (slv0_rdata    ),
        .slv0_rlast    (slv0_rlast    ),
        .slv0_ruser    (slv0_ruser    ),
        .slv1_aclk     (aclk     ),
        .slv1_aresetn  (aresetn  ),
        .slv1_srst     (1'b0     ),
        .slv1_awvalid  (slv1_awvalid  ),
        .slv1_awready  (slv1_awready  ),
        .slv1_awaddr   (slv1_awaddr   ),
        .slv1_awlen    (slv1_awlen    ),
        .slv1_awsize   (slv1_awsize   ),
        .slv1_awburst  (slv1_awburst  ),
        .slv1_awlock   (slv1_awlock   ),
        .slv1_awcache  (slv1_awcache  ),
        .slv1_awprot   (slv1_awprot   ),
        .slv1_awqos    (slv1_awqos    ),
        .slv1_awregion (slv1_awregion ),
        .slv1_awid     (slv1_awid     ),
        .slv1_awuser   (slv1_awuser   ),
        .slv1_wvalid   (slv1_wvalid   ),
        .slv1_wready   (slv1_wready   ),
        .slv1_wlast    (slv1_wlast    ),
        .slv1_wdata    (slv1_wdata    ),
        .slv1_wstrb    (slv1_wstrb    ),
        .slv1_wuser    (slv1_wuser    ),
        .slv1_bvalid   (slv1_bvalid   ),
        .slv1_bready   (slv1_bready   ),
        .slv1_bid      (slv1_bid      ),
        .slv1_bresp    (slv1_bresp    ),
        .slv1_buser    (slv1_buser    ),
        .slv1_arvalid  (slv1_arvalid  ),
        .slv1_arready  (slv1_arready  ),
        .slv1_araddr   (slv1_araddr   ),
        .slv1_arlen    (slv1_arlen    ),
        .slv1_arsize   (slv1_arsize   ),
        .slv1_arburst  (slv1_arburst  ),
        .slv1_arlock   (slv1_arlock   ),
        .slv1_arcache  (slv1_arcache  ),
        .slv1_arprot   (slv1_arprot   ),
        .slv1_arqos    (slv1_arqos    ),
        .slv1_arregion (slv1_arregion ),
        .slv1_arid     (slv1_arid     ),
        .slv1_aruser   (slv1_aruser   ),
        .slv1_rvalid   (slv1_rvalid   ),
        .slv1_rready   (slv1_rready   ),
        .slv1_rid      (slv1_rid      ),
        .slv1_rresp    (slv1_rresp    ),
        .slv1_rdata    (slv1_rdata    ),
        .slv1_rlast    (slv1_rlast    ),
        .slv1_ruser    (slv1_ruser    ),
        .slv2_aclk     (aclk     ),
        .slv2_aresetn  (aresetn  ),
        .slv2_srst     (1'b0     ),
        .slv2_awvalid  (slv2_awvalid  ),
        .slv2_awready  (slv2_awready  ),
        .slv2_awaddr   (slv2_awaddr   ),
        .slv2_awlen    (slv2_awlen    ),
        .slv2_awsize   (slv2_awsize   ),
        .slv2_awburst  (slv2_awburst  ),
        .slv2_awlock   (slv2_awlock   ),
        .slv2_awcache  (slv2_awcache  ),
        .slv2_awprot   (slv2_awprot   ),
        .slv2_awqos    (slv2_awqos    ),
        .slv2_awregion (slv2_awregion ),
        .slv2_awid     (slv2_awid     ),
        .slv2_awuser   (slv2_awuser   ),
        .slv2_wvalid   (slv2_wvalid   ),
        .slv2_wready   (slv2_wready   ),
        .slv2_wlast    (slv2_wlast    ),
        .slv2_wdata    (slv2_wdata    ),
        .slv2_wstrb    (slv2_wstrb    ),
        .slv2_wuser    (slv2_wuser    ),
        .slv2_bvalid   (slv2_bvalid   ),
        .slv2_bready   (slv2_bready   ),
        .slv2_bid      (slv2_bid      ),
        .slv2_bresp    (slv2_bresp    ),
        .slv2_buser    (slv2_buser    ),
        .slv2_arvalid  (slv2_arvalid  ),
        .slv2_arready  (slv2_arready  ),
        .slv2_araddr   (slv2_araddr   ),
        .slv2_arlen    (slv2_arlen    ),
        .slv2_arsize   (slv2_arsize   ),
        .slv2_arburst  (slv2_arburst  ),
        .slv2_arlock   (slv2_arlock   ),
        .slv2_arcache  (slv2_arcache  ),
        .slv2_arprot   (slv2_arprot   ),
        .slv2_arqos    (slv2_arqos    ),
        .slv2_arregion (slv2_arregion ),
        .slv2_arid     (slv2_arid     ),
        .slv2_aruser   (slv2_aruser   ),
        .slv2_rvalid   (slv2_rvalid   ),
        .slv2_rready   (slv2_rready   ),
        .slv2_rid      (slv2_rid      ),
        .slv2_rresp    (slv2_rresp    ),
        .slv2_rdata    (slv2_rdata    ),
        .slv2_rlast    (slv2_rlast    ),
        .slv2_ruser    (slv2_ruser    ),
        .slv3_aclk     (aclk     ),
        .slv3_aresetn  (aresetn  ),
        .slv3_srst     (1'b0     ),
        .slv3_awvalid  (slv3_awvalid  ),
        .slv3_awready  (slv3_awready  ),
        .slv3_awaddr   (slv3_awaddr   ),
        .slv3_awlen    (slv3_awlen    ),
        .slv3_awsize   (slv3_awsize   ),
        .slv3_awburst  (slv3_awburst  ),
        .slv3_awlock   (slv3_awlock   ),
        .slv3_awcache  (slv3_awcache  ),
        .slv3_awprot   (slv3_awprot   ),
        .slv3_awqos    (slv3_awqos    ),
        .slv3_awregion (slv3_awregion ),
        .slv3_awid     (slv3_awid     ),
        .slv3_awuser   (slv3_awuser   ),
        .slv3_wvalid   (slv3_wvalid   ),
        .slv3_wready   (slv3_wready   ),
        .slv3_wlast    (slv3_wlast    ),
        .slv3_wdata    (slv3_wdata    ),
        .slv3_wstrb    (slv3_wstrb    ),
        .slv3_wuser    (slv3_wuser    ),
        .slv3_bvalid   (slv3_bvalid   ),
        .slv3_bready   (slv3_bready   ),
        .slv3_bid      (slv3_bid      ),
        .slv3_bresp    (slv3_bresp    ),
        .slv3_buser    (slv3_buser    ),
        .slv3_arvalid  (slv3_arvalid  ),
        .slv3_arready  (slv3_arready  ),
        .slv3_araddr   (slv3_araddr   ),
        .slv3_arlen    (slv3_arlen    ),
        .slv3_arsize   (slv3_arsize   ),
        .slv3_arburst  (slv3_arburst  ),
        .slv3_arlock   (slv3_arlock   ),
        .slv3_arcache  (slv3_arcache  ),
        .slv3_arprot   (slv3_arprot   ),
        .slv3_arqos    (slv3_arqos    ),
        .slv3_arregion (slv3_arregion ),
        .slv3_arid     (slv3_arid     ),
        .slv3_aruser   (slv3_aruser   ),
        .slv3_rvalid   (slv3_rvalid   ),
        .slv3_rready   (slv3_rready   ),
        .slv3_rid      (slv3_rid      ),
        .slv3_rresp    (slv3_rresp    ),
        .slv3_rdata    (slv3_rdata    ),
        .slv3_rlast    (slv3_rlast    ),
        .slv3_ruser    (slv3_ruser    ),
        .mst0_aclk     (aclk     ),
        .mst0_aresetn  (aresetn  ),
        .mst0_srst     (1'b0     ),
        .mst0_awvalid  (mst0_awvalid  ),
        .mst0_awready  (mst0_awready  ),
        .mst0_awaddr   (mst0_awaddr   ),
        .mst0_awlen    (mst0_awlen    ),
        .mst0_awsize   (mst0_awsize   ),
        .mst0_awburst  (mst0_awburst  ),
        .mst0_awlock   (mst0_awlock   ),
        .mst0_awcache  (mst0_awcache  ),
        .mst0_awprot   (mst0_awprot   ),
        .mst0_awqos    (mst0_awqos    ),
        .mst0_awregion (mst0_awregion ),
        .mst0_awid     (mst0_awid     ),
        .mst0_awuser   (mst0_awuser   ),
        .mst0_wvalid   (mst0_wvalid   ),
        .mst0_wready   (mst0_wready   ),
        .mst0_wlast    (mst0_wlast    ),
        .mst0_wdata    (mst0_wdata    ),
        .mst0_wstrb    (mst0_wstrb    ),
        .mst0_wuser    (mst0_wuser    ),
        .mst0_bvalid   (mst0_bvalid   ),
        .mst0_bready   (mst0_bready   ),
        .mst0_bid      (mst0_bid      ),
        .mst0_bresp    (mst0_bresp    ),
        .mst0_buser    (mst0_buser    ),
        .mst0_arvalid  (mst0_arvalid  ),
        .mst0_arready  (mst0_arready  ),
        .mst0_araddr   (mst0_araddr   ),
        .mst0_arlen    (mst0_arlen    ),
        .mst0_arsize   (mst0_arsize   ),
        .mst0_arburst  (mst0_arburst  ),
        .mst0_arlock   (mst0_arlock   ),
        .mst0_arcache  (mst0_arcache  ),
        .mst0_arprot   (mst0_arprot   ),
        .mst0_arqos    (mst0_arqos    ),
        .mst0_arregion (mst0_arregion ),
        .mst0_arid     (mst0_arid     ),
        .mst0_aruser   (mst0_aruser   ),
        .mst0_rvalid   (mst0_rvalid   ),
        .mst0_rready   (mst0_rready   ),
        .mst0_rid      (mst0_rid      ),
        .mst0_rresp    (mst0_rresp    ),
        .mst0_rdata    (mst0_rdata    ),
        .mst0_rlast    (mst0_rlast    ),
        .mst0_ruser    (mst0_ruser    ),
        .mst1_aclk     (aclk     ),
        .mst1_aresetn  (aresetn  ),
        .mst1_srst     (1'b0     ),
        .mst1_awvalid  (mst1_awvalid  ),
        .mst1_awready  (mst1_awready  ),
        .mst1_awaddr   (mst1_awaddr   ),
        .mst1_awlen    (mst1_awlen    ),
        .mst1_awsize   (mst1_awsize   ),
        .mst1_awburst  (mst1_awburst  ),
        .mst1_awlock   (mst1_awlock   ),
        .mst1_awcache  (mst1_awcache  ),
        .mst1_awprot   (mst1_awprot   ),
        .mst1_awqos    (mst1_awqos    ),
        .mst1_awregion (mst1_awregion ),
        .mst1_awid     (mst1_awid     ),
        .mst1_awuser   (mst1_awuser   ),
        .mst1_wvalid   (mst1_wvalid   ),
        .mst1_wready   (mst1_wready   ),
        .mst1_wlast    (mst1_wlast    ),
        .mst1_wdata    (mst1_wdata    ),
        .mst1_wstrb    (mst1_wstrb    ),
        .mst1_wuser    (mst1_wuser    ),
        .mst1_bvalid   (mst1_bvalid   ),
        .mst1_bready   (mst1_bready   ),
        .mst1_bid      (mst1_bid      ),
        .mst1_bresp    (mst1_bresp    ),
        .mst1_buser    (mst1_buser    ),
        .mst1_arvalid  (mst1_arvalid  ),
        .mst1_arready  (mst1_arready  ),
        .mst1_araddr   (mst1_araddr   ),
        .mst1_arlen    (mst1_arlen    ),
        .mst1_arsize   (mst1_arsize   ),
        .mst1_arburst  (mst1_arburst  ),
        .mst1_arlock   (mst1_arlock   ),
        .mst1_arcache  (mst1_arcache  ),
        .mst1_arprot   (mst1_arprot   ),
        .mst1_arqos    (mst1_arqos    ),
        .mst1_arregion (mst1_arregion ),
        .mst1_arid     (mst1_arid     ),
        .mst1_aruser   (mst1_aruser   ),
        .mst1_rvalid   (mst1_rvalid   ),
        .mst1_rready   (mst1_rready   ),
        .mst1_rid      (mst1_rid      ),
        .mst1_rresp    (mst1_rresp    ),
        .mst1_rdata    (mst1_rdata    ),
        .mst1_rlast    (mst1_rlast    ),
        .mst1_ruser    (mst1_ruser    ),
        .mst2_aclk     (aclk     ),
        .mst2_aresetn  (aresetn  ),
        .mst2_srst     (1'b0     ),
        .mst2_awvalid  (mst2_awvalid  ),
        .mst2_awready  (mst2_awready  ),
        .mst2_awaddr   (mst2_awaddr   ),
        .mst2_awlen    (mst2_awlen    ),
        .mst2_awsize   (mst2_awsize   ),
        .mst2_awburst  (mst2_awburst  ),
        .mst2_awlock   (mst2_awlock   ),
        .mst2_awcache  (mst2_awcache  ),
        .mst2_awprot   (mst2_awprot   ),
        .mst2_awqos    (mst2_awqos    ),
        .mst2_awregion (mst2_awregion ),
        .mst2_awid     (mst2_awid     ),
        .mst2_awuser   (mst2_awuser   ),
        .mst2_wvalid   (mst2_wvalid   ),
        .mst2_wready   (mst2_wready   ),
        .mst2_wlast    (mst2_wlast    ),
        .mst2_wdata    (mst2_wdata    ),
        .mst2_wstrb    (mst2_wstrb    ),
        .mst2_wuser    (mst2_wuser    ),
        .mst2_bvalid   (mst2_bvalid   ),
        .mst2_bready   (mst2_bready   ),
        .mst2_bid      (mst2_bid      ),
        .mst2_bresp    (mst2_bresp    ),
        .mst2_buser    (mst2_buser    ),
        .mst2_arvalid  (mst2_arvalid  ),
        .mst2_arready  (mst2_arready  ),
        .mst2_araddr   (mst2_araddr   ),
        .mst2_arlen    (mst2_arlen    ),
        .mst2_arsize   (mst2_arsize   ),
        .mst2_arburst  (mst2_arburst  ),
        .mst2_arlock   (mst2_arlock   ),
        .mst2_arcache  (mst2_arcache  ),
        .mst2_arprot   (mst2_arprot   ),
        .mst2_arqos    (mst2_arqos    ),
        .mst2_arregion (mst2_arregion ),
        .mst2_arid     (mst2_arid     ),
        .mst2_aruser   (mst2_aruser   ),
        .mst2_rvalid   (mst2_rvalid   ),
        .mst2_rready   (mst2_rready   ),
        .mst2_rid      (mst2_rid      ),
        .mst2_rresp    (mst2_rresp    ),
        .mst2_rdata    (mst2_rdata    ),
        .mst2_rlast    (mst2_rlast    ),
        .mst2_ruser    (mst2_ruser    ),
        .mst3_aclk     (aclk     ),
        .mst3_aresetn  (aresetn  ),
        .mst3_srst     (1'b0     ),
        .mst3_awvalid  (mst3_awvalid  ),
        .mst3_awready  (mst3_awready  ),
        .mst3_awaddr   (mst3_awaddr   ),
        .mst3_awlen    (mst3_awlen    ),
        .mst3_awsize   (mst3_awsize   ),
        .mst3_awburst  (mst3_awburst  ),
        .mst3_awlock   (mst3_awlock   ),
        .mst3_awcache  (mst3_awcache  ),
        .mst3_awprot   (mst3_awprot   ),
        .mst3_awqos    (mst3_awqos    ),
        .mst3_awregion (mst3_awregion ),
        .mst3_awid     (mst3_awid     ),
        .mst3_awuser   (mst3_awuser   ),
        .mst3_wvalid   (mst3_wvalid   ),
        .mst3_wready   (mst3_wready   ),
        .mst3_wlast    (mst3_wlast    ),
        .mst3_wdata    (mst3_wdata    ),
        .mst3_wstrb    (mst3_wstrb    ),
        .mst3_wuser    (mst3_wuser    ),
        .mst3_bvalid   (mst3_bvalid   ),
        .mst3_bready   (mst3_bready   ),
        .mst3_bid      (mst3_bid      ),
        .mst3_bresp    (mst3_bresp    ),
        .mst3_buser    (mst3_buser    ),
        .mst3_arvalid  (mst3_arvalid  ),
        .mst3_arready  (mst3_arready  ),
        .mst3_araddr   (mst3_araddr   ),
        .mst3_arlen    (mst3_arlen    ),
        .mst3_arsize   (mst3_arsize   ),
        .mst3_arburst  (mst3_arburst  ),
        .mst3_arlock   (mst3_arlock   ),
        .mst3_arcache  (mst3_arcache  ),
        .mst3_arprot   (mst3_arprot   ),
        .mst3_arqos    (mst3_arqos    ),
        .mst3_arregion (mst3_arregion ),
        .mst3_arid     (mst3_arid     ),
        .mst3_aruser   (mst3_aruser   ),
        .mst3_rvalid   (mst3_rvalid   ),
        .mst3_rready   (mst3_rready   ),
        .mst3_rid      (mst3_rid      ),
        .mst3_rresp    (mst3_rresp    ),
        .mst3_rdata    (mst3_rdata    ),
        .mst3_rlast    (mst3_rlast    ),
        .mst3_ruser    (mst3_ruser    )
    );
endmodule

`resetall
