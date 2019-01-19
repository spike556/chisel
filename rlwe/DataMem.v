module RamSync( // @[:@3.2]
  input          clock, // @[:@4.4]
  input          io_re, // @[:@6.4]
  input          io_we, // @[:@6.4]
  input  [7:0]   io_ra, // @[:@6.4]
  input  [7:0]   io_wa, // @[:@6.4]
  input  [127:0] io_di, // @[:@6.4]
  output [127:0] io_dout // @[:@6.4]
);
  reg [127:0] mem [0:255]; // @[RamSync.scala 26:24:@8.4]
  reg [127:0] _RAND_0;
  wire [127:0] mem__T_21_data; // @[RamSync.scala 26:24:@8.4]
  wire [7:0] mem__T_21_addr; // @[RamSync.scala 26:24:@8.4]
  wire [127:0] mem__T_19_data; // @[RamSync.scala 26:24:@8.4]
  wire [7:0] mem__T_19_addr; // @[RamSync.scala 26:24:@8.4]
  wire  mem__T_19_mask; // @[RamSync.scala 26:24:@8.4]
  wire  mem__T_19_en; // @[RamSync.scala 26:24:@8.4]
  wire [127:0] _GEN_3; // @[RamSync.scala 32:20:@15.6]
  wire  _GEN_12; // @[RamSync.scala 28:16:@9.4]
  reg [7:0] mem__T_21_addr_pipe_0;
  reg [31:0] _RAND_1;
  wire  _GEN_13;
  assign mem__T_21_addr = mem__T_21_addr_pipe_0;
  assign mem__T_21_data = mem[mem__T_21_addr]; // @[RamSync.scala 26:24:@8.4]
  assign mem__T_19_data = io_di;
  assign mem__T_19_addr = io_wa;
  assign mem__T_19_mask = 1'h1;
  assign mem__T_19_en = io_we;
  assign _GEN_3 = io_re ? mem__T_21_data : 128'h0; // @[RamSync.scala 32:20:@15.6]
  assign _GEN_12 = io_we ? 1'h0 : io_re; // @[RamSync.scala 28:16:@9.4]
  assign io_dout = io_we ? 128'h0 : _GEN_3; // @[RamSync.scala 30:13:@12.6 RamSync.scala 33:13:@17.8 RamSync.scala 35:13:@20.8]
  assign _GEN_13 = _GEN_12;
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {4{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[127:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_21_addr_pipe_0 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem__T_19_en & mem__T_19_mask) begin
      mem[mem__T_19_addr] <= mem__T_19_data; // @[RamSync.scala 26:24:@8.4]
    end
    if (_GEN_13) begin
      mem__T_21_addr_pipe_0 <= io_ra;
    end
  end
endmodule
module DataMem( // @[:@83.2]
  input         clock, // @[:@84.4]
  input         reset, // @[:@85.4]
  input         io_req_write, // @[:@86.4]
  input         io_req_valid, // @[:@86.4]
  input  [7:0]  io_req_index, // @[:@86.4]
  input  [3:0]  io_req_wayIdx, // @[:@86.4]
  input  [31:0] io_wdata_0, // @[:@86.4]
  input  [31:0] io_wdata_1, // @[:@86.4]
  input  [31:0] io_wdata_2, // @[:@86.4]
  input  [31:0] io_wdata_3, // @[:@86.4]
  output [31:0] io_rdata_0_0, // @[:@86.4]
  output [31:0] io_rdata_0_1, // @[:@86.4]
  output [31:0] io_rdata_0_2, // @[:@86.4]
  output [31:0] io_rdata_0_3, // @[:@86.4]
  output [31:0] io_rdata_1_0, // @[:@86.4]
  output [31:0] io_rdata_1_1, // @[:@86.4]
  output [31:0] io_rdata_1_2, // @[:@86.4]
  output [31:0] io_rdata_1_3, // @[:@86.4]
  output [31:0] io_rdata_2_0, // @[:@86.4]
  output [31:0] io_rdata_2_1, // @[:@86.4]
  output [31:0] io_rdata_2_2, // @[:@86.4]
  output [31:0] io_rdata_2_3, // @[:@86.4]
  output [31:0] io_rdata_3_0, // @[:@86.4]
  output [31:0] io_rdata_3_1, // @[:@86.4]
  output [31:0] io_rdata_3_2, // @[:@86.4]
  output [31:0] io_rdata_3_3 // @[:@86.4]
);
  wire  RamSync_clock; // @[DCache.scala 78:40:@88.4]
  wire  RamSync_io_re; // @[DCache.scala 78:40:@88.4]
  wire  RamSync_io_we; // @[DCache.scala 78:40:@88.4]
  wire [7:0] RamSync_io_ra; // @[DCache.scala 78:40:@88.4]
  wire [7:0] RamSync_io_wa; // @[DCache.scala 78:40:@88.4]
  wire [127:0] RamSync_io_di; // @[DCache.scala 78:40:@88.4]
  wire [127:0] RamSync_io_dout; // @[DCache.scala 78:40:@88.4]
  wire  RamSync_1_clock; // @[DCache.scala 78:40:@91.4]
  wire  RamSync_1_io_re; // @[DCache.scala 78:40:@91.4]
  wire  RamSync_1_io_we; // @[DCache.scala 78:40:@91.4]
  wire [7:0] RamSync_1_io_ra; // @[DCache.scala 78:40:@91.4]
  wire [7:0] RamSync_1_io_wa; // @[DCache.scala 78:40:@91.4]
  wire [127:0] RamSync_1_io_di; // @[DCache.scala 78:40:@91.4]
  wire [127:0] RamSync_1_io_dout; // @[DCache.scala 78:40:@91.4]
  wire  RamSync_2_clock; // @[DCache.scala 78:40:@94.4]
  wire  RamSync_2_io_re; // @[DCache.scala 78:40:@94.4]
  wire  RamSync_2_io_we; // @[DCache.scala 78:40:@94.4]
  wire [7:0] RamSync_2_io_ra; // @[DCache.scala 78:40:@94.4]
  wire [7:0] RamSync_2_io_wa; // @[DCache.scala 78:40:@94.4]
  wire [127:0] RamSync_2_io_di; // @[DCache.scala 78:40:@94.4]
  wire [127:0] RamSync_2_io_dout; // @[DCache.scala 78:40:@94.4]
  wire  RamSync_3_clock; // @[DCache.scala 78:40:@97.4]
  wire  RamSync_3_io_re; // @[DCache.scala 78:40:@97.4]
  wire  RamSync_3_io_we; // @[DCache.scala 78:40:@97.4]
  wire [7:0] RamSync_3_io_ra; // @[DCache.scala 78:40:@97.4]
  wire [7:0] RamSync_3_io_wa; // @[DCache.scala 78:40:@97.4]
  wire [127:0] RamSync_3_io_di; // @[DCache.scala 78:40:@97.4]
  wire [127:0] RamSync_3_io_dout; // @[DCache.scala 78:40:@97.4]
  wire  _T_278; // @[DCache.scala 80:22:@100.4]
  wire  _T_280; // @[DCache.scala 81:36:@103.4]
  wire  _T_281; // @[DCache.scala 81:66:@104.4]
  wire [63:0] _T_283; // @[DCache.scala 84:37:@109.4]
  wire [63:0] _T_284; // @[DCache.scala 84:37:@110.4]
  wire  _T_294; // @[DCache.scala 81:66:@125.4]
  wire  _T_307; // @[DCache.scala 81:66:@146.4]
  wire  _T_320; // @[DCache.scala 81:66:@167.4]
  RamSync RamSync ( // @[DCache.scala 78:40:@88.4]
    .clock(RamSync_clock),
    .io_re(RamSync_io_re),
    .io_we(RamSync_io_we),
    .io_ra(RamSync_io_ra),
    .io_wa(RamSync_io_wa),
    .io_di(RamSync_io_di),
    .io_dout(RamSync_io_dout)
  );
  RamSync RamSync_1 ( // @[DCache.scala 78:40:@91.4]
    .clock(RamSync_1_clock),
    .io_re(RamSync_1_io_re),
    .io_we(RamSync_1_io_we),
    .io_ra(RamSync_1_io_ra),
    .io_wa(RamSync_1_io_wa),
    .io_di(RamSync_1_io_di),
    .io_dout(RamSync_1_io_dout)
  );
  RamSync RamSync_2 ( // @[DCache.scala 78:40:@94.4]
    .clock(RamSync_2_clock),
    .io_re(RamSync_2_io_re),
    .io_we(RamSync_2_io_we),
    .io_ra(RamSync_2_io_ra),
    .io_wa(RamSync_2_io_wa),
    .io_di(RamSync_2_io_di),
    .io_dout(RamSync_2_io_dout)
  );
  RamSync RamSync_3 ( // @[DCache.scala 78:40:@97.4]
    .clock(RamSync_3_clock),
    .io_re(RamSync_3_io_re),
    .io_we(RamSync_3_io_we),
    .io_ra(RamSync_3_io_ra),
    .io_wa(RamSync_3_io_wa),
    .io_di(RamSync_3_io_di),
    .io_dout(RamSync_3_io_dout)
  );
  assign _T_278 = io_req_write == 1'h0; // @[DCache.scala 80:22:@100.4]
  assign _T_280 = io_req_write & io_req_valid; // @[DCache.scala 81:36:@103.4]
  assign _T_281 = io_req_wayIdx[0]; // @[DCache.scala 81:66:@104.4]
  assign _T_283 = {io_wdata_1,io_wdata_0}; // @[DCache.scala 84:37:@109.4]
  assign _T_284 = {io_wdata_3,io_wdata_2}; // @[DCache.scala 84:37:@110.4]
  assign _T_294 = io_req_wayIdx[1]; // @[DCache.scala 81:66:@125.4]
  assign _T_307 = io_req_wayIdx[2]; // @[DCache.scala 81:66:@146.4]
  assign _T_320 = io_req_wayIdx[3]; // @[DCache.scala 81:66:@167.4]
  assign io_rdata_0_0 = RamSync_io_dout[31:0]; // @[DCache.scala 86:22:@114.4]
  assign io_rdata_0_1 = RamSync_io_dout[63:32]; // @[DCache.scala 86:22:@116.4]
  assign io_rdata_0_2 = RamSync_io_dout[95:64]; // @[DCache.scala 86:22:@118.4]
  assign io_rdata_0_3 = RamSync_io_dout[127:96]; // @[DCache.scala 86:22:@120.4]
  assign io_rdata_1_0 = RamSync_1_io_dout[31:0]; // @[DCache.scala 86:22:@135.4]
  assign io_rdata_1_1 = RamSync_1_io_dout[63:32]; // @[DCache.scala 86:22:@137.4]
  assign io_rdata_1_2 = RamSync_1_io_dout[95:64]; // @[DCache.scala 86:22:@139.4]
  assign io_rdata_1_3 = RamSync_1_io_dout[127:96]; // @[DCache.scala 86:22:@141.4]
  assign io_rdata_2_0 = RamSync_2_io_dout[31:0]; // @[DCache.scala 86:22:@156.4]
  assign io_rdata_2_1 = RamSync_2_io_dout[63:32]; // @[DCache.scala 86:22:@158.4]
  assign io_rdata_2_2 = RamSync_2_io_dout[95:64]; // @[DCache.scala 86:22:@160.4]
  assign io_rdata_2_3 = RamSync_2_io_dout[127:96]; // @[DCache.scala 86:22:@162.4]
  assign io_rdata_3_0 = RamSync_3_io_dout[31:0]; // @[DCache.scala 86:22:@177.4]
  assign io_rdata_3_1 = RamSync_3_io_dout[63:32]; // @[DCache.scala 86:22:@179.4]
  assign io_rdata_3_2 = RamSync_3_io_dout[95:64]; // @[DCache.scala 86:22:@181.4]
  assign io_rdata_3_3 = RamSync_3_io_dout[127:96]; // @[DCache.scala 86:22:@183.4]
  assign RamSync_clock = clock; // @[:@89.4]
  assign RamSync_io_re = _T_278 & io_req_valid; // @[DCache.scala 80:19:@102.4]
  assign RamSync_io_we = _T_280 & _T_281; // @[DCache.scala 81:19:@106.4]
  assign RamSync_io_ra = io_req_index; // @[DCache.scala 82:19:@107.4]
  assign RamSync_io_wa = io_req_index; // @[DCache.scala 83:19:@108.4]
  assign RamSync_io_di = {_T_284,_T_283}; // @[DCache.scala 84:19:@112.4]
  assign RamSync_1_clock = clock; // @[:@92.4]
  assign RamSync_1_io_re = _T_278 & io_req_valid; // @[DCache.scala 80:19:@123.4]
  assign RamSync_1_io_we = _T_280 & _T_294; // @[DCache.scala 81:19:@127.4]
  assign RamSync_1_io_ra = io_req_index; // @[DCache.scala 82:19:@128.4]
  assign RamSync_1_io_wa = io_req_index; // @[DCache.scala 83:19:@129.4]
  assign RamSync_1_io_di = {_T_284,_T_283}; // @[DCache.scala 84:19:@133.4]
  assign RamSync_2_clock = clock; // @[:@95.4]
  assign RamSync_2_io_re = _T_278 & io_req_valid; // @[DCache.scala 80:19:@144.4]
  assign RamSync_2_io_we = _T_280 & _T_307; // @[DCache.scala 81:19:@148.4]
  assign RamSync_2_io_ra = io_req_index; // @[DCache.scala 82:19:@149.4]
  assign RamSync_2_io_wa = io_req_index; // @[DCache.scala 83:19:@150.4]
  assign RamSync_2_io_di = {_T_284,_T_283}; // @[DCache.scala 84:19:@154.4]
  assign RamSync_3_clock = clock; // @[:@98.4]
  assign RamSync_3_io_re = _T_278 & io_req_valid; // @[DCache.scala 80:19:@165.4]
  assign RamSync_3_io_we = _T_280 & _T_320; // @[DCache.scala 81:19:@169.4]
  assign RamSync_3_io_ra = io_req_index; // @[DCache.scala 82:19:@170.4]
  assign RamSync_3_io_wa = io_req_index; // @[DCache.scala 83:19:@171.4]
  assign RamSync_3_io_di = {_T_284,_T_283}; // @[DCache.scala 84:19:@175.4]
endmodule
