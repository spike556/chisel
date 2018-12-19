module MR( // @[:@3.2]
  input  [27:0] io_a, // @[:@6.4]
  output [13:0] io_ar // @[:@6.4]
);
  wire [27:0] shift1; // @[MR.scala 26:21:@8.4]
  wire [28:0] _GEN_0; // @[MR.scala 27:31:@9.4]
  wire [28:0] _T_11; // @[MR.scala 27:31:@9.4]
  wire [29:0] _T_12; // @[MR.scala 27:21:@10.4]
  wire [28:0] _T_13; // @[MR.scala 27:21:@11.4]
  wire [30:0] _GEN_2; // @[MR.scala 27:49:@12.4]
  wire [30:0] _T_15; // @[MR.scala 27:49:@12.4]
  wire [30:0] _GEN_3; // @[MR.scala 27:39:@13.4]
  wire [31:0] _T_16; // @[MR.scala 27:39:@13.4]
  wire [30:0] _T_17; // @[MR.scala 27:39:@14.4]
  wire [34:0] _GEN_4; // @[MR.scala 27:67:@15.4]
  wire [34:0] _T_19; // @[MR.scala 27:67:@15.4]
  wire [34:0] _GEN_5; // @[MR.scala 27:57:@16.4]
  wire [35:0] _T_20; // @[MR.scala 27:57:@16.4]
  wire [34:0] _T_21; // @[MR.scala 27:57:@17.4]
  wire [34:0] _T_23; // @[MR.scala 27:85:@18.4]
  wire [35:0] _T_24; // @[MR.scala 27:75:@19.4]
  wire [34:0] _T_25; // @[MR.scala 27:75:@20.4]
  wire [42:0] _GEN_7; // @[MR.scala 28:13:@21.4]
  wire [42:0] _T_27; // @[MR.scala 28:13:@21.4]
  wire [42:0] _GEN_8; // @[MR.scala 27:93:@22.4]
  wire [43:0] _T_28; // @[MR.scala 27:93:@22.4]
  wire [42:0] _T_29; // @[MR.scala 27:93:@23.4]
  wire [42:0] _T_31; // @[MR.scala 28:31:@24.4]
  wire [43:0] _T_32; // @[MR.scala 28:21:@25.4]
  wire [42:0] _T_33; // @[MR.scala 28:21:@26.4]
  wire [42:0] _T_35; // @[MR.scala 28:50:@27.4]
  wire [43:0] _T_36; // @[MR.scala 28:40:@28.4]
  wire [42:0] _T_37; // @[MR.scala 28:40:@29.4]
  wire [42:0] _T_39; // @[MR.scala 28:69:@30.4]
  wire [43:0] _T_40; // @[MR.scala 28:59:@31.4]
  wire [42:0] mul1; // @[MR.scala 28:59:@32.4]
  wire [42:0] qGuess; // @[MR.scala 29:21:@33.4]
  wire [57:0] _GEN_12; // @[MR.scala 30:29:@34.4]
  wire [57:0] _T_43; // @[MR.scala 30:29:@34.4]
  wire [58:0] _T_44; // @[MR.scala 30:19:@35.4]
  wire [57:0] _T_45; // @[MR.scala 30:19:@36.4]
  wire [57:0] _T_47; // @[MR.scala 30:48:@37.4]
  wire [58:0] _T_48; // @[MR.scala 30:38:@38.4]
  wire [57:0] qM; // @[MR.scala 30:38:@39.4]
  wire [57:0] _GEN_15; // @[MR.scala 31:16:@40.4]
  wire [58:0] _T_49; // @[MR.scala 31:16:@40.4]
  wire [58:0] _T_50; // @[MR.scala 31:16:@41.4]
  wire [57:0] z; // @[MR.scala 31:16:@42.4]
  wire  _T_52; // @[MR.scala 32:18:@43.4]
  wire [58:0] _T_54; // @[MR.scala 32:45:@44.4]
  wire [58:0] _T_55; // @[MR.scala 32:45:@45.4]
  wire [57:0] _T_56; // @[MR.scala 32:45:@46.4]
  wire [57:0] _T_57; // @[MR.scala 32:15:@47.4]
  assign shift1 = io_a >> 4'hc; // @[MR.scala 26:21:@8.4]
  assign _GEN_0 = {{1'd0}, shift1}; // @[MR.scala 27:31:@9.4]
  assign _T_11 = _GEN_0 << 1'h1; // @[MR.scala 27:31:@9.4]
  assign _T_12 = _GEN_0 + _T_11; // @[MR.scala 27:21:@10.4]
  assign _T_13 = _T_12[28:0]; // @[MR.scala 27:21:@11.4]
  assign _GEN_2 = {{3'd0}, shift1}; // @[MR.scala 27:49:@12.4]
  assign _T_15 = _GEN_2 << 2'h2; // @[MR.scala 27:49:@12.4]
  assign _GEN_3 = {{2'd0}, _T_13}; // @[MR.scala 27:39:@13.4]
  assign _T_16 = _GEN_3 + _T_15; // @[MR.scala 27:39:@13.4]
  assign _T_17 = _T_16[30:0]; // @[MR.scala 27:39:@14.4]
  assign _GEN_4 = {{7'd0}, shift1}; // @[MR.scala 27:67:@15.4]
  assign _T_19 = _GEN_4 << 3'h5; // @[MR.scala 27:67:@15.4]
  assign _GEN_5 = {{4'd0}, _T_17}; // @[MR.scala 27:57:@16.4]
  assign _T_20 = _GEN_5 + _T_19; // @[MR.scala 27:57:@16.4]
  assign _T_21 = _T_20[34:0]; // @[MR.scala 27:57:@17.4]
  assign _T_23 = _GEN_4 << 3'h7; // @[MR.scala 27:85:@18.4]
  assign _T_24 = _T_21 + _T_23; // @[MR.scala 27:75:@19.4]
  assign _T_25 = _T_24[34:0]; // @[MR.scala 27:75:@20.4]
  assign _GEN_7 = {{15'd0}, shift1}; // @[MR.scala 28:13:@21.4]
  assign _T_27 = _GEN_7 << 4'h9; // @[MR.scala 28:13:@21.4]
  assign _GEN_8 = {{8'd0}, _T_25}; // @[MR.scala 27:93:@22.4]
  assign _T_28 = _GEN_8 + _T_27; // @[MR.scala 27:93:@22.4]
  assign _T_29 = _T_28[42:0]; // @[MR.scala 27:93:@23.4]
  assign _T_31 = _GEN_7 << 4'hb; // @[MR.scala 28:31:@24.4]
  assign _T_32 = _T_29 + _T_31; // @[MR.scala 28:21:@25.4]
  assign _T_33 = _T_32[42:0]; // @[MR.scala 28:21:@26.4]
  assign _T_35 = _GEN_7 << 4'hd; // @[MR.scala 28:50:@27.4]
  assign _T_36 = _T_33 + _T_35; // @[MR.scala 28:40:@28.4]
  assign _T_37 = _T_36[42:0]; // @[MR.scala 28:40:@29.4]
  assign _T_39 = _GEN_7 << 4'hf; // @[MR.scala 28:69:@30.4]
  assign _T_40 = _T_37 + _T_39; // @[MR.scala 28:59:@31.4]
  assign mul1 = _T_40[42:0]; // @[MR.scala 28:59:@32.4]
  assign qGuess = mul1 >> 5'h11; // @[MR.scala 29:21:@33.4]
  assign _GEN_12 = {{15'd0}, qGuess}; // @[MR.scala 30:29:@34.4]
  assign _T_43 = _GEN_12 << 4'hc; // @[MR.scala 30:29:@34.4]
  assign _T_44 = _GEN_12 + _T_43; // @[MR.scala 30:19:@35.4]
  assign _T_45 = _T_44[57:0]; // @[MR.scala 30:19:@36.4]
  assign _T_47 = _GEN_12 << 4'hd; // @[MR.scala 30:48:@37.4]
  assign _T_48 = _T_45 + _T_47; // @[MR.scala 30:38:@38.4]
  assign qM = _T_48[57:0]; // @[MR.scala 30:38:@39.4]
  assign _GEN_15 = {{30'd0}, io_a}; // @[MR.scala 31:16:@40.4]
  assign _T_49 = _GEN_15 - qM; // @[MR.scala 31:16:@40.4]
  assign _T_50 = $unsigned(_T_49); // @[MR.scala 31:16:@41.4]
  assign z = _T_50[57:0]; // @[MR.scala 31:16:@42.4]
  assign _T_52 = z < 58'h3001; // @[MR.scala 32:18:@43.4]
  assign _T_54 = z - 58'h3001; // @[MR.scala 32:45:@44.4]
  assign _T_55 = $unsigned(_T_54); // @[MR.scala 32:45:@45.4]
  assign _T_56 = _T_55[57:0]; // @[MR.scala 32:45:@46.4]
  assign _T_57 = _T_52 ? z : _T_56; // @[MR.scala 32:15:@47.4]
  assign io_ar = _T_57[13:0]; // @[MR.scala 32:9:@48.4]
endmodule
module MRez( // @[:@50.2]
  input  [13:0] io_a, // @[:@53.4]
  input  [13:0] io_b, // @[:@53.4]
  input         io_op, // @[:@53.4]
  output [13:0] io_res // @[:@53.4]
);
  wire [13:0] _T_13; // @[MR.scala 59:22:@55.4]
  wire [13:0] b; // @[MR.scala 59:14:@56.4]
  wire [14:0] _T_14; // @[MR.scala 60:21:@57.4]
  wire [13:0] _T_15; // @[MR.scala 60:21:@58.4]
  wire [13:0] _GEN_1; // @[MR.scala 60:25:@59.4]
  wire [14:0] _T_16; // @[MR.scala 60:25:@59.4]
  wire [13:0] addRes; // @[MR.scala 60:25:@60.4]
  wire  _T_17; // @[MR.scala 62:24:@62.6]
  wire [14:0] _T_19; // @[MR.scala 62:39:@63.6]
  wire [13:0] _T_20; // @[MR.scala 62:39:@64.6]
  wire [13:0] _T_21; // @[MR.scala 62:18:@65.6]
  wire  _T_23; // @[MR.scala 64:26:@69.6]
  wire [14:0] _T_25; // @[MR.scala 64:52:@70.6]
  wire [14:0] _T_26; // @[MR.scala 64:52:@71.6]
  wire [13:0] _T_27; // @[MR.scala 64:52:@72.6]
  wire [13:0] _T_28; // @[MR.scala 64:18:@73.6]
  assign _T_13 = ~ io_b; // @[MR.scala 59:22:@55.4]
  assign b = io_op ? _T_13 : io_b; // @[MR.scala 59:14:@56.4]
  assign _T_14 = io_a + b; // @[MR.scala 60:21:@57.4]
  assign _T_15 = _T_14[13:0]; // @[MR.scala 60:21:@58.4]
  assign _GEN_1 = {{13'd0}, io_op}; // @[MR.scala 60:25:@59.4]
  assign _T_16 = _T_15 + _GEN_1; // @[MR.scala 60:25:@59.4]
  assign addRes = _T_16[13:0]; // @[MR.scala 60:25:@60.4]
  assign _T_17 = io_a < io_b; // @[MR.scala 62:24:@62.6]
  assign _T_19 = addRes + 14'h3001; // @[MR.scala 62:39:@63.6]
  assign _T_20 = _T_19[13:0]; // @[MR.scala 62:39:@64.6]
  assign _T_21 = _T_17 ? _T_20 : addRes; // @[MR.scala 62:18:@65.6]
  assign _T_23 = addRes < 14'h3001; // @[MR.scala 64:26:@69.6]
  assign _T_25 = addRes - 14'h3001; // @[MR.scala 64:52:@70.6]
  assign _T_26 = $unsigned(_T_25); // @[MR.scala 64:52:@71.6]
  assign _T_27 = _T_26[13:0]; // @[MR.scala 64:52:@72.6]
  assign _T_28 = _T_23 ? addRes : _T_27; // @[MR.scala 64:18:@73.6]
  assign io_res = io_op ? _T_21 : _T_28; // @[MR.scala 62:12:@66.6 MR.scala 64:12:@74.6]
endmodule
module BF2( // @[:@104.2]
  input         clock, // @[:@105.4]
  input         reset, // @[:@106.4]
  input  [13:0] io_a, // @[:@107.4]
  input  [13:0] io_b, // @[:@107.4]
  input  [13:0] io_w, // @[:@107.4]
  output [13:0] io_A, // @[:@107.4]
  output [13:0] io_B // @[:@107.4]
);
  wire [27:0] MR_io_a; // @[MR.scala 38:22:@114.4]
  wire [13:0] MR_io_ar; // @[MR.scala 38:22:@114.4]
  wire [13:0] MRez_io_a; // @[MR.scala 70:22:@122.4]
  wire [13:0] MRez_io_b; // @[MR.scala 70:22:@122.4]
  wire  MRez_io_op; // @[MR.scala 70:22:@122.4]
  wire [13:0] MRez_io_res; // @[MR.scala 70:22:@122.4]
  wire [13:0] MRez_1_io_a; // @[MR.scala 70:22:@131.4]
  wire [13:0] MRez_1_io_b; // @[MR.scala 70:22:@131.4]
  wire  MRez_1_io_op; // @[MR.scala 70:22:@131.4]
  wire [13:0] MRez_1_io_res; // @[MR.scala 70:22:@131.4]
  reg [27:0] bmulw; // @[BF2.scala 18:22:@110.4]
  reg [31:0] _RAND_0;
  reg [13:0] aq1; // @[BF2.scala 19:20:@112.4]
  reg [31:0] _RAND_1;
  reg [13:0] bmulwMR; // @[BF2.scala 22:24:@118.4]
  reg [31:0] _RAND_2;
  reg [13:0] aq2; // @[BF2.scala 23:20:@120.4]
  reg [31:0] _RAND_3;
  reg [13:0] _T_22; // @[BF2.scala 26:18:@128.4]
  reg [31:0] _RAND_4;
  reg [13:0] _T_25; // @[BF2.scala 27:18:@137.4]
  reg [31:0] _RAND_5;
  MR MR ( // @[MR.scala 38:22:@114.4]
    .io_a(MR_io_a),
    .io_ar(MR_io_ar)
  );
  MRez MRez ( // @[MR.scala 70:22:@122.4]
    .io_a(MRez_io_a),
    .io_b(MRez_io_b),
    .io_op(MRez_io_op),
    .io_res(MRez_io_res)
  );
  MRez MRez_1 ( // @[MR.scala 70:22:@131.4]
    .io_a(MRez_1_io_a),
    .io_b(MRez_1_io_b),
    .io_op(MRez_1_io_op),
    .io_res(MRez_1_io_res)
  );
  assign io_A = _T_22; // @[BF2.scala 26:8:@130.4]
  assign io_B = _T_25; // @[BF2.scala 27:8:@139.4]
  assign MR_io_a = bmulw; // @[MR.scala 39:15:@117.4]
  assign MRez_io_a = aq2; // @[MR.scala 71:15:@125.4]
  assign MRez_io_b = bmulwMR; // @[MR.scala 72:15:@126.4]
  assign MRez_io_op = 1'h0; // @[MR.scala 73:16:@127.4]
  assign MRez_1_io_a = aq2; // @[MR.scala 71:15:@134.4]
  assign MRez_1_io_b = bmulwMR; // @[MR.scala 72:15:@135.4]
  assign MRez_1_io_op = 1'h1; // @[MR.scala 73:16:@136.4]
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
  bmulw = _RAND_0[27:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  aq1 = _RAND_1[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  bmulwMR = _RAND_2[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  aq2 = _RAND_3[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_22 = _RAND_4[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_25 = _RAND_5[13:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    bmulw <= io_b * io_w;
    aq1 <= io_a;
    bmulwMR <= MR_io_ar;
    aq2 <= aq1;
    _T_22 <= MRez_io_res;
    _T_25 <= MRez_1_io_res;
  end
endmodule
