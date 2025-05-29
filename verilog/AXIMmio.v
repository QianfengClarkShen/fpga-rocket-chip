 module AXIMmio (
   input clock,
   input reset,

   input uart_RX,
   output uart_TX,

   output        io_axi4_0_aw_ready,
   input         io_axi4_0_aw_valid,
   input  [3:0]  io_axi4_0_aw_id,
   input  [30:0] io_axi4_0_aw_addr,
   input  [7:0]  io_axi4_0_aw_len,
   input  [2:0]  io_axi4_0_aw_size,
   input  [1:0]  io_axi4_0_aw_burst,
   output        io_axi4_0_w_ready,
   input         io_axi4_0_w_valid,
   input  [63:0] io_axi4_0_w_data,
   input  [7:0]  io_axi4_0_w_strb,
   input         io_axi4_0_w_last,
   input         io_axi4_0_b_ready,
   output        io_axi4_0_b_valid,
   output [3:0]  io_axi4_0_b_id,
   output [1:0]  io_axi4_0_b_resp,
   output        io_axi4_0_ar_ready,
   input         io_axi4_0_ar_valid,
   input  [3:0]  io_axi4_0_ar_id,
   input  [30:0] io_axi4_0_ar_addr,
   input  [7:0]  io_axi4_0_ar_len,
   input  [2:0]  io_axi4_0_ar_size,
   input  [1:0]  io_axi4_0_ar_burst,
   input         io_axi4_0_r_ready,
   output        io_axi4_0_r_valid,
   output [3:0]  io_axi4_0_r_id,
   output [63:0] io_axi4_0_r_data,
   output [1:0]  io_axi4_0_r_resp,
   output        io_axi4_0_r_last,

   output        interrupt_uart
 );

   wire resetn;
   assign resetn = ~ reset;

   //crossbar IP  Slave1-uart Slave2-BRAM Slave3-SPI, they have been merged into one bundle in the stupid IP
   wire [2:0]      peribundle_axi4_aw_ready;
   wire [2:0]      peribundle_axi4_aw_valid;
   wire [11:0]     peribundle_axi4_aw_id;
   wire [92:0]     peribundle_axi4_aw_addr;
   wire [23:0]     peribundle_axi4_aw_len;
   wire [8:0]      peribundle_axi4_aw_size;
   wire [5:0]      peribundle_axi4_aw_burst;
   wire [2:0]      peribundle_axi4_w_ready;
   wire [2:0]      peribundle_axi4_w_valid;
   wire [191:0]    peribundle_axi4_w_data;
   wire [23:0]     peribundle_axi4_w_strb;
   wire [2:0]      peribundle_axi4_w_last;
   wire [2:0]      peribundle_axi4_b_ready;
   wire [2:0]      peribundle_axi4_b_valid;
   wire [11:0]     peribundle_axi4_b_id;
   wire [5:0]      peribundle_axi4_b_resp;
   wire [2:0]      peribundle_axi4_ar_ready;
   wire [2:0]      peribundle_axi4_ar_valid;
   wire [11:0]     peribundle_axi4_ar_id;
   wire [92:0]     peribundle_axi4_ar_addr;
   wire [23:0]     peribundle_axi4_ar_len;
   wire [8:0]      peribundle_axi4_ar_size;
   wire [5:0]      peribundle_axi4_ar_burst;
   wire [2:0]      peribundle_axi4_r_ready;
   wire [2:0]      peribundle_axi4_r_valid;
   wire [11:0]     peribundle_axi4_r_id;
   wire [191:0]    peribundle_axi4_r_data;
   wire [5:0]      peribundle_axi4_r_resp;
   wire [2:0]      peribundle_axi4_r_last;

   axicb_wrapper peri_Xbar(
       .aclk           (clock),
       .aresetn        (resetn),

       .s_axi_awid     (io_axi4_0_aw_id),
       .s_axi_awaddr   (io_axi4_0_aw_addr),
       .s_axi_awlen    (io_axi4_0_aw_len),
       .s_axi_awsize   (io_axi4_0_aw_size),
       .s_axi_awburst  (io_axi4_0_aw_burst),
       .s_axi_awvalid  (io_axi4_0_aw_valid),
       .s_axi_awready  (io_axi4_0_aw_ready),
       .s_axi_wdata    (io_axi4_0_w_data),
       .s_axi_wstrb    (io_axi4_0_w_strb),
       .s_axi_wlast    (io_axi4_0_w_last),
       .s_axi_wvalid   (io_axi4_0_w_valid),
       .s_axi_wready   (io_axi4_0_w_ready),
       .s_axi_bid      (io_axi4_0_b_id),
       .s_axi_bresp    (io_axi4_0_b_resp),
       .s_axi_bvalid   (io_axi4_0_b_valid),
       .s_axi_bready   (io_axi4_0_b_ready),
       .s_axi_arid     (io_axi4_0_ar_id),
       .s_axi_araddr   (io_axi4_0_ar_addr),
       .s_axi_arlen    (io_axi4_0_ar_len),
       .s_axi_arsize   (io_axi4_0_ar_size),
       .s_axi_arburst  (io_axi4_0_ar_burst),
       .s_axi_arvalid  (io_axi4_0_ar_valid),
       .s_axi_arready  (io_axi4_0_ar_ready),
       .s_axi_rid      (io_axi4_0_r_id),
       .s_axi_rdata    (io_axi4_0_r_data),
       .s_axi_rresp    (io_axi4_0_r_resp),
       .s_axi_rlast    (io_axi4_0_r_last),
       .s_axi_rvalid   (io_axi4_0_r_valid),
       .s_axi_rready   (io_axi4_0_r_ready),

       .m_axi_awid     (peribundle_axi4_aw_id),
       .m_axi_awaddr   (peribundle_axi4_aw_addr),
       .m_axi_awlen    (peribundle_axi4_aw_len),
       .m_axi_awsize   (peribundle_axi4_aw_size),
       .m_axi_awburst  (peribundle_axi4_aw_burst),
       .m_axi_awvalid  (peribundle_axi4_aw_valid),
       .m_axi_awready  (peribundle_axi4_aw_ready),
       .m_axi_wdata    (peribundle_axi4_w_data),
       .m_axi_wstrb    (peribundle_axi4_w_strb),
       .m_axi_wlast    (peribundle_axi4_w_last),
       .m_axi_wvalid   (peribundle_axi4_w_valid),
       .m_axi_wready   (peribundle_axi4_w_ready),
       .m_axi_bid      (peribundle_axi4_b_id),
       .m_axi_bresp    (peribundle_axi4_b_resp),
       .m_axi_bvalid   (peribundle_axi4_b_valid),
       .m_axi_bready   (peribundle_axi4_b_ready),
       .m_axi_arid     (peribundle_axi4_ar_id),
       .m_axi_araddr   (peribundle_axi4_ar_addr),
       .m_axi_arlen    (peribundle_axi4_ar_len),
       .m_axi_arsize   (peribundle_axi4_ar_size),
       .m_axi_arburst  (peribundle_axi4_ar_burst),
       .m_axi_arvalid  (peribundle_axi4_ar_valid),
       .m_axi_arready  (peribundle_axi4_ar_ready),
       .m_axi_rid      (peribundle_axi4_r_id),
       .m_axi_rdata    (peribundle_axi4_r_data),
       .m_axi_rresp    (peribundle_axi4_r_resp),
       .m_axi_rlast    (peribundle_axi4_r_last),
       .m_axi_rvalid   (peribundle_axi4_r_valid),
       .m_axi_rready   (peribundle_axi4_r_ready),

       .s_axi_awlock(1'b0),
       .s_axi_awcache(4'b0),
       .s_axi_awprot(3'b0),
       .s_axi_awqos(4'b0),
       .s_axi_arlock(1'b0),
       .s_axi_arcache(4'b0),
       .s_axi_arprot(3'b0),
       .s_axi_arqos(4'b0)
       );

   //0x60000000 - 0x60001fff
   uart uart_inst(
       .uart_axi4_aw_ready (peribundle_axi4_aw_ready[0]    ),
       .uart_axi4_aw_valid (peribundle_axi4_aw_valid[0]    ),
       .uart_axi4_aw_id    (peribundle_axi4_aw_id[3:0]     ),
       .uart_axi4_aw_addr  (peribundle_axi4_aw_addr[30:0]  ),
       .uart_axi4_aw_len   (peribundle_axi4_aw_len[7:0]    ),
       .uart_axi4_aw_size  (peribundle_axi4_aw_size[2:0]   ),
       .uart_axi4_aw_burst (peribundle_axi4_aw_burst[1:0]  ),
       .uart_axi4_w_ready  (peribundle_axi4_w_ready[0]     ),
       .uart_axi4_w_valid  (peribundle_axi4_w_valid[0]     ),
       .uart_axi4_w_data   (peribundle_axi4_w_data[63:0]   ),
       .uart_axi4_w_strb   (peribundle_axi4_w_strb[7:0]    ),
       .uart_axi4_w_last   (peribundle_axi4_w_last[0]      ),
       .uart_axi4_b_ready  (peribundle_axi4_b_ready[0]     ),
       .uart_axi4_b_valid  (peribundle_axi4_b_valid[0]     ),
       .uart_axi4_b_id     (peribundle_axi4_b_id[3:0]      ),
       .uart_axi4_b_resp   (peribundle_axi4_b_resp[1:0]    ),
       .uart_axi4_ar_ready (peribundle_axi4_ar_ready[0]    ),
       .uart_axi4_ar_valid (peribundle_axi4_ar_valid[0]    ),
       .uart_axi4_ar_id    (peribundle_axi4_ar_id[3:0]     ),
       .uart_axi4_ar_addr  (peribundle_axi4_ar_addr[30:0]  ),
       .uart_axi4_ar_len   (peribundle_axi4_ar_len[7:0]    ),
       .uart_axi4_ar_size  (peribundle_axi4_ar_size[2:0]   ),
       .uart_axi4_ar_burst (peribundle_axi4_ar_burst[1:0]  ),
       .uart_axi4_r_ready  (peribundle_axi4_r_ready[0]     ),
       .uart_axi4_r_valid  (peribundle_axi4_r_valid[0]     ),
       .uart_axi4_r_id     (peribundle_axi4_r_id[3:0]      ),
       .uart_axi4_r_data   (peribundle_axi4_r_data[63:0]   ),
       .uart_axi4_r_resp   (peribundle_axi4_r_resp[1:0]    ),
       .uart_axi4_r_last   (peribundle_axi4_r_last[0]      ),

       .clock(clock),
       .resetn(resetn),
       .uart_TX(uart_TX),
       .uart_RX(uart_RX),

       .interrupt(interrupt_uart)

       );

   //0x60010000 - 0x6001ffff , 64kB
   axi_ram #(
       .ADDR_WIDTH(16),
       .DATA_WIDTH(64),
       .ID_WIDTH(4)
   ) u_axi_ram(
       .clk           (clock         ),
       .rst           (~resetn       ),
       .s_axi_awready (peribundle_axi4_aw_ready[1]    ),
       .s_axi_awvalid (peribundle_axi4_aw_valid[1]    ),
       .s_axi_awid    (peribundle_axi4_aw_id[7:4]     ),
       .s_axi_awaddr  (peribundle_axi4_aw_addr[61:31] ),
       .s_axi_awlen   (peribundle_axi4_aw_len[15:8]   ),
       .s_axi_awsize  (peribundle_axi4_aw_size[5:3]   ),
       .s_axi_awburst (peribundle_axi4_aw_burst[3:2]  ),
       .s_axi_awlock  (1'b0  ),
       .s_axi_awcache (4'b0  ),
       .s_axi_awprot  (3'b0  ),
       .s_axi_wready  (peribundle_axi4_w_ready[1]     ),
       .s_axi_wvalid  (peribundle_axi4_w_valid[1]     ),
       .s_axi_wdata   (peribundle_axi4_w_data[127:64] ),
       .s_axi_wstrb   (peribundle_axi4_w_strb[15:8]   ),
       .s_axi_wlast   (peribundle_axi4_w_last[1]      ),
       .s_axi_bready  (peribundle_axi4_b_ready[1]     ),
       .s_axi_bvalid  (peribundle_axi4_b_valid[1]     ),
       .s_axi_bid     (peribundle_axi4_b_id[7:4]      ),
       .s_axi_bresp   (peribundle_axi4_b_resp[3:2]    ),
       .s_axi_arready (peribundle_axi4_ar_ready[1]    ),
       .s_axi_arvalid (peribundle_axi4_ar_valid[1]    ),
       .s_axi_arid    (peribundle_axi4_ar_id[7:4]     ),
       .s_axi_araddr  (peribundle_axi4_ar_addr[61:31] ),
       .s_axi_arlen   (peribundle_axi4_ar_len[15:8]   ),
       .s_axi_arsize  (peribundle_axi4_ar_size[5:3]   ),
       .s_axi_arburst (peribundle_axi4_ar_burst[3:2]  ),
       .s_axi_arlock  (1'b0  ),
       .s_axi_arcache (4'b0  ),
       .s_axi_arprot  (3'b0  ),
       .s_axi_rready  (peribundle_axi4_r_ready[1]     ),
       .s_axi_rvalid  (peribundle_axi4_r_valid[1]     ),
       .s_axi_rid     (peribundle_axi4_r_id[7:4]      ),
       .s_axi_rdata   (peribundle_axi4_r_data[127:64] ),
       .s_axi_rresp   (peribundle_axi4_r_resp[3:2]    ),
       .s_axi_rlast   (peribundle_axi4_r_last[1]      )
   );

/*
   bram bram_inst(
       .bram_axi4_aw_ready (peribundle_axi4_aw_ready[1]    ),
       .bram_axi4_aw_valid (peribundle_axi4_aw_valid[1]    ),
       .bram_axi4_aw_id    (peribundle_axi4_aw_id[7:4]     ),
       .bram_axi4_aw_addr  (peribundle_axi4_aw_addr[61:31] ),
       .bram_axi4_aw_len   (peribundle_axi4_aw_len[15:8]   ),
       .bram_axi4_aw_size  (peribundle_axi4_aw_size[5:3]   ),
       .bram_axi4_aw_burst (peribundle_axi4_aw_burst[3:2]  ),
       .bram_axi4_w_ready  (peribundle_axi4_w_ready[1]     ),
       .bram_axi4_w_valid  (peribundle_axi4_w_valid[1]     ),
       .bram_axi4_w_data   (peribundle_axi4_w_data[127:64] ),
       .bram_axi4_w_strb   (peribundle_axi4_w_strb[15:8]   ),
       .bram_axi4_w_last   (peribundle_axi4_w_last[1]      ),
       .bram_axi4_b_ready  (peribundle_axi4_b_ready[1]     ),
       .bram_axi4_b_valid  (peribundle_axi4_b_valid[1]     ),
       .bram_axi4_b_id     (peribundle_axi4_b_id[7:4]      ),
       .bram_axi4_b_resp   (peribundle_axi4_b_resp[3:2]    ),
       .bram_axi4_ar_ready (peribundle_axi4_ar_ready[1]    ),
       .bram_axi4_ar_valid (peribundle_axi4_ar_valid[1]    ),
       .bram_axi4_ar_id    (peribundle_axi4_ar_id[7:4]     ),
       .bram_axi4_ar_addr  (peribundle_axi4_ar_addr[61:31] ),
       .bram_axi4_ar_len   (peribundle_axi4_ar_len[15:8]   ),
       .bram_axi4_ar_size  (peribundle_axi4_ar_size[5:3]   ),
       .bram_axi4_ar_burst (peribundle_axi4_ar_burst[3:2]  ),
       .bram_axi4_r_ready  (peribundle_axi4_r_ready[1]     ),
       .bram_axi4_r_valid  (peribundle_axi4_r_valid[1]     ),
       .bram_axi4_r_id     (peribundle_axi4_r_id[7:4]      ),
       .bram_axi4_r_data   (peribundle_axi4_r_data[127:64] ),
       .bram_axi4_r_resp   (peribundle_axi4_r_resp[3:2]    ),
       .bram_axi4_r_last   (peribundle_axi4_r_last[1]      ),
       .clock(clock),
       .resetn(resetn)
       );
       */

endmodule
