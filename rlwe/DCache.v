module RamSync( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         io_re, // @[:@6.4]
  input         io_we, // @[:@6.4]
  input  [7:0]  io_ra, // @[:@6.4]
  input  [7:0]  io_wa, // @[:@6.4]
  input  [21:0] io_di, // @[:@6.4]
  output [21:0] io_dout // @[:@6.4]
);
  reg [21:0] mem [0:255]; // @[RamSync.scala 26:24:@8.4]
  reg [31:0] _RAND_0;
  wire [21:0] mem__T_25_data; // @[RamSync.scala 26:24:@8.4]
  wire [7:0] mem__T_25_addr; // @[RamSync.scala 26:24:@8.4]
  wire [21:0] mem__T_19_data; // @[RamSync.scala 26:24:@8.4]
  wire [7:0] mem__T_19_addr; // @[RamSync.scala 26:24:@8.4]
  wire  mem__T_19_mask; // @[RamSync.scala 26:24:@8.4]
  wire  mem__T_19_en; // @[RamSync.scala 26:24:@8.4]
  wire  _GEN_6; // @[RamSync.scala 32:22:@15.4]
  reg [7:0] mem__T_25_addr_pipe_0;
  reg [31:0] _RAND_1;
  assign mem__T_25_addr = mem__T_25_addr_pipe_0;
  assign mem__T_25_data = mem[mem__T_25_addr]; // @[RamSync.scala 26:24:@8.4]
  assign mem__T_19_data = io_di;
  assign mem__T_19_addr = io_wa;
  assign mem__T_19_mask = 1'h1;
  assign mem__T_19_en = io_we;
  assign _GEN_6 = io_re; // @[RamSync.scala 32:22:@15.4]
  assign io_dout = mem__T_25_data; // @[RamSync.scala 32:11:@21.4]
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[21:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem__T_25_addr_pipe_0 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem__T_19_en & mem__T_19_mask) begin
      mem[mem__T_19_addr] <= mem__T_19_data; // @[RamSync.scala 26:24:@8.4]
    end
    if (_GEN_6) begin
      mem__T_25_addr_pipe_0 <= io_ra;
    end
  end
endmodule
module TagMem( // @[:@83.2]
  input         clock, // @[:@84.4]
  input         io_req_write, // @[:@86.4]
  input         io_req_valid, // @[:@86.4]
  input  [7:0]  io_req_index, // @[:@86.4]
  input  [3:0]  io_req_wayIdx, // @[:@86.4]
  input         io_wdata_valid, // @[:@86.4]
  input         io_wdata_dirty, // @[:@86.4]
  input  [19:0] io_wdata_tag, // @[:@86.4]
  output        io_rdata_0_valid, // @[:@86.4]
  output        io_rdata_0_dirty, // @[:@86.4]
  output [19:0] io_rdata_0_tag, // @[:@86.4]
  output        io_rdata_1_valid, // @[:@86.4]
  output        io_rdata_1_dirty, // @[:@86.4]
  output [19:0] io_rdata_1_tag, // @[:@86.4]
  output        io_rdata_2_valid, // @[:@86.4]
  output        io_rdata_2_dirty, // @[:@86.4]
  output [19:0] io_rdata_2_tag, // @[:@86.4]
  output        io_rdata_3_valid, // @[:@86.4]
  output        io_rdata_3_dirty, // @[:@86.4]
  output [19:0] io_rdata_3_tag // @[:@86.4]
);
  wire  RamSync_clock; // @[DCache.scala 60:39:@88.4]
  wire  RamSync_io_re; // @[DCache.scala 60:39:@88.4]
  wire  RamSync_io_we; // @[DCache.scala 60:39:@88.4]
  wire [7:0] RamSync_io_ra; // @[DCache.scala 60:39:@88.4]
  wire [7:0] RamSync_io_wa; // @[DCache.scala 60:39:@88.4]
  wire [21:0] RamSync_io_di; // @[DCache.scala 60:39:@88.4]
  wire [21:0] RamSync_io_dout; // @[DCache.scala 60:39:@88.4]
  wire  RamSync_1_clock; // @[DCache.scala 60:39:@91.4]
  wire  RamSync_1_io_re; // @[DCache.scala 60:39:@91.4]
  wire  RamSync_1_io_we; // @[DCache.scala 60:39:@91.4]
  wire [7:0] RamSync_1_io_ra; // @[DCache.scala 60:39:@91.4]
  wire [7:0] RamSync_1_io_wa; // @[DCache.scala 60:39:@91.4]
  wire [21:0] RamSync_1_io_di; // @[DCache.scala 60:39:@91.4]
  wire [21:0] RamSync_1_io_dout; // @[DCache.scala 60:39:@91.4]
  wire  RamSync_2_clock; // @[DCache.scala 60:39:@94.4]
  wire  RamSync_2_io_re; // @[DCache.scala 60:39:@94.4]
  wire  RamSync_2_io_we; // @[DCache.scala 60:39:@94.4]
  wire [7:0] RamSync_2_io_ra; // @[DCache.scala 60:39:@94.4]
  wire [7:0] RamSync_2_io_wa; // @[DCache.scala 60:39:@94.4]
  wire [21:0] RamSync_2_io_di; // @[DCache.scala 60:39:@94.4]
  wire [21:0] RamSync_2_io_dout; // @[DCache.scala 60:39:@94.4]
  wire  RamSync_3_clock; // @[DCache.scala 60:39:@97.4]
  wire  RamSync_3_io_re; // @[DCache.scala 60:39:@97.4]
  wire  RamSync_3_io_we; // @[DCache.scala 60:39:@97.4]
  wire [7:0] RamSync_3_io_ra; // @[DCache.scala 60:39:@97.4]
  wire [7:0] RamSync_3_io_wa; // @[DCache.scala 60:39:@97.4]
  wire [21:0] RamSync_3_io_di; // @[DCache.scala 60:39:@97.4]
  wire [21:0] RamSync_3_io_dout; // @[DCache.scala 60:39:@97.4]
  wire  _T_28; // @[DCache.scala 62:21:@100.4]
  wire  _T_30; // @[DCache.scala 63:34:@103.4]
  wire  _T_31; // @[DCache.scala 63:64:@104.4]
  wire [1:0] _T_33; // @[DCache.scala 66:36:@109.4]
  wire  _T_42; // @[DCache.scala 63:64:@122.4]
  wire  _T_53; // @[DCache.scala 63:64:@140.4]
  wire  _T_64; // @[DCache.scala 63:64:@158.4]
  RamSync RamSync ( // @[DCache.scala 60:39:@88.4]
    .clock(RamSync_clock),
    .io_re(RamSync_io_re),
    .io_we(RamSync_io_we),
    .io_ra(RamSync_io_ra),
    .io_wa(RamSync_io_wa),
    .io_di(RamSync_io_di),
    .io_dout(RamSync_io_dout)
  );
  RamSync RamSync_1 ( // @[DCache.scala 60:39:@91.4]
    .clock(RamSync_1_clock),
    .io_re(RamSync_1_io_re),
    .io_we(RamSync_1_io_we),
    .io_ra(RamSync_1_io_ra),
    .io_wa(RamSync_1_io_wa),
    .io_di(RamSync_1_io_di),
    .io_dout(RamSync_1_io_dout)
  );
  RamSync RamSync_2 ( // @[DCache.scala 60:39:@94.4]
    .clock(RamSync_2_clock),
    .io_re(RamSync_2_io_re),
    .io_we(RamSync_2_io_we),
    .io_ra(RamSync_2_io_ra),
    .io_wa(RamSync_2_io_wa),
    .io_di(RamSync_2_io_di),
    .io_dout(RamSync_2_io_dout)
  );
  RamSync RamSync_3 ( // @[DCache.scala 60:39:@97.4]
    .clock(RamSync_3_clock),
    .io_re(RamSync_3_io_re),
    .io_we(RamSync_3_io_we),
    .io_ra(RamSync_3_io_ra),
    .io_wa(RamSync_3_io_wa),
    .io_di(RamSync_3_io_di),
    .io_dout(RamSync_3_io_dout)
  );
  assign _T_28 = io_req_write == 1'h0; // @[DCache.scala 62:21:@100.4]
  assign _T_30 = io_req_write & io_req_valid; // @[DCache.scala 63:34:@103.4]
  assign _T_31 = io_req_wayIdx[0]; // @[DCache.scala 63:64:@104.4]
  assign _T_33 = {io_wdata_valid,io_wdata_dirty}; // @[DCache.scala 66:36:@109.4]
  assign _T_42 = io_req_wayIdx[1]; // @[DCache.scala 63:64:@122.4]
  assign _T_53 = io_req_wayIdx[2]; // @[DCache.scala 63:64:@140.4]
  assign _T_64 = io_req_wayIdx[3]; // @[DCache.scala 63:64:@158.4]
  assign io_rdata_0_valid = RamSync_io_dout[21]; // @[DCache.scala 67:23:@113.4]
  assign io_rdata_0_dirty = RamSync_io_dout[20]; // @[DCache.scala 68:23:@115.4]
  assign io_rdata_0_tag = RamSync_io_dout[19:0]; // @[DCache.scala 69:21:@117.4]
  assign io_rdata_1_valid = RamSync_1_io_dout[21]; // @[DCache.scala 67:23:@131.4]
  assign io_rdata_1_dirty = RamSync_1_io_dout[20]; // @[DCache.scala 68:23:@133.4]
  assign io_rdata_1_tag = RamSync_1_io_dout[19:0]; // @[DCache.scala 69:21:@135.4]
  assign io_rdata_2_valid = RamSync_2_io_dout[21]; // @[DCache.scala 67:23:@149.4]
  assign io_rdata_2_dirty = RamSync_2_io_dout[20]; // @[DCache.scala 68:23:@151.4]
  assign io_rdata_2_tag = RamSync_2_io_dout[19:0]; // @[DCache.scala 69:21:@153.4]
  assign io_rdata_3_valid = RamSync_3_io_dout[21]; // @[DCache.scala 67:23:@167.4]
  assign io_rdata_3_dirty = RamSync_3_io_dout[20]; // @[DCache.scala 68:23:@169.4]
  assign io_rdata_3_tag = RamSync_3_io_dout[19:0]; // @[DCache.scala 69:21:@171.4]
  assign RamSync_clock = clock; // @[:@89.4]
  assign RamSync_io_re = _T_28 & io_req_valid; // @[DCache.scala 62:18:@102.4]
  assign RamSync_io_we = _T_30 & _T_31; // @[DCache.scala 63:18:@106.4]
  assign RamSync_io_ra = io_req_index; // @[DCache.scala 64:18:@107.4]
  assign RamSync_io_wa = io_req_index; // @[DCache.scala 65:18:@108.4]
  assign RamSync_io_di = {_T_33,io_wdata_tag}; // @[DCache.scala 66:18:@111.4]
  assign RamSync_1_clock = clock; // @[:@92.4]
  assign RamSync_1_io_re = _T_28 & io_req_valid; // @[DCache.scala 62:18:@120.4]
  assign RamSync_1_io_we = _T_30 & _T_42; // @[DCache.scala 63:18:@124.4]
  assign RamSync_1_io_ra = io_req_index; // @[DCache.scala 64:18:@125.4]
  assign RamSync_1_io_wa = io_req_index; // @[DCache.scala 65:18:@126.4]
  assign RamSync_1_io_di = {_T_33,io_wdata_tag}; // @[DCache.scala 66:18:@129.4]
  assign RamSync_2_clock = clock; // @[:@95.4]
  assign RamSync_2_io_re = _T_28 & io_req_valid; // @[DCache.scala 62:18:@138.4]
  assign RamSync_2_io_we = _T_30 & _T_53; // @[DCache.scala 63:18:@142.4]
  assign RamSync_2_io_ra = io_req_index; // @[DCache.scala 64:18:@143.4]
  assign RamSync_2_io_wa = io_req_index; // @[DCache.scala 65:18:@144.4]
  assign RamSync_2_io_di = {_T_33,io_wdata_tag}; // @[DCache.scala 66:18:@147.4]
  assign RamSync_3_clock = clock; // @[:@98.4]
  assign RamSync_3_io_re = _T_28 & io_req_valid; // @[DCache.scala 62:18:@156.4]
  assign RamSync_3_io_we = _T_30 & _T_64; // @[DCache.scala 63:18:@160.4]
  assign RamSync_3_io_ra = io_req_index; // @[DCache.scala 64:18:@161.4]
  assign RamSync_3_io_wa = io_req_index; // @[DCache.scala 65:18:@162.4]
  assign RamSync_3_io_di = {_T_33,io_wdata_tag}; // @[DCache.scala 66:18:@165.4]
endmodule
module RamSync_4( // @[:@173.2]
  input          clock, // @[:@174.4]
  input          io_re, // @[:@176.4]
  input          io_we, // @[:@176.4]
  input  [7:0]   io_ra, // @[:@176.4]
  input  [7:0]   io_wa, // @[:@176.4]
  input  [127:0] io_di, // @[:@176.4]
  output [127:0] io_dout // @[:@176.4]
);
  reg [127:0] mem [0:255]; // @[RamSync.scala 26:24:@178.4]
  reg [127:0] _RAND_0;
  wire [127:0] mem__T_25_data; // @[RamSync.scala 26:24:@178.4]
  wire [7:0] mem__T_25_addr; // @[RamSync.scala 26:24:@178.4]
  wire [127:0] mem__T_19_data; // @[RamSync.scala 26:24:@178.4]
  wire [7:0] mem__T_19_addr; // @[RamSync.scala 26:24:@178.4]
  wire  mem__T_19_mask; // @[RamSync.scala 26:24:@178.4]
  wire  mem__T_19_en; // @[RamSync.scala 26:24:@178.4]
  wire  _GEN_6; // @[RamSync.scala 32:22:@185.4]
  reg [7:0] mem__T_25_addr_pipe_0;
  reg [31:0] _RAND_1;
  assign mem__T_25_addr = mem__T_25_addr_pipe_0;
  assign mem__T_25_data = mem[mem__T_25_addr]; // @[RamSync.scala 26:24:@178.4]
  assign mem__T_19_data = io_di;
  assign mem__T_19_addr = io_wa;
  assign mem__T_19_mask = 1'h1;
  assign mem__T_19_en = io_we;
  assign _GEN_6 = io_re; // @[RamSync.scala 32:22:@185.4]
  assign io_dout = mem__T_25_data; // @[RamSync.scala 32:11:@191.4]
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
  mem__T_25_addr_pipe_0 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem__T_19_en & mem__T_19_mask) begin
      mem[mem__T_19_addr] <= mem__T_19_data; // @[RamSync.scala 26:24:@178.4]
    end
    if (_GEN_6) begin
      mem__T_25_addr_pipe_0 <= io_ra;
    end
  end
endmodule
module DataMem( // @[:@253.2]
  input         clock, // @[:@254.4]
  input         io_req_write, // @[:@256.4]
  input         io_req_valid, // @[:@256.4]
  input  [7:0]  io_req_index, // @[:@256.4]
  input  [3:0]  io_req_wayIdx, // @[:@256.4]
  input  [31:0] io_wdata_0, // @[:@256.4]
  input  [31:0] io_wdata_1, // @[:@256.4]
  input  [31:0] io_wdata_2, // @[:@256.4]
  input  [31:0] io_wdata_3, // @[:@256.4]
  output [31:0] io_rdata_0_0, // @[:@256.4]
  output [31:0] io_rdata_0_1, // @[:@256.4]
  output [31:0] io_rdata_0_2, // @[:@256.4]
  output [31:0] io_rdata_0_3, // @[:@256.4]
  output [31:0] io_rdata_1_0, // @[:@256.4]
  output [31:0] io_rdata_1_1, // @[:@256.4]
  output [31:0] io_rdata_1_2, // @[:@256.4]
  output [31:0] io_rdata_1_3, // @[:@256.4]
  output [31:0] io_rdata_2_0, // @[:@256.4]
  output [31:0] io_rdata_2_1, // @[:@256.4]
  output [31:0] io_rdata_2_2, // @[:@256.4]
  output [31:0] io_rdata_2_3, // @[:@256.4]
  output [31:0] io_rdata_3_0, // @[:@256.4]
  output [31:0] io_rdata_3_1, // @[:@256.4]
  output [31:0] io_rdata_3_2, // @[:@256.4]
  output [31:0] io_rdata_3_3 // @[:@256.4]
);
  wire  RamSync_clock; // @[DCache.scala 80:40:@258.4]
  wire  RamSync_io_re; // @[DCache.scala 80:40:@258.4]
  wire  RamSync_io_we; // @[DCache.scala 80:40:@258.4]
  wire [7:0] RamSync_io_ra; // @[DCache.scala 80:40:@258.4]
  wire [7:0] RamSync_io_wa; // @[DCache.scala 80:40:@258.4]
  wire [127:0] RamSync_io_di; // @[DCache.scala 80:40:@258.4]
  wire [127:0] RamSync_io_dout; // @[DCache.scala 80:40:@258.4]
  wire  RamSync_1_clock; // @[DCache.scala 80:40:@261.4]
  wire  RamSync_1_io_re; // @[DCache.scala 80:40:@261.4]
  wire  RamSync_1_io_we; // @[DCache.scala 80:40:@261.4]
  wire [7:0] RamSync_1_io_ra; // @[DCache.scala 80:40:@261.4]
  wire [7:0] RamSync_1_io_wa; // @[DCache.scala 80:40:@261.4]
  wire [127:0] RamSync_1_io_di; // @[DCache.scala 80:40:@261.4]
  wire [127:0] RamSync_1_io_dout; // @[DCache.scala 80:40:@261.4]
  wire  RamSync_2_clock; // @[DCache.scala 80:40:@264.4]
  wire  RamSync_2_io_re; // @[DCache.scala 80:40:@264.4]
  wire  RamSync_2_io_we; // @[DCache.scala 80:40:@264.4]
  wire [7:0] RamSync_2_io_ra; // @[DCache.scala 80:40:@264.4]
  wire [7:0] RamSync_2_io_wa; // @[DCache.scala 80:40:@264.4]
  wire [127:0] RamSync_2_io_di; // @[DCache.scala 80:40:@264.4]
  wire [127:0] RamSync_2_io_dout; // @[DCache.scala 80:40:@264.4]
  wire  RamSync_3_clock; // @[DCache.scala 80:40:@267.4]
  wire  RamSync_3_io_re; // @[DCache.scala 80:40:@267.4]
  wire  RamSync_3_io_we; // @[DCache.scala 80:40:@267.4]
  wire [7:0] RamSync_3_io_ra; // @[DCache.scala 80:40:@267.4]
  wire [7:0] RamSync_3_io_wa; // @[DCache.scala 80:40:@267.4]
  wire [127:0] RamSync_3_io_di; // @[DCache.scala 80:40:@267.4]
  wire [127:0] RamSync_3_io_dout; // @[DCache.scala 80:40:@267.4]
  wire  _T_278; // @[DCache.scala 82:22:@270.4]
  wire  _T_280; // @[DCache.scala 83:36:@273.4]
  wire  _T_281; // @[DCache.scala 83:66:@274.4]
  wire [63:0] _T_283; // @[DCache.scala 86:37:@279.4]
  wire [63:0] _T_284; // @[DCache.scala 86:37:@280.4]
  wire  _T_294; // @[DCache.scala 83:66:@295.4]
  wire  _T_307; // @[DCache.scala 83:66:@316.4]
  wire  _T_320; // @[DCache.scala 83:66:@337.4]
  RamSync_4 RamSync ( // @[DCache.scala 80:40:@258.4]
    .clock(RamSync_clock),
    .io_re(RamSync_io_re),
    .io_we(RamSync_io_we),
    .io_ra(RamSync_io_ra),
    .io_wa(RamSync_io_wa),
    .io_di(RamSync_io_di),
    .io_dout(RamSync_io_dout)
  );
  RamSync_4 RamSync_1 ( // @[DCache.scala 80:40:@261.4]
    .clock(RamSync_1_clock),
    .io_re(RamSync_1_io_re),
    .io_we(RamSync_1_io_we),
    .io_ra(RamSync_1_io_ra),
    .io_wa(RamSync_1_io_wa),
    .io_di(RamSync_1_io_di),
    .io_dout(RamSync_1_io_dout)
  );
  RamSync_4 RamSync_2 ( // @[DCache.scala 80:40:@264.4]
    .clock(RamSync_2_clock),
    .io_re(RamSync_2_io_re),
    .io_we(RamSync_2_io_we),
    .io_ra(RamSync_2_io_ra),
    .io_wa(RamSync_2_io_wa),
    .io_di(RamSync_2_io_di),
    .io_dout(RamSync_2_io_dout)
  );
  RamSync_4 RamSync_3 ( // @[DCache.scala 80:40:@267.4]
    .clock(RamSync_3_clock),
    .io_re(RamSync_3_io_re),
    .io_we(RamSync_3_io_we),
    .io_ra(RamSync_3_io_ra),
    .io_wa(RamSync_3_io_wa),
    .io_di(RamSync_3_io_di),
    .io_dout(RamSync_3_io_dout)
  );
  assign _T_278 = io_req_write == 1'h0; // @[DCache.scala 82:22:@270.4]
  assign _T_280 = io_req_write & io_req_valid; // @[DCache.scala 83:36:@273.4]
  assign _T_281 = io_req_wayIdx[0]; // @[DCache.scala 83:66:@274.4]
  assign _T_283 = {io_wdata_1,io_wdata_0}; // @[DCache.scala 86:37:@279.4]
  assign _T_284 = {io_wdata_3,io_wdata_2}; // @[DCache.scala 86:37:@280.4]
  assign _T_294 = io_req_wayIdx[1]; // @[DCache.scala 83:66:@295.4]
  assign _T_307 = io_req_wayIdx[2]; // @[DCache.scala 83:66:@316.4]
  assign _T_320 = io_req_wayIdx[3]; // @[DCache.scala 83:66:@337.4]
  assign io_rdata_0_0 = RamSync_io_dout[31:0]; // @[DCache.scala 88:22:@284.4]
  assign io_rdata_0_1 = RamSync_io_dout[63:32]; // @[DCache.scala 88:22:@286.4]
  assign io_rdata_0_2 = RamSync_io_dout[95:64]; // @[DCache.scala 88:22:@288.4]
  assign io_rdata_0_3 = RamSync_io_dout[127:96]; // @[DCache.scala 88:22:@290.4]
  assign io_rdata_1_0 = RamSync_1_io_dout[31:0]; // @[DCache.scala 88:22:@305.4]
  assign io_rdata_1_1 = RamSync_1_io_dout[63:32]; // @[DCache.scala 88:22:@307.4]
  assign io_rdata_1_2 = RamSync_1_io_dout[95:64]; // @[DCache.scala 88:22:@309.4]
  assign io_rdata_1_3 = RamSync_1_io_dout[127:96]; // @[DCache.scala 88:22:@311.4]
  assign io_rdata_2_0 = RamSync_2_io_dout[31:0]; // @[DCache.scala 88:22:@326.4]
  assign io_rdata_2_1 = RamSync_2_io_dout[63:32]; // @[DCache.scala 88:22:@328.4]
  assign io_rdata_2_2 = RamSync_2_io_dout[95:64]; // @[DCache.scala 88:22:@330.4]
  assign io_rdata_2_3 = RamSync_2_io_dout[127:96]; // @[DCache.scala 88:22:@332.4]
  assign io_rdata_3_0 = RamSync_3_io_dout[31:0]; // @[DCache.scala 88:22:@347.4]
  assign io_rdata_3_1 = RamSync_3_io_dout[63:32]; // @[DCache.scala 88:22:@349.4]
  assign io_rdata_3_2 = RamSync_3_io_dout[95:64]; // @[DCache.scala 88:22:@351.4]
  assign io_rdata_3_3 = RamSync_3_io_dout[127:96]; // @[DCache.scala 88:22:@353.4]
  assign RamSync_clock = clock; // @[:@259.4]
  assign RamSync_io_re = _T_278 & io_req_valid; // @[DCache.scala 82:19:@272.4]
  assign RamSync_io_we = _T_280 & _T_281; // @[DCache.scala 83:19:@276.4]
  assign RamSync_io_ra = io_req_index; // @[DCache.scala 84:19:@277.4]
  assign RamSync_io_wa = io_req_index; // @[DCache.scala 85:19:@278.4]
  assign RamSync_io_di = {_T_284,_T_283}; // @[DCache.scala 86:19:@282.4]
  assign RamSync_1_clock = clock; // @[:@262.4]
  assign RamSync_1_io_re = _T_278 & io_req_valid; // @[DCache.scala 82:19:@293.4]
  assign RamSync_1_io_we = _T_280 & _T_294; // @[DCache.scala 83:19:@297.4]
  assign RamSync_1_io_ra = io_req_index; // @[DCache.scala 84:19:@298.4]
  assign RamSync_1_io_wa = io_req_index; // @[DCache.scala 85:19:@299.4]
  assign RamSync_1_io_di = {_T_284,_T_283}; // @[DCache.scala 86:19:@303.4]
  assign RamSync_2_clock = clock; // @[:@265.4]
  assign RamSync_2_io_re = _T_278 & io_req_valid; // @[DCache.scala 82:19:@314.4]
  assign RamSync_2_io_we = _T_280 & _T_307; // @[DCache.scala 83:19:@318.4]
  assign RamSync_2_io_ra = io_req_index; // @[DCache.scala 84:19:@319.4]
  assign RamSync_2_io_wa = io_req_index; // @[DCache.scala 85:19:@320.4]
  assign RamSync_2_io_di = {_T_284,_T_283}; // @[DCache.scala 86:19:@324.4]
  assign RamSync_3_clock = clock; // @[:@268.4]
  assign RamSync_3_io_re = _T_278 & io_req_valid; // @[DCache.scala 82:19:@335.4]
  assign RamSync_3_io_we = _T_280 & _T_320; // @[DCache.scala 83:19:@339.4]
  assign RamSync_3_io_ra = io_req_index; // @[DCache.scala 84:19:@340.4]
  assign RamSync_3_io_wa = io_req_index; // @[DCache.scala 85:19:@341.4]
  assign RamSync_3_io_di = {_T_284,_T_283}; // @[DCache.scala 86:19:@345.4]
endmodule
module DCache( // @[:@355.2]
  input          clock, // @[:@356.4]
  input          reset, // @[:@357.4]
  input  [31:0]  io_masterReq_addr, // @[:@358.4]
  input  [31:0]  io_masterReq_data, // @[:@358.4]
  input          io_masterReq_write, // @[:@358.4]
  input          io_masterReq_valid, // @[:@358.4]
  output [31:0]  io_masterResp_data, // @[:@358.4]
  output         io_masterResp_ready, // @[:@358.4]
  output [31:0]  io_memReq_addr, // @[:@358.4]
  output [127:0] io_memReq_data, // @[:@358.4]
  output         io_memReq_write, // @[:@358.4]
  output         io_memReq_valid, // @[:@358.4]
  input  [127:0] io_memResp_data, // @[:@358.4]
  input          io_memResp_ready // @[:@358.4]
);
  wire  tagMemInst_clock; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_req_write; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_req_valid; // @[DCache.scala 125:26:@479.4]
  wire [7:0] tagMemInst_io_req_index; // @[DCache.scala 125:26:@479.4]
  wire [3:0] tagMemInst_io_req_wayIdx; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_wdata_valid; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_wdata_dirty; // @[DCache.scala 125:26:@479.4]
  wire [19:0] tagMemInst_io_wdata_tag; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_0_valid; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_0_dirty; // @[DCache.scala 125:26:@479.4]
  wire [19:0] tagMemInst_io_rdata_0_tag; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_1_valid; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_1_dirty; // @[DCache.scala 125:26:@479.4]
  wire [19:0] tagMemInst_io_rdata_1_tag; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_2_valid; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_2_dirty; // @[DCache.scala 125:26:@479.4]
  wire [19:0] tagMemInst_io_rdata_2_tag; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_3_valid; // @[DCache.scala 125:26:@479.4]
  wire  tagMemInst_io_rdata_3_dirty; // @[DCache.scala 125:26:@479.4]
  wire [19:0] tagMemInst_io_rdata_3_tag; // @[DCache.scala 125:26:@479.4]
  wire  dataMemInst_clock; // @[DCache.scala 131:27:@501.4]
  wire  dataMemInst_io_req_write; // @[DCache.scala 131:27:@501.4]
  wire  dataMemInst_io_req_valid; // @[DCache.scala 131:27:@501.4]
  wire [7:0] dataMemInst_io_req_index; // @[DCache.scala 131:27:@501.4]
  wire [3:0] dataMemInst_io_req_wayIdx; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_wdata_0; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_wdata_1; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_wdata_2; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_wdata_3; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_0_0; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_0_1; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_0_2; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_0_3; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_1_0; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_1_1; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_1_2; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_1_3; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_2_0; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_2_1; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_2_2; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_2_3; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_3_0; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_3_1; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_3_2; // @[DCache.scala 131:27:@501.4]
  wire [31:0] dataMemInst_io_rdata_3_3; // @[DCache.scala 131:27:@501.4]
  wire [19:0] masterTag; // @[DCache.scala 102:36:@360.4]
  wire [7:0] masterIndex; // @[DCache.scala 103:38:@361.4]
  wire [19:0] tagReadValue_0_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@414.4 DCache.scala 128:16:@489.4]
  wire  _T_449; // @[DCache.scala 139:48:@533.4]
  wire  tagReadValue_0_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@416.4 DCache.scala 128:16:@491.4]
  wire  tagValidHitsVec_0; // @[DCache.scala 139:63:@535.4]
  wire [19:0] tagReadValue_1_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@417.4 DCache.scala 128:16:@492.4]
  wire  _T_453; // @[DCache.scala 139:48:@537.4]
  wire  tagReadValue_1_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@419.4 DCache.scala 128:16:@494.4]
  wire  tagValidHitsVec_1; // @[DCache.scala 139:63:@539.4]
  wire [19:0] tagReadValue_2_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@420.4 DCache.scala 128:16:@495.4]
  wire  _T_457; // @[DCache.scala 139:48:@541.4]
  wire  tagReadValue_2_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@422.4 DCache.scala 128:16:@497.4]
  wire  tagValidHitsVec_2; // @[DCache.scala 139:63:@543.4]
  wire [19:0] tagReadValue_3_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@423.4 DCache.scala 128:16:@498.4]
  wire  _T_461; // @[DCache.scala 139:48:@545.4]
  wire  tagReadValue_3_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@425.4 DCache.scala 128:16:@500.4]
  wire  tagValidHitsVec_3; // @[DCache.scala 139:63:@547.4]
  wire [1:0] _T_465; // @[DCache.scala 141:44:@549.4]
  wire [1:0] _T_466; // @[DCache.scala 141:44:@550.4]
  wire [3:0] tagValidHits; // @[DCache.scala 141:44:@551.4]
  wire  _T_468; // @[DCache.scala 147:68:@553.4]
  wire [31:0] dataReadValue_0_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@454.4 DCache.scala 134:17:@513.4]
  wire [31:0] dataReadValue_0_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@453.4 DCache.scala 134:17:@512.4]
  wire [63:0] _T_470; // @[DCache.scala 147:101:@554.4]
  wire [31:0] dataReadValue_0_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@456.4 DCache.scala 134:17:@515.4]
  wire [31:0] dataReadValue_0_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@455.4 DCache.scala 134:17:@514.4]
  wire [63:0] _T_471; // @[DCache.scala 147:101:@555.4]
  wire [127:0] _T_472; // @[DCache.scala 147:101:@556.4]
  wire [127:0] _T_473; // @[DCache.scala 147:55:@557.4]
  wire  _T_474; // @[DCache.scala 147:68:@558.4]
  wire [31:0] dataReadValue_1_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@458.4 DCache.scala 134:17:@517.4]
  wire [31:0] dataReadValue_1_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@457.4 DCache.scala 134:17:@516.4]
  wire [63:0] _T_476; // @[DCache.scala 147:101:@559.4]
  wire [31:0] dataReadValue_1_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@460.4 DCache.scala 134:17:@519.4]
  wire [31:0] dataReadValue_1_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@459.4 DCache.scala 134:17:@518.4]
  wire [63:0] _T_477; // @[DCache.scala 147:101:@560.4]
  wire [127:0] _T_478; // @[DCache.scala 147:101:@561.4]
  wire [127:0] _T_479; // @[DCache.scala 147:55:@562.4]
  wire  _T_480; // @[DCache.scala 147:68:@563.4]
  wire [31:0] dataReadValue_2_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@462.4 DCache.scala 134:17:@521.4]
  wire [31:0] dataReadValue_2_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@461.4 DCache.scala 134:17:@520.4]
  wire [63:0] _T_482; // @[DCache.scala 147:101:@564.4]
  wire [31:0] dataReadValue_2_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@464.4 DCache.scala 134:17:@523.4]
  wire [31:0] dataReadValue_2_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@463.4 DCache.scala 134:17:@522.4]
  wire [63:0] _T_483; // @[DCache.scala 147:101:@565.4]
  wire [127:0] _T_484; // @[DCache.scala 147:101:@566.4]
  wire [127:0] _T_485; // @[DCache.scala 147:55:@567.4]
  wire  _T_486; // @[DCache.scala 147:68:@568.4]
  wire [31:0] dataReadValue_3_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@466.4 DCache.scala 134:17:@525.4]
  wire [31:0] dataReadValue_3_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@465.4 DCache.scala 134:17:@524.4]
  wire [63:0] _T_488; // @[DCache.scala 147:101:@569.4]
  wire [31:0] dataReadValue_3_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@468.4 DCache.scala 134:17:@527.4]
  wire [31:0] dataReadValue_3_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@467.4 DCache.scala 134:17:@526.4]
  wire [63:0] _T_489; // @[DCache.scala 147:101:@570.4]
  wire [127:0] _T_490; // @[DCache.scala 147:101:@571.4]
  wire [127:0] _T_491; // @[DCache.scala 147:55:@572.4]
  wire [127:0] _T_492; // @[DCache.scala 147:115:@573.4]
  wire [127:0] _T_493; // @[DCache.scala 147:115:@574.4]
  wire [127:0] masterRespDataFlat; // @[DCache.scala 147:115:@575.4]
  wire [31:0] masterRespData_0; // @[DCache.scala 151:44:@581.4]
  wire [31:0] masterRespData_1; // @[DCache.scala 151:44:@583.4]
  wire [31:0] masterRespData_2; // @[DCache.scala 151:44:@585.4]
  wire [31:0] masterRespData_3; // @[DCache.scala 151:44:@587.4]
  wire [1:0] dataIdx; // @[DCache.scala 154:34:@589.4]
  wire [31:0] _GEN_1; // @[DCache.scala 155:22:@590.4]
  wire [31:0] _GEN_2; // @[DCache.scala 155:22:@590.4]
  wire [27:0] _T_512; // @[DCache.scala 158:42:@591.4]
  wire [31:0] _T_514; // @[Cat.scala 30:58:@592.4]
  wire [63:0] _T_515; // @[DCache.scala 159:42:@594.4]
  wire [63:0] _T_516; // @[DCache.scala 159:42:@595.4]
  wire [31:0] _GEN_4; // @[DCache.scala 164:27:@604.4]
  wire [31:0] _GEN_5; // @[DCache.scala 164:27:@604.4]
  wire [31:0] _GEN_6; // @[DCache.scala 164:27:@604.4]
  wire [31:0] _GEN_7; // @[DCache.scala 164:27:@604.4]
  reg [2:0] state; // @[DCache.scala 168:22:@605.4]
  reg [31:0] _RAND_0;
  reg [1:0] replaceWay; // @[DCache.scala 171:27:@609.4]
  reg [31:0] _RAND_1;
  wire  tagReadValue_0_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@415.4 DCache.scala 128:16:@490.4]
  wire  _GEN_11; // @[DCache.scala 172:54:@610.4]
  wire  tagReadValue_1_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@418.4 DCache.scala 128:16:@493.4]
  wire  _GEN_12; // @[DCache.scala 172:54:@610.4]
  wire [19:0] _GEN_13; // @[DCache.scala 172:54:@610.4]
  wire  _GEN_14; // @[DCache.scala 172:54:@610.4]
  wire  tagReadValue_2_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@421.4 DCache.scala 128:16:@496.4]
  wire  _GEN_15; // @[DCache.scala 172:54:@610.4]
  wire [19:0] _GEN_16; // @[DCache.scala 172:54:@610.4]
  wire  _GEN_17; // @[DCache.scala 172:54:@610.4]
  wire  tagReadValue_3_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@424.4 DCache.scala 128:16:@499.4]
  wire  _GEN_18; // @[DCache.scala 172:54:@610.4]
  wire [19:0] _GEN_19; // @[DCache.scala 172:54:@610.4]
  wire  needWriteBack; // @[DCache.scala 172:54:@610.4]
  wire  _T_527; // @[Conditional.scala 37:30:@611.4]
  wire [2:0] _T_528; // @[DCache.scala 176:23:@613.6]
  wire  _T_529; // @[Conditional.scala 37:30:@617.6]
  wire  _T_531; // @[DCache.scala 179:25:@619.8]
  wire [19:0] _T_540; // @[DCache.scala 188:59:@629.12]
  wire [19:0] _T_543; // @[DCache.scala 188:59:@631.12]
  wire [19:0] _T_546; // @[DCache.scala 188:59:@633.12]
  wire [19:0] _T_549; // @[DCache.scala 188:59:@635.12]
  wire [19:0] _T_550; // @[DCache.scala 188:113:@636.12]
  wire [19:0] _T_551; // @[DCache.scala 188:113:@637.12]
  wire [19:0] _T_552; // @[DCache.scala 188:113:@638.12]
  wire [3:0] _GEN_21; // @[DCache.scala 181:42:@623.10]
  wire [19:0] _GEN_24; // @[DCache.scala 181:42:@623.10]
  wire  _GEN_27; // @[DCache.scala 179:30:@620.8]
  wire [3:0] _GEN_28; // @[DCache.scala 179:30:@620.8]
  wire [19:0] _GEN_31; // @[DCache.scala 179:30:@620.8]
  wire [2:0] _GEN_33; // @[DCache.scala 179:30:@620.8]
  wire [1:0] _GEN_34; // @[DCache.scala 179:30:@620.8]
  wire  _T_555; // @[Conditional.scala 37:30:@653.8]
  wire [27:0] _T_564; // @[Cat.scala 30:58:@664.12]
  wire [31:0] _T_565; // @[Cat.scala 30:58:@665.12]
  wire [31:0] _GEN_36; // @[DCache.scala 210:27:@661.10]
  wire [2:0] _GEN_37; // @[DCache.scala 210:27:@661.10]
  wire  _T_566; // @[Conditional.scala 37:30:@674.10]
  wire [31:0] _T_568; // @[DCache.scala 224:47:@679.14]
  wire [31:0] _T_569; // @[DCache.scala 224:47:@681.14]
  wire [31:0] _T_570; // @[DCache.scala 224:47:@683.14]
  wire [31:0] _T_571; // @[DCache.scala 224:47:@685.14]
  wire [3:0] _GEN_39; // @[DCache.scala 219:30:@676.12]
  wire [31:0] _GEN_40; // @[DCache.scala 219:30:@676.12]
  wire [31:0] _GEN_41; // @[DCache.scala 219:30:@676.12]
  wire [31:0] _GEN_42; // @[DCache.scala 219:30:@676.12]
  wire [31:0] _GEN_43; // @[DCache.scala 219:30:@676.12]
  wire [2:0] _GEN_44; // @[DCache.scala 219:30:@676.12]
  wire  _T_572; // @[Conditional.scala 37:30:@691.12]
  wire [2:0] _GEN_45; // @[DCache.scala 230:30:@693.14]
  wire  _GEN_46; // @[Conditional.scala 39:67:@692.12]
  wire [2:0] _GEN_47; // @[Conditional.scala 39:67:@692.12]
  wire  _GEN_48; // @[Conditional.scala 39:67:@675.10]
  wire [3:0] _GEN_49; // @[Conditional.scala 39:67:@675.10]
  wire [31:0] _GEN_50; // @[Conditional.scala 39:67:@675.10]
  wire [31:0] _GEN_51; // @[Conditional.scala 39:67:@675.10]
  wire [31:0] _GEN_52; // @[Conditional.scala 39:67:@675.10]
  wire [31:0] _GEN_53; // @[Conditional.scala 39:67:@675.10]
  wire [2:0] _GEN_54; // @[Conditional.scala 39:67:@675.10]
  wire  _GEN_55; // @[Conditional.scala 39:67:@675.10]
  wire [3:0] _GEN_57; // @[Conditional.scala 39:67:@654.8]
  wire [19:0] _GEN_60; // @[Conditional.scala 39:67:@654.8]
  wire  _GEN_61; // @[Conditional.scala 39:67:@654.8]
  wire  _GEN_62; // @[Conditional.scala 39:67:@654.8]
  wire [31:0] _GEN_63; // @[Conditional.scala 39:67:@654.8]
  wire [2:0] _GEN_64; // @[Conditional.scala 39:67:@654.8]
  wire  _GEN_65; // @[Conditional.scala 39:67:@654.8]
  wire [3:0] _GEN_66; // @[Conditional.scala 39:67:@654.8]
  wire [31:0] _GEN_67; // @[Conditional.scala 39:67:@654.8]
  wire [31:0] _GEN_68; // @[Conditional.scala 39:67:@654.8]
  wire [31:0] _GEN_69; // @[Conditional.scala 39:67:@654.8]
  wire [31:0] _GEN_70; // @[Conditional.scala 39:67:@654.8]
  wire  _GEN_71; // @[Conditional.scala 39:67:@618.6]
  wire  _GEN_72; // @[Conditional.scala 39:67:@618.6]
  wire [3:0] _GEN_73; // @[Conditional.scala 39:67:@618.6]
  wire [19:0] _GEN_76; // @[Conditional.scala 39:67:@618.6]
  wire  _GEN_77; // @[Conditional.scala 39:67:@618.6]
  wire [3:0] _GEN_78; // @[Conditional.scala 39:67:@618.6]
  wire [2:0] _GEN_79; // @[Conditional.scala 39:67:@618.6]
  wire [1:0] _GEN_80; // @[Conditional.scala 39:67:@618.6]
  wire  _GEN_81; // @[Conditional.scala 39:67:@618.6]
  wire  _GEN_82; // @[Conditional.scala 39:67:@618.6]
  wire [31:0] _GEN_83; // @[Conditional.scala 39:67:@618.6]
  wire [31:0] _GEN_84; // @[Conditional.scala 39:67:@618.6]
  wire [31:0] _GEN_85; // @[Conditional.scala 39:67:@618.6]
  wire [31:0] _GEN_86; // @[Conditional.scala 39:67:@618.6]
  wire [31:0] _GEN_87; // @[Conditional.scala 39:67:@618.6]
  wire [2:0] nextState; // @[Conditional.scala 40:58:@612.4]
  wire [1:0] _GEN_97; // @[Conditional.scala 40:58:@612.4]
  TagMem tagMemInst ( // @[DCache.scala 125:26:@479.4]
    .clock(tagMemInst_clock),
    .io_req_write(tagMemInst_io_req_write),
    .io_req_valid(tagMemInst_io_req_valid),
    .io_req_index(tagMemInst_io_req_index),
    .io_req_wayIdx(tagMemInst_io_req_wayIdx),
    .io_wdata_valid(tagMemInst_io_wdata_valid),
    .io_wdata_dirty(tagMemInst_io_wdata_dirty),
    .io_wdata_tag(tagMemInst_io_wdata_tag),
    .io_rdata_0_valid(tagMemInst_io_rdata_0_valid),
    .io_rdata_0_dirty(tagMemInst_io_rdata_0_dirty),
    .io_rdata_0_tag(tagMemInst_io_rdata_0_tag),
    .io_rdata_1_valid(tagMemInst_io_rdata_1_valid),
    .io_rdata_1_dirty(tagMemInst_io_rdata_1_dirty),
    .io_rdata_1_tag(tagMemInst_io_rdata_1_tag),
    .io_rdata_2_valid(tagMemInst_io_rdata_2_valid),
    .io_rdata_2_dirty(tagMemInst_io_rdata_2_dirty),
    .io_rdata_2_tag(tagMemInst_io_rdata_2_tag),
    .io_rdata_3_valid(tagMemInst_io_rdata_3_valid),
    .io_rdata_3_dirty(tagMemInst_io_rdata_3_dirty),
    .io_rdata_3_tag(tagMemInst_io_rdata_3_tag)
  );
  DataMem dataMemInst ( // @[DCache.scala 131:27:@501.4]
    .clock(dataMemInst_clock),
    .io_req_write(dataMemInst_io_req_write),
    .io_req_valid(dataMemInst_io_req_valid),
    .io_req_index(dataMemInst_io_req_index),
    .io_req_wayIdx(dataMemInst_io_req_wayIdx),
    .io_wdata_0(dataMemInst_io_wdata_0),
    .io_wdata_1(dataMemInst_io_wdata_1),
    .io_wdata_2(dataMemInst_io_wdata_2),
    .io_wdata_3(dataMemInst_io_wdata_3),
    .io_rdata_0_0(dataMemInst_io_rdata_0_0),
    .io_rdata_0_1(dataMemInst_io_rdata_0_1),
    .io_rdata_0_2(dataMemInst_io_rdata_0_2),
    .io_rdata_0_3(dataMemInst_io_rdata_0_3),
    .io_rdata_1_0(dataMemInst_io_rdata_1_0),
    .io_rdata_1_1(dataMemInst_io_rdata_1_1),
    .io_rdata_1_2(dataMemInst_io_rdata_1_2),
    .io_rdata_1_3(dataMemInst_io_rdata_1_3),
    .io_rdata_2_0(dataMemInst_io_rdata_2_0),
    .io_rdata_2_1(dataMemInst_io_rdata_2_1),
    .io_rdata_2_2(dataMemInst_io_rdata_2_2),
    .io_rdata_2_3(dataMemInst_io_rdata_2_3),
    .io_rdata_3_0(dataMemInst_io_rdata_3_0),
    .io_rdata_3_1(dataMemInst_io_rdata_3_1),
    .io_rdata_3_2(dataMemInst_io_rdata_3_2),
    .io_rdata_3_3(dataMemInst_io_rdata_3_3)
  );
  assign masterTag = io_masterReq_addr[31:12]; // @[DCache.scala 102:36:@360.4]
  assign masterIndex = io_masterReq_addr[11:4]; // @[DCache.scala 103:38:@361.4]
  assign tagReadValue_0_tag = tagMemInst_io_rdata_0_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@414.4 DCache.scala 128:16:@489.4]
  assign _T_449 = tagReadValue_0_tag == masterTag; // @[DCache.scala 139:48:@533.4]
  assign tagReadValue_0_valid = tagMemInst_io_rdata_0_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@416.4 DCache.scala 128:16:@491.4]
  assign tagValidHitsVec_0 = _T_449 & tagReadValue_0_valid; // @[DCache.scala 139:63:@535.4]
  assign tagReadValue_1_tag = tagMemInst_io_rdata_1_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@417.4 DCache.scala 128:16:@492.4]
  assign _T_453 = tagReadValue_1_tag == masterTag; // @[DCache.scala 139:48:@537.4]
  assign tagReadValue_1_valid = tagMemInst_io_rdata_1_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@419.4 DCache.scala 128:16:@494.4]
  assign tagValidHitsVec_1 = _T_453 & tagReadValue_1_valid; // @[DCache.scala 139:63:@539.4]
  assign tagReadValue_2_tag = tagMemInst_io_rdata_2_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@420.4 DCache.scala 128:16:@495.4]
  assign _T_457 = tagReadValue_2_tag == masterTag; // @[DCache.scala 139:48:@541.4]
  assign tagReadValue_2_valid = tagMemInst_io_rdata_2_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@422.4 DCache.scala 128:16:@497.4]
  assign tagValidHitsVec_2 = _T_457 & tagReadValue_2_valid; // @[DCache.scala 139:63:@543.4]
  assign tagReadValue_3_tag = tagMemInst_io_rdata_3_tag; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@423.4 DCache.scala 128:16:@498.4]
  assign _T_461 = tagReadValue_3_tag == masterTag; // @[DCache.scala 139:48:@545.4]
  assign tagReadValue_3_valid = tagMemInst_io_rdata_3_valid; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@425.4 DCache.scala 128:16:@500.4]
  assign tagValidHitsVec_3 = _T_461 & tagReadValue_3_valid; // @[DCache.scala 139:63:@547.4]
  assign _T_465 = {tagValidHitsVec_1,tagValidHitsVec_0}; // @[DCache.scala 141:44:@549.4]
  assign _T_466 = {tagValidHitsVec_3,tagValidHitsVec_2}; // @[DCache.scala 141:44:@550.4]
  assign tagValidHits = {_T_466,_T_465}; // @[DCache.scala 141:44:@551.4]
  assign _T_468 = tagValidHits[0]; // @[DCache.scala 147:68:@553.4]
  assign dataReadValue_0_1 = dataMemInst_io_rdata_0_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@454.4 DCache.scala 134:17:@513.4]
  assign dataReadValue_0_0 = dataMemInst_io_rdata_0_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@453.4 DCache.scala 134:17:@512.4]
  assign _T_470 = {dataReadValue_0_1,dataReadValue_0_0}; // @[DCache.scala 147:101:@554.4]
  assign dataReadValue_0_3 = dataMemInst_io_rdata_0_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@456.4 DCache.scala 134:17:@515.4]
  assign dataReadValue_0_2 = dataMemInst_io_rdata_0_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@455.4 DCache.scala 134:17:@514.4]
  assign _T_471 = {dataReadValue_0_3,dataReadValue_0_2}; // @[DCache.scala 147:101:@555.4]
  assign _T_472 = {_T_471,_T_470}; // @[DCache.scala 147:101:@556.4]
  assign _T_473 = _T_468 ? 128'h0 : _T_472; // @[DCache.scala 147:55:@557.4]
  assign _T_474 = tagValidHits[1]; // @[DCache.scala 147:68:@558.4]
  assign dataReadValue_1_1 = dataMemInst_io_rdata_1_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@458.4 DCache.scala 134:17:@517.4]
  assign dataReadValue_1_0 = dataMemInst_io_rdata_1_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@457.4 DCache.scala 134:17:@516.4]
  assign _T_476 = {dataReadValue_1_1,dataReadValue_1_0}; // @[DCache.scala 147:101:@559.4]
  assign dataReadValue_1_3 = dataMemInst_io_rdata_1_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@460.4 DCache.scala 134:17:@519.4]
  assign dataReadValue_1_2 = dataMemInst_io_rdata_1_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@459.4 DCache.scala 134:17:@518.4]
  assign _T_477 = {dataReadValue_1_3,dataReadValue_1_2}; // @[DCache.scala 147:101:@560.4]
  assign _T_478 = {_T_477,_T_476}; // @[DCache.scala 147:101:@561.4]
  assign _T_479 = _T_474 ? 128'h0 : _T_478; // @[DCache.scala 147:55:@562.4]
  assign _T_480 = tagValidHits[2]; // @[DCache.scala 147:68:@563.4]
  assign dataReadValue_2_1 = dataMemInst_io_rdata_2_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@462.4 DCache.scala 134:17:@521.4]
  assign dataReadValue_2_0 = dataMemInst_io_rdata_2_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@461.4 DCache.scala 134:17:@520.4]
  assign _T_482 = {dataReadValue_2_1,dataReadValue_2_0}; // @[DCache.scala 147:101:@564.4]
  assign dataReadValue_2_3 = dataMemInst_io_rdata_2_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@464.4 DCache.scala 134:17:@523.4]
  assign dataReadValue_2_2 = dataMemInst_io_rdata_2_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@463.4 DCache.scala 134:17:@522.4]
  assign _T_483 = {dataReadValue_2_3,dataReadValue_2_2}; // @[DCache.scala 147:101:@565.4]
  assign _T_484 = {_T_483,_T_482}; // @[DCache.scala 147:101:@566.4]
  assign _T_485 = _T_480 ? 128'h0 : _T_484; // @[DCache.scala 147:55:@567.4]
  assign _T_486 = tagValidHits[3]; // @[DCache.scala 147:68:@568.4]
  assign dataReadValue_3_1 = dataMemInst_io_rdata_3_1; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@466.4 DCache.scala 134:17:@525.4]
  assign dataReadValue_3_0 = dataMemInst_io_rdata_3_0; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@465.4 DCache.scala 134:17:@524.4]
  assign _T_488 = {dataReadValue_3_1,dataReadValue_3_0}; // @[DCache.scala 147:101:@569.4]
  assign dataReadValue_3_3 = dataMemInst_io_rdata_3_3; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@468.4 DCache.scala 134:17:@527.4]
  assign dataReadValue_3_2 = dataMemInst_io_rdata_3_2; // @[DCache.scala 111:30:@452.4 DCache.scala 111:30:@467.4 DCache.scala 134:17:@526.4]
  assign _T_489 = {dataReadValue_3_3,dataReadValue_3_2}; // @[DCache.scala 147:101:@570.4]
  assign _T_490 = {_T_489,_T_488}; // @[DCache.scala 147:101:@571.4]
  assign _T_491 = _T_486 ? 128'h0 : _T_490; // @[DCache.scala 147:55:@572.4]
  assign _T_492 = _T_473 | _T_479; // @[DCache.scala 147:115:@573.4]
  assign _T_493 = _T_492 | _T_485; // @[DCache.scala 147:115:@574.4]
  assign masterRespDataFlat = _T_493 | _T_491; // @[DCache.scala 147:115:@575.4]
  assign masterRespData_0 = masterRespDataFlat[31:0]; // @[DCache.scala 151:44:@581.4]
  assign masterRespData_1 = masterRespDataFlat[63:32]; // @[DCache.scala 151:44:@583.4]
  assign masterRespData_2 = masterRespDataFlat[95:64]; // @[DCache.scala 151:44:@585.4]
  assign masterRespData_3 = masterRespDataFlat[127:96]; // @[DCache.scala 151:44:@587.4]
  assign dataIdx = io_masterReq_addr[3:2]; // @[DCache.scala 154:34:@589.4]
  assign _GEN_1 = 2'h1 == dataIdx ? masterRespData_1 : masterRespData_0; // @[DCache.scala 155:22:@590.4]
  assign _GEN_2 = 2'h2 == dataIdx ? masterRespData_2 : _GEN_1; // @[DCache.scala 155:22:@590.4]
  assign _T_512 = io_masterReq_addr[31:4]; // @[DCache.scala 158:42:@591.4]
  assign _T_514 = {_T_512,4'h0}; // @[Cat.scala 30:58:@592.4]
  assign _T_515 = {masterRespData_1,masterRespData_0}; // @[DCache.scala 159:42:@594.4]
  assign _T_516 = {masterRespData_3,masterRespData_2}; // @[DCache.scala 159:42:@595.4]
  assign _GEN_4 = 2'h0 == dataIdx ? io_masterReq_data : masterRespData_0; // @[DCache.scala 164:27:@604.4]
  assign _GEN_5 = 2'h1 == dataIdx ? io_masterReq_data : masterRespData_1; // @[DCache.scala 164:27:@604.4]
  assign _GEN_6 = 2'h2 == dataIdx ? io_masterReq_data : masterRespData_2; // @[DCache.scala 164:27:@604.4]
  assign _GEN_7 = 2'h3 == dataIdx ? io_masterReq_data : masterRespData_3; // @[DCache.scala 164:27:@604.4]
  assign tagReadValue_0_dirty = tagMemInst_io_rdata_0_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@415.4 DCache.scala 128:16:@490.4]
  assign _GEN_11 = 2'h1 == replaceWay ? tagReadValue_1_valid : tagReadValue_0_valid; // @[DCache.scala 172:54:@610.4]
  assign tagReadValue_1_dirty = tagMemInst_io_rdata_1_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@418.4 DCache.scala 128:16:@493.4]
  assign _GEN_12 = 2'h1 == replaceWay ? tagReadValue_1_dirty : tagReadValue_0_dirty; // @[DCache.scala 172:54:@610.4]
  assign _GEN_13 = 2'h1 == replaceWay ? tagReadValue_1_tag : tagReadValue_0_tag; // @[DCache.scala 172:54:@610.4]
  assign _GEN_14 = 2'h2 == replaceWay ? tagReadValue_2_valid : _GEN_11; // @[DCache.scala 172:54:@610.4]
  assign tagReadValue_2_dirty = tagMemInst_io_rdata_2_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@421.4 DCache.scala 128:16:@496.4]
  assign _GEN_15 = 2'h2 == replaceWay ? tagReadValue_2_dirty : _GEN_12; // @[DCache.scala 172:54:@610.4]
  assign _GEN_16 = 2'h2 == replaceWay ? tagReadValue_2_tag : _GEN_13; // @[DCache.scala 172:54:@610.4]
  assign _GEN_17 = 2'h3 == replaceWay ? tagReadValue_3_valid : _GEN_14; // @[DCache.scala 172:54:@610.4]
  assign tagReadValue_3_dirty = tagMemInst_io_rdata_3_dirty; // @[DCache.scala 108:29:@413.4 DCache.scala 108:29:@424.4 DCache.scala 128:16:@499.4]
  assign _GEN_18 = 2'h3 == replaceWay ? tagReadValue_3_dirty : _GEN_15; // @[DCache.scala 172:54:@610.4]
  assign _GEN_19 = 2'h3 == replaceWay ? tagReadValue_3_tag : _GEN_16; // @[DCache.scala 172:54:@610.4]
  assign needWriteBack = _GEN_17 & _GEN_18; // @[DCache.scala 172:54:@610.4]
  assign _T_527 = 3'h0 == state; // @[Conditional.scala 37:30:@611.4]
  assign _T_528 = io_masterReq_valid ? 3'h1 : 3'h0; // @[DCache.scala 176:23:@613.6]
  assign _T_529 = 3'h1 == state; // @[Conditional.scala 37:30:@617.6]
  assign _T_531 = tagValidHits != 4'h0; // @[DCache.scala 179:25:@619.8]
  assign _T_540 = _T_468 ? 20'h0 : tagReadValue_0_tag; // @[DCache.scala 188:59:@629.12]
  assign _T_543 = _T_474 ? 20'h0 : tagReadValue_1_tag; // @[DCache.scala 188:59:@631.12]
  assign _T_546 = _T_480 ? 20'h0 : tagReadValue_2_tag; // @[DCache.scala 188:59:@633.12]
  assign _T_549 = _T_486 ? 20'h0 : tagReadValue_3_tag; // @[DCache.scala 188:59:@635.12]
  assign _T_550 = _T_540 | _T_543; // @[DCache.scala 188:113:@636.12]
  assign _T_551 = _T_550 | _T_546; // @[DCache.scala 188:113:@637.12]
  assign _T_552 = _T_551 | _T_549; // @[DCache.scala 188:113:@638.12]
  assign _GEN_21 = io_masterReq_write ? tagValidHits : 4'hf; // @[DCache.scala 181:42:@623.10]
  assign _GEN_24 = io_masterReq_write ? _T_552 : 20'h0; // @[DCache.scala 181:42:@623.10]
  assign _GEN_27 = _T_531 ? io_masterReq_write : 1'h0; // @[DCache.scala 179:30:@620.8]
  assign _GEN_28 = _T_531 ? _GEN_21 : 4'hf; // @[DCache.scala 179:30:@620.8]
  assign _GEN_31 = _T_531 ? _GEN_24 : 20'h0; // @[DCache.scala 179:30:@620.8]
  assign _GEN_33 = _T_531 ? 3'h0 : 3'h2; // @[DCache.scala 179:30:@620.8]
  assign _GEN_34 = _T_531 ? replaceWay : 2'h3; // @[DCache.scala 179:30:@620.8]
  assign _T_555 = 3'h2 == state; // @[Conditional.scala 37:30:@653.8]
  assign _T_564 = {_GEN_19,masterIndex}; // @[Cat.scala 30:58:@664.12]
  assign _T_565 = {_T_564,4'h0}; // @[Cat.scala 30:58:@665.12]
  assign _GEN_36 = needWriteBack ? _T_565 : _T_514; // @[DCache.scala 210:27:@661.10]
  assign _GEN_37 = needWriteBack ? 3'h3 : 3'h4; // @[DCache.scala 210:27:@661.10]
  assign _T_566 = 3'h4 == state; // @[Conditional.scala 37:30:@674.10]
  assign _T_568 = io_memResp_data[31:0]; // @[DCache.scala 224:47:@679.14]
  assign _T_569 = io_memResp_data[63:32]; // @[DCache.scala 224:47:@681.14]
  assign _T_570 = io_memResp_data[95:64]; // @[DCache.scala 224:47:@683.14]
  assign _T_571 = io_memResp_data[127:96]; // @[DCache.scala 224:47:@685.14]
  assign _GEN_39 = io_memResp_ready ? {{2'd0}, replaceWay} : 4'hf; // @[DCache.scala 219:30:@676.12]
  assign _GEN_40 = io_memResp_ready ? _T_568 : _GEN_4; // @[DCache.scala 219:30:@676.12]
  assign _GEN_41 = io_memResp_ready ? _T_569 : _GEN_5; // @[DCache.scala 219:30:@676.12]
  assign _GEN_42 = io_memResp_ready ? _T_570 : _GEN_6; // @[DCache.scala 219:30:@676.12]
  assign _GEN_43 = io_memResp_ready ? _T_571 : _GEN_7; // @[DCache.scala 219:30:@676.12]
  assign _GEN_44 = io_memResp_ready ? 3'h1 : 3'h0; // @[DCache.scala 219:30:@676.12]
  assign _T_572 = 3'h3 == state; // @[Conditional.scala 37:30:@691.12]
  assign _GEN_45 = io_memResp_ready ? 3'h4 : 3'h0; // @[DCache.scala 230:30:@693.14]
  assign _GEN_46 = _T_572 ? io_memResp_ready : 1'h0; // @[Conditional.scala 39:67:@692.12]
  assign _GEN_47 = _T_572 ? _GEN_45 : 3'h0; // @[Conditional.scala 39:67:@692.12]
  assign _GEN_48 = _T_566 ? io_memResp_ready : 1'h0; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_49 = _T_566 ? _GEN_39 : 4'hf; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_50 = _T_566 ? _GEN_40 : _GEN_4; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_51 = _T_566 ? _GEN_41 : _GEN_5; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_52 = _T_566 ? _GEN_42 : _GEN_6; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_53 = _T_566 ? _GEN_43 : _GEN_7; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_54 = _T_566 ? _GEN_44 : _GEN_47; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_55 = _T_566 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67:@675.10]
  assign _GEN_57 = _T_555 ? {{2'd0}, replaceWay} : 4'hf; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_60 = _T_555 ? masterTag : 20'h0; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_61 = _T_555 ? 1'h1 : _GEN_55; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_62 = _T_555 ? needWriteBack : 1'h0; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_63 = _T_555 ? _GEN_36 : _T_514; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_64 = _T_555 ? _GEN_37 : _GEN_54; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_65 = _T_555 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_66 = _T_555 ? 4'hf : _GEN_49; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_67 = _T_555 ? _GEN_4 : _GEN_50; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_68 = _T_555 ? _GEN_5 : _GEN_51; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_69 = _T_555 ? _GEN_6 : _GEN_52; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_70 = _T_555 ? _GEN_7 : _GEN_53; // @[Conditional.scala 39:67:@654.8]
  assign _GEN_71 = _T_529 ? _T_531 : 1'h0; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_72 = _T_529 ? _GEN_27 : _T_555; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_73 = _T_529 ? _GEN_28 : _GEN_57; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_76 = _T_529 ? _GEN_31 : _GEN_60; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_77 = _T_529 ? _GEN_27 : _GEN_65; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_78 = _T_529 ? _GEN_28 : _GEN_66; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_79 = _T_529 ? _GEN_33 : _GEN_64; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_80 = _T_529 ? _GEN_34 : replaceWay; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_81 = _T_529 ? 1'h0 : _GEN_61; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_82 = _T_529 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_83 = _T_529 ? _T_514 : _GEN_63; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_84 = _T_529 ? _GEN_4 : _GEN_67; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_85 = _T_529 ? _GEN_5 : _GEN_68; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_86 = _T_529 ? _GEN_6 : _GEN_69; // @[Conditional.scala 39:67:@618.6]
  assign _GEN_87 = _T_529 ? _GEN_7 : _GEN_70; // @[Conditional.scala 39:67:@618.6]
  assign nextState = _T_527 ? _T_528 : _GEN_79; // @[Conditional.scala 40:58:@612.4]
  assign _GEN_97 = _T_527 ? replaceWay : _GEN_80; // @[Conditional.scala 40:58:@612.4]
  assign io_masterResp_data = 2'h3 == dataIdx ? masterRespData_3 : _GEN_2; // @[DCache.scala 155:22:@590.4]
  assign io_masterResp_ready = _T_527 ? 1'h0 : _GEN_71; // @[DCache.scala 146:23:@552.4 DCache.scala 180:29:@621.10]
  assign io_memReq_addr = _T_527 ? _T_514 : _GEN_83; // @[DCache.scala 158:18:@593.4 DCache.scala 212:24:@666.12]
  assign io_memReq_data = {_T_516,_T_515}; // @[DCache.scala 159:18:@597.4]
  assign io_memReq_write = _T_527 ? 1'h0 : _GEN_82; // @[DCache.scala 160:19:@598.4 DCache.scala 211:25:@662.12]
  assign io_memReq_valid = _T_527 ? 1'h0 : _GEN_81; // @[DCache.scala 161:19:@599.4 DCache.scala 209:23:@660.10 DCache.scala 231:25:@694.16]
  assign tagMemInst_clock = clock; // @[:@480.4]
  assign tagMemInst_io_req_write = _T_527 ? 1'h0 : _GEN_72; // @[DCache.scala 126:21:@485.4]
  assign tagMemInst_io_req_valid = io_masterReq_valid; // @[DCache.scala 126:21:@484.4]
  assign tagMemInst_io_req_index = io_masterReq_addr[11:4]; // @[DCache.scala 126:21:@483.4]
  assign tagMemInst_io_req_wayIdx = _T_527 ? 4'hf : _GEN_73; // @[DCache.scala 126:21:@482.4]
  assign tagMemInst_io_wdata_valid = _T_527 ? 1'h0 : _GEN_72; // @[DCache.scala 127:23:@488.4]
  assign tagMemInst_io_wdata_dirty = _T_527 ? 1'h0 : _GEN_72; // @[DCache.scala 127:23:@487.4]
  assign tagMemInst_io_wdata_tag = _T_527 ? 20'h0 : _GEN_76; // @[DCache.scala 127:23:@486.4]
  assign dataMemInst_clock = clock; // @[:@502.4]
  assign dataMemInst_io_req_write = _T_527 ? 1'h0 : _GEN_77; // @[DCache.scala 132:22:@507.4]
  assign dataMemInst_io_req_valid = io_masterReq_valid; // @[DCache.scala 132:22:@506.4]
  assign dataMemInst_io_req_index = io_masterReq_addr[11:4]; // @[DCache.scala 132:22:@505.4]
  assign dataMemInst_io_req_wayIdx = _T_527 ? 4'hf : _GEN_78; // @[DCache.scala 132:22:@504.4]
  assign dataMemInst_io_wdata_0 = _T_527 ? _GEN_4 : _GEN_84; // @[DCache.scala 133:24:@508.4]
  assign dataMemInst_io_wdata_1 = _T_527 ? _GEN_5 : _GEN_85; // @[DCache.scala 133:24:@509.4]
  assign dataMemInst_io_wdata_2 = _T_527 ? _GEN_6 : _GEN_86; // @[DCache.scala 133:24:@510.4]
  assign dataMemInst_io_wdata_3 = _T_527 ? _GEN_7 : _GEN_87; // @[DCache.scala 133:24:@511.4]
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  replaceWay = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_527) begin
        if (io_masterReq_valid) begin
          state <= 3'h1;
        end else begin
          state <= 3'h0;
        end
      end else begin
        if (_T_529) begin
          if (_T_531) begin
            state <= 3'h0;
          end else begin
            state <= 3'h2;
          end
        end else begin
          if (_T_555) begin
            if (needWriteBack) begin
              state <= 3'h3;
            end else begin
              state <= 3'h4;
            end
          end else begin
            if (_T_566) begin
              if (io_memResp_ready) begin
                state <= 3'h1;
              end else begin
                state <= 3'h0;
              end
            end else begin
              if (_T_572) begin
                if (io_memResp_ready) begin
                  state <= 3'h4;
                end else begin
                  state <= 3'h0;
                end
              end else begin
                state <= 3'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      replaceWay <= 2'h0;
    end else begin
      if (!(_T_527)) begin
        if (_T_529) begin
          if (!(_T_531)) begin
            replaceWay <= 2'h3;
          end
        end
      end
    end
  end
endmodule
