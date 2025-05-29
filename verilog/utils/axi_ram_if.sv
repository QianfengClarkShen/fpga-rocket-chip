`timescale 1ps/1ps
`default_nettype
module axi_ram_if # (
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 16,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 8,
    // Propagate awuser signal
    parameter AWUSER_ENABLE = 0,
    // Width of awuser signal
    parameter AWUSER_WIDTH = 1,
    // Propagate wuser signal
    parameter WUSER_ENABLE = 0,
    // Width of wuser signal
    parameter WUSER_WIDTH = 1,
    // Propagate buser signal
    parameter BUSER_ENABLE = 0,
    // Width of buser signal
    parameter BUSER_WIDTH = 1,
    // Propagate aruser signal
    parameter ARUSER_ENABLE = 0,
    // Width of aruser signal
    parameter ARUSER_WIDTH = 1,
    // Propagate ruser signal
    parameter RUSER_ENABLE = 0,
    // Width of ruser signal
    parameter RUSER_WIDTH = 1,
    // Width of auser output
    parameter AUSER_WIDTH = (ARUSER_ENABLE && (!AWUSER_ENABLE || ARUSER_WIDTH > AWUSER_WIDTH)) ? ARUSER_WIDTH : AWUSER_WIDTH,
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0,
    // Interleave read and write burst cycles
    parameter INTERLEAVE = 0
) (
    input  logic                     clk,
    input  logic                     rst,

    input  logic [ID_WIDTH-1:0]      s_axi_awid,
    input  logic [ADDR_WIDTH-1:0]    s_axi_awaddr,
    input  logic [7:0]               s_axi_awlen,
    input  logic [2:0]               s_axi_awsize,
    input  logic [1:0]               s_axi_awburst,
    input  logic                     s_axi_awlock,
    input  logic [3:0]               s_axi_awcache,
    input  logic [2:0]               s_axi_awprot,
    input  logic [3:0]               s_axi_awqos,
    input  logic [3:0]               s_axi_awregion,
    input  logic [AWUSER_WIDTH-1:0]  s_axi_awuser,
    input  logic                     s_axi_awvalid,
    output logic                     s_axi_awready,
    input  logic [DATA_WIDTH-1:0]    s_axi_wdata,
    input  logic [STRB_WIDTH-1:0]    s_axi_wstrb,
    input  logic                     s_axi_wlast,
    input  logic [WUSER_WIDTH-1:0]   s_axi_wuser,
    input  logic                     s_axi_wvalid,
    output logic                     s_axi_wready,
    output logic [ID_WIDTH-1:0]      s_axi_bid,
    output logic [1:0]               s_axi_bresp,
    output logic [BUSER_WIDTH-1:0]   s_axi_buser,
    output logic                     s_axi_bvalid,
    input  logic                     s_axi_bready,
    input  logic [ID_WIDTH-1:0]      s_axi_arid,
    input  logic [ADDR_WIDTH-1:0]    s_axi_araddr,
    input  logic [7:0]               s_axi_arlen,
    input  logic [2:0]               s_axi_arsize,
    input  logic [1:0]               s_axi_arburst,
    input  logic                     s_axi_arlock,
    input  logic [3:0]               s_axi_arcache,
    input  logic [2:0]               s_axi_arprot,
    input  logic [3:0]               s_axi_arqos,
    input  logic [3:0]               s_axi_arregion,
    input  logic [ARUSER_WIDTH-1:0]  s_axi_aruser,
    input  logic                     s_axi_arvalid,
    output logic                     s_axi_arready,
    output logic [ID_WIDTH-1:0]      s_axi_rid,
    output logic [DATA_WIDTH-1:0]    s_axi_rdata,
    output logic [1:0]               s_axi_rresp,
    output logic                     s_axi_rlast,
    output logic [RUSER_WIDTH-1:0]   s_axi_ruser,
    output logic                     s_axi_rvalid,
    input  logic                     s_axi_rready
);

    logic [ID_WIDTH-1:0]      ram_cmd_id;
    logic [ADDR_WIDTH-1:0]    ram_cmd_addr;
    logic                     ram_cmd_lock;
    logic [3:0]               ram_cmd_cache;
    logic [2:0]               ram_cmd_prot;
    logic [3:0]               ram_cmd_qos;
    logic [3:0]               ram_cmd_region;
    logic [AUSER_WIDTH-1:0]   ram_cmd_auser;
    logic [DATA_WIDTH-1:0]    ram_cmd_wr_data;
    logic [STRB_WIDTH-1:0]    ram_cmd_wr_strb;
    logic [WUSER_WIDTH-1:0]   ram_cmd_wr_user;
    logic                     ram_cmd_wr_en;
    logic                     ram_cmd_rd_en;
    logic                     ram_cmd_last;
    logic                     ram_cmd_ready;
    logic [ID_WIDTH-1:0]      ram_rd_resp_id;
    logic [DATA_WIDTH-1:0]    ram_rd_resp_data;
    logic                     ram_rd_resp_last;
    logic [RUSER_WIDTH-1:0]   ram_rd_resp_user;
    logic                     ram_rd_resp_valid;
    logic                     ram_rd_resp_ready;

    axi_ram_wr_rd_if #(
        .DATA_WIDTH      (DATA_WIDTH      ),
        .ADDR_WIDTH      (ADDR_WIDTH      ),
        .STRB_WIDTH      (STRB_WIDTH      ),
        .ID_WIDTH        (ID_WIDTH        ),
        .AWUSER_ENABLE   (AWUSER_ENABLE   ),
        .AWUSER_WIDTH    (AWUSER_WIDTH    ),
        .WUSER_ENABLE    (WUSER_ENABLE    ),
        .WUSER_WIDTH     (WUSER_WIDTH     ),
        .BUSER_ENABLE    (BUSER_ENABLE    ),
        .BUSER_WIDTH     (BUSER_WIDTH     ),
        .ARUSER_ENABLE   (ARUSER_ENABLE   ),
        .ARUSER_WIDTH    (ARUSER_WIDTH    ),
        .RUSER_ENABLE    (RUSER_ENABLE    ),
        .RUSER_WIDTH     (RUSER_WIDTH     ),
        .AUSER_WIDTH     (AUSER_WIDTH     ),
        .PIPELINE_OUTPUT (PIPELINE_OUTPUT ),
        .INTERLEAVE      (INTERLEAVE      )
    ) u_axi_ram_wr_rd_if(
        .clk               (clk               ),
        .rst               (rst               ),
        .s_axi_awid        (s_axi_awid        ),
        .s_axi_awaddr      (s_axi_awaddr      ),
        .s_axi_awlen       (s_axi_awlen       ),
        .s_axi_awsize      (s_axi_awsize      ),
        .s_axi_awburst     (s_axi_awburst     ),
        .s_axi_awlock      (s_axi_awlock      ),
        .s_axi_awcache     (s_axi_awcache     ),
        .s_axi_awprot      (s_axi_awprot      ),
        .s_axi_awqos       (s_axi_awqos       ),
        .s_axi_awregion    (s_axi_awregion    ),
        .s_axi_awuser      (s_axi_awuser      ),
        .s_axi_awvalid     (s_axi_awvalid     ),
        .s_axi_awready     (s_axi_awready     ),
        .s_axi_wdata       (s_axi_wdata       ),
        .s_axi_wstrb       (s_axi_wstrb       ),
        .s_axi_wlast       (s_axi_wlast       ),
        .s_axi_wuser       (s_axi_wuser       ),
        .s_axi_wvalid      (s_axi_wvalid      ),
        .s_axi_wready      (s_axi_wready      ),
        .s_axi_bid         (s_axi_bid         ),
        .s_axi_bresp       (s_axi_bresp       ),
        .s_axi_buser       (s_axi_buser       ),
        .s_axi_bvalid      (s_axi_bvalid      ),
        .s_axi_bready      (s_axi_bready      ),
        .s_axi_arid        (s_axi_arid        ),
        .s_axi_araddr      (s_axi_araddr      ),
        .s_axi_arlen       (s_axi_arlen       ),
        .s_axi_arsize      (s_axi_arsize      ),
        .s_axi_arburst     (s_axi_arburst     ),
        .s_axi_arlock      (s_axi_arlock      ),
        .s_axi_arcache     (s_axi_arcache     ),
        .s_axi_arprot      (s_axi_arprot      ),
        .s_axi_arqos       (s_axi_arqos       ),
        .s_axi_arregion    (s_axi_arregion    ),
        .s_axi_aruser      (s_axi_aruser      ),
        .s_axi_arvalid     (s_axi_arvalid     ),
        .s_axi_arready     (s_axi_arready     ),
        .s_axi_rid         (s_axi_rid         ),
        .s_axi_rdata       (s_axi_rdata       ),
        .s_axi_rresp       (s_axi_rresp       ),
        .s_axi_rlast       (s_axi_rlast       ),
        .s_axi_ruser       (s_axi_ruser       ),
        .s_axi_rvalid      (s_axi_rvalid      ),
        .s_axi_rready      (s_axi_rready      ),
        .ram_cmd_id        (                  ),
        .ram_cmd_addr      (      ),
        .ram_cmd_lock      (      ),
        .ram_cmd_cache     (     ),
        .ram_cmd_prot      (      ),
        .ram_cmd_qos       (       ),
        .ram_cmd_region    (    ),
        .ram_cmd_auser     (     ),
        .ram_cmd_wr_data   (ram_cmd_wr_data   ),
        .ram_cmd_wr_strb   (ram_cmd_wr_strb   ),
        .ram_cmd_wr_user   (   ),
        .ram_cmd_wr_en     (ram_cmd_wr_en     ),
        .ram_cmd_rd_en     (ram_cmd_rd_en     ),
        .ram_cmd_last      (     ),
        .ram_cmd_ready     (ram_cmd_ready     ),
        .ram_rd_resp_id    ('b0    ),
        .ram_rd_resp_data  (ram_rd_resp_data  ),
        .ram_rd_resp_last  (ram_rd_resp_last  ),
        .ram_rd_resp_user  ('b0  ),
        .ram_rd_resp_valid (ram_rd_resp_valid ),
        .ram_rd_resp_ready (ram_rd_resp_ready )
    );


endmodule


`resetall