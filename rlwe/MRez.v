module MRez( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [13:0] io_a, // @[:@6.4]
  input  [13:0] io_b, // @[:@6.4]
  input         io_op, // @[:@6.4]
  output [13:0] io_res // @[:@6.4]
);
  wire [13:0] _T_13; // @[MR.scala 59:22:@8.4]
  wire [13:0] b; // @[MR.scala 59:14:@9.4]
  wire [14:0] _T_14; // @[MR.scala 60:21:@10.4]
  wire [13:0] _T_15; // @[MR.scala 60:21:@11.4]
  wire [13:0] _GEN_1; // @[MR.scala 60:25:@12.4]
  wire [14:0] _T_16; // @[MR.scala 60:25:@12.4]
  wire [13:0] addRes; // @[MR.scala 60:25:@13.4]
  wire  _T_17; // @[MR.scala 62:24:@15.6]
  wire [14:0] _T_19; // @[MR.scala 62:39:@16.6]
  wire [13:0] _T_20; // @[MR.scala 62:39:@17.6]
  wire [13:0] _T_21; // @[MR.scala 62:18:@18.6]
  wire  _T_23; // @[MR.scala 64:26:@22.6]
  wire [14:0] _T_25; // @[MR.scala 64:52:@23.6]
  wire [14:0] _T_26; // @[MR.scala 64:52:@24.6]
  wire [13:0] _T_27; // @[MR.scala 64:52:@25.6]
  wire [13:0] _T_28; // @[MR.scala 64:18:@26.6]
  assign _T_13 = ~ io_b; // @[MR.scala 59:22:@8.4]
  assign b = io_op ? _T_13 : io_b; // @[MR.scala 59:14:@9.4]
  assign _T_14 = io_a + b; // @[MR.scala 60:21:@10.4]
  assign _T_15 = _T_14[13:0]; // @[MR.scala 60:21:@11.4]
  assign _GEN_1 = {{13'd0}, io_op}; // @[MR.scala 60:25:@12.4]
  assign _T_16 = _T_15 + _GEN_1; // @[MR.scala 60:25:@12.4]
  assign addRes = _T_16[13:0]; // @[MR.scala 60:25:@13.4]
  assign _T_17 = io_a < io_b; // @[MR.scala 62:24:@15.6]
  assign _T_19 = addRes + 14'h3001; // @[MR.scala 62:39:@16.6]
  assign _T_20 = _T_19[13:0]; // @[MR.scala 62:39:@17.6]
  assign _T_21 = _T_17 ? _T_20 : addRes; // @[MR.scala 62:18:@18.6]
  assign _T_23 = addRes < 14'h3001; // @[MR.scala 64:26:@22.6]
  assign _T_25 = addRes - 14'h3001; // @[MR.scala 64:52:@23.6]
  assign _T_26 = $unsigned(_T_25); // @[MR.scala 64:52:@24.6]
  assign _T_27 = _T_26[13:0]; // @[MR.scala 64:52:@25.6]
  assign _T_28 = _T_23 ? addRes : _T_27; // @[MR.scala 64:18:@26.6]
  assign io_res = io_op ? _T_21 : _T_28; // @[MR.scala 62:12:@19.6 MR.scala 64:12:@27.6]
endmodule
