module OneBit( // @[:@3.2]
  input  [162:0] io_a, // @[:@6.4]
  input  [162:0] io_p, // @[:@6.4]
  input          io_bi, // @[:@6.4]
  output [162:0] io_aout, // @[:@6.4]
  output [162:0] io_pout // @[:@6.4]
);
  wire [161:0] _T_15; // @[OneBit.scala 18:24:@8.4]
  wire [162:0] aShift; // @[Cat.scala 30:58:@9.4]
  wire  _T_17; // @[OneBit.scala 19:22:@10.4]
  wire [162:0] _T_27; // @[OneBit.scala 19:44:@14.4]
  wire [162:0] _T_31; // @[OneBit.scala 20:38:@18.4]
  assign _T_15 = io_a[161:0]; // @[OneBit.scala 18:24:@8.4]
  assign aShift = {_T_15,1'h0}; // @[Cat.scala 30:58:@9.4]
  assign _T_17 = io_a[162]; // @[OneBit.scala 19:22:@10.4]
  assign _T_27 = aShift ^ 163'hc9; // @[OneBit.scala 19:44:@14.4]
  assign _T_31 = io_a ^ io_p; // @[OneBit.scala 20:38:@18.4]
  assign io_aout = _T_17 ? _T_27 : aShift; // @[OneBit.scala 19:11:@16.4]
  assign io_pout = io_bi ? _T_31 : io_p; // @[OneBit.scala 20:11:@20.4]
endmodule
module PE( // @[:@307.2]
  input          clock, // @[:@308.4]
  input          reset, // @[:@309.4]
  input  [162:0] io_a, // @[:@310.4]
  input  [162:0] io_p, // @[:@310.4]
  input  [15:0]  io_bi, // @[:@310.4]
  output [162:0] io_aout, // @[:@310.4]
  output [162:0] io_pout // @[:@310.4]
);
  wire [162:0] OneBit_io_a; // @[PE.scala 15:47:@312.4]
  wire [162:0] OneBit_io_p; // @[PE.scala 15:47:@312.4]
  wire  OneBit_io_bi; // @[PE.scala 15:47:@312.4]
  wire [162:0] OneBit_io_aout; // @[PE.scala 15:47:@312.4]
  wire [162:0] OneBit_io_pout; // @[PE.scala 15:47:@312.4]
  wire [162:0] OneBit_1_io_a; // @[PE.scala 15:47:@315.4]
  wire [162:0] OneBit_1_io_p; // @[PE.scala 15:47:@315.4]
  wire  OneBit_1_io_bi; // @[PE.scala 15:47:@315.4]
  wire [162:0] OneBit_1_io_aout; // @[PE.scala 15:47:@315.4]
  wire [162:0] OneBit_1_io_pout; // @[PE.scala 15:47:@315.4]
  wire [162:0] OneBit_2_io_a; // @[PE.scala 15:47:@318.4]
  wire [162:0] OneBit_2_io_p; // @[PE.scala 15:47:@318.4]
  wire  OneBit_2_io_bi; // @[PE.scala 15:47:@318.4]
  wire [162:0] OneBit_2_io_aout; // @[PE.scala 15:47:@318.4]
  wire [162:0] OneBit_2_io_pout; // @[PE.scala 15:47:@318.4]
  wire [162:0] OneBit_3_io_a; // @[PE.scala 15:47:@321.4]
  wire [162:0] OneBit_3_io_p; // @[PE.scala 15:47:@321.4]
  wire  OneBit_3_io_bi; // @[PE.scala 15:47:@321.4]
  wire [162:0] OneBit_3_io_aout; // @[PE.scala 15:47:@321.4]
  wire [162:0] OneBit_3_io_pout; // @[PE.scala 15:47:@321.4]
  wire [162:0] OneBit_4_io_a; // @[PE.scala 15:47:@324.4]
  wire [162:0] OneBit_4_io_p; // @[PE.scala 15:47:@324.4]
  wire  OneBit_4_io_bi; // @[PE.scala 15:47:@324.4]
  wire [162:0] OneBit_4_io_aout; // @[PE.scala 15:47:@324.4]
  wire [162:0] OneBit_4_io_pout; // @[PE.scala 15:47:@324.4]
  wire [162:0] OneBit_5_io_a; // @[PE.scala 15:47:@327.4]
  wire [162:0] OneBit_5_io_p; // @[PE.scala 15:47:@327.4]
  wire  OneBit_5_io_bi; // @[PE.scala 15:47:@327.4]
  wire [162:0] OneBit_5_io_aout; // @[PE.scala 15:47:@327.4]
  wire [162:0] OneBit_5_io_pout; // @[PE.scala 15:47:@327.4]
  wire [162:0] OneBit_6_io_a; // @[PE.scala 15:47:@330.4]
  wire [162:0] OneBit_6_io_p; // @[PE.scala 15:47:@330.4]
  wire  OneBit_6_io_bi; // @[PE.scala 15:47:@330.4]
  wire [162:0] OneBit_6_io_aout; // @[PE.scala 15:47:@330.4]
  wire [162:0] OneBit_6_io_pout; // @[PE.scala 15:47:@330.4]
  wire [162:0] OneBit_7_io_a; // @[PE.scala 15:47:@333.4]
  wire [162:0] OneBit_7_io_p; // @[PE.scala 15:47:@333.4]
  wire  OneBit_7_io_bi; // @[PE.scala 15:47:@333.4]
  wire [162:0] OneBit_7_io_aout; // @[PE.scala 15:47:@333.4]
  wire [162:0] OneBit_7_io_pout; // @[PE.scala 15:47:@333.4]
  wire [162:0] OneBit_8_io_a; // @[PE.scala 15:47:@336.4]
  wire [162:0] OneBit_8_io_p; // @[PE.scala 15:47:@336.4]
  wire  OneBit_8_io_bi; // @[PE.scala 15:47:@336.4]
  wire [162:0] OneBit_8_io_aout; // @[PE.scala 15:47:@336.4]
  wire [162:0] OneBit_8_io_pout; // @[PE.scala 15:47:@336.4]
  wire [162:0] OneBit_9_io_a; // @[PE.scala 15:47:@339.4]
  wire [162:0] OneBit_9_io_p; // @[PE.scala 15:47:@339.4]
  wire  OneBit_9_io_bi; // @[PE.scala 15:47:@339.4]
  wire [162:0] OneBit_9_io_aout; // @[PE.scala 15:47:@339.4]
  wire [162:0] OneBit_9_io_pout; // @[PE.scala 15:47:@339.4]
  wire [162:0] OneBit_10_io_a; // @[PE.scala 15:47:@342.4]
  wire [162:0] OneBit_10_io_p; // @[PE.scala 15:47:@342.4]
  wire  OneBit_10_io_bi; // @[PE.scala 15:47:@342.4]
  wire [162:0] OneBit_10_io_aout; // @[PE.scala 15:47:@342.4]
  wire [162:0] OneBit_10_io_pout; // @[PE.scala 15:47:@342.4]
  wire [162:0] OneBit_11_io_a; // @[PE.scala 15:47:@345.4]
  wire [162:0] OneBit_11_io_p; // @[PE.scala 15:47:@345.4]
  wire  OneBit_11_io_bi; // @[PE.scala 15:47:@345.4]
  wire [162:0] OneBit_11_io_aout; // @[PE.scala 15:47:@345.4]
  wire [162:0] OneBit_11_io_pout; // @[PE.scala 15:47:@345.4]
  wire [162:0] OneBit_12_io_a; // @[PE.scala 15:47:@348.4]
  wire [162:0] OneBit_12_io_p; // @[PE.scala 15:47:@348.4]
  wire  OneBit_12_io_bi; // @[PE.scala 15:47:@348.4]
  wire [162:0] OneBit_12_io_aout; // @[PE.scala 15:47:@348.4]
  wire [162:0] OneBit_12_io_pout; // @[PE.scala 15:47:@348.4]
  wire [162:0] OneBit_13_io_a; // @[PE.scala 15:47:@351.4]
  wire [162:0] OneBit_13_io_p; // @[PE.scala 15:47:@351.4]
  wire  OneBit_13_io_bi; // @[PE.scala 15:47:@351.4]
  wire [162:0] OneBit_13_io_aout; // @[PE.scala 15:47:@351.4]
  wire [162:0] OneBit_13_io_pout; // @[PE.scala 15:47:@351.4]
  wire [162:0] OneBit_14_io_a; // @[PE.scala 15:47:@354.4]
  wire [162:0] OneBit_14_io_p; // @[PE.scala 15:47:@354.4]
  wire  OneBit_14_io_bi; // @[PE.scala 15:47:@354.4]
  wire [162:0] OneBit_14_io_aout; // @[PE.scala 15:47:@354.4]
  wire [162:0] OneBit_14_io_pout; // @[PE.scala 15:47:@354.4]
  wire [162:0] OneBit_15_io_a; // @[PE.scala 15:47:@357.4]
  wire [162:0] OneBit_15_io_p; // @[PE.scala 15:47:@357.4]
  wire  OneBit_15_io_bi; // @[PE.scala 15:47:@357.4]
  wire [162:0] OneBit_15_io_aout; // @[PE.scala 15:47:@357.4]
  wire [162:0] OneBit_15_io_pout; // @[PE.scala 15:47:@357.4]
  reg [162:0] _T_313; // @[PE.scala 30:23:@505.4]
  reg [191:0] _RAND_0;
  reg [162:0] _T_315; // @[PE.scala 31:23:@508.4]
  reg [191:0] _RAND_1;
  OneBit OneBit ( // @[PE.scala 15:47:@312.4]
    .io_a(OneBit_io_a),
    .io_p(OneBit_io_p),
    .io_bi(OneBit_io_bi),
    .io_aout(OneBit_io_aout),
    .io_pout(OneBit_io_pout)
  );
  OneBit OneBit_1 ( // @[PE.scala 15:47:@315.4]
    .io_a(OneBit_1_io_a),
    .io_p(OneBit_1_io_p),
    .io_bi(OneBit_1_io_bi),
    .io_aout(OneBit_1_io_aout),
    .io_pout(OneBit_1_io_pout)
  );
  OneBit OneBit_2 ( // @[PE.scala 15:47:@318.4]
    .io_a(OneBit_2_io_a),
    .io_p(OneBit_2_io_p),
    .io_bi(OneBit_2_io_bi),
    .io_aout(OneBit_2_io_aout),
    .io_pout(OneBit_2_io_pout)
  );
  OneBit OneBit_3 ( // @[PE.scala 15:47:@321.4]
    .io_a(OneBit_3_io_a),
    .io_p(OneBit_3_io_p),
    .io_bi(OneBit_3_io_bi),
    .io_aout(OneBit_3_io_aout),
    .io_pout(OneBit_3_io_pout)
  );
  OneBit OneBit_4 ( // @[PE.scala 15:47:@324.4]
    .io_a(OneBit_4_io_a),
    .io_p(OneBit_4_io_p),
    .io_bi(OneBit_4_io_bi),
    .io_aout(OneBit_4_io_aout),
    .io_pout(OneBit_4_io_pout)
  );
  OneBit OneBit_5 ( // @[PE.scala 15:47:@327.4]
    .io_a(OneBit_5_io_a),
    .io_p(OneBit_5_io_p),
    .io_bi(OneBit_5_io_bi),
    .io_aout(OneBit_5_io_aout),
    .io_pout(OneBit_5_io_pout)
  );
  OneBit OneBit_6 ( // @[PE.scala 15:47:@330.4]
    .io_a(OneBit_6_io_a),
    .io_p(OneBit_6_io_p),
    .io_bi(OneBit_6_io_bi),
    .io_aout(OneBit_6_io_aout),
    .io_pout(OneBit_6_io_pout)
  );
  OneBit OneBit_7 ( // @[PE.scala 15:47:@333.4]
    .io_a(OneBit_7_io_a),
    .io_p(OneBit_7_io_p),
    .io_bi(OneBit_7_io_bi),
    .io_aout(OneBit_7_io_aout),
    .io_pout(OneBit_7_io_pout)
  );
  OneBit OneBit_8 ( // @[PE.scala 15:47:@336.4]
    .io_a(OneBit_8_io_a),
    .io_p(OneBit_8_io_p),
    .io_bi(OneBit_8_io_bi),
    .io_aout(OneBit_8_io_aout),
    .io_pout(OneBit_8_io_pout)
  );
  OneBit OneBit_9 ( // @[PE.scala 15:47:@339.4]
    .io_a(OneBit_9_io_a),
    .io_p(OneBit_9_io_p),
    .io_bi(OneBit_9_io_bi),
    .io_aout(OneBit_9_io_aout),
    .io_pout(OneBit_9_io_pout)
  );
  OneBit OneBit_10 ( // @[PE.scala 15:47:@342.4]
    .io_a(OneBit_10_io_a),
    .io_p(OneBit_10_io_p),
    .io_bi(OneBit_10_io_bi),
    .io_aout(OneBit_10_io_aout),
    .io_pout(OneBit_10_io_pout)
  );
  OneBit OneBit_11 ( // @[PE.scala 15:47:@345.4]
    .io_a(OneBit_11_io_a),
    .io_p(OneBit_11_io_p),
    .io_bi(OneBit_11_io_bi),
    .io_aout(OneBit_11_io_aout),
    .io_pout(OneBit_11_io_pout)
  );
  OneBit OneBit_12 ( // @[PE.scala 15:47:@348.4]
    .io_a(OneBit_12_io_a),
    .io_p(OneBit_12_io_p),
    .io_bi(OneBit_12_io_bi),
    .io_aout(OneBit_12_io_aout),
    .io_pout(OneBit_12_io_pout)
  );
  OneBit OneBit_13 ( // @[PE.scala 15:47:@351.4]
    .io_a(OneBit_13_io_a),
    .io_p(OneBit_13_io_p),
    .io_bi(OneBit_13_io_bi),
    .io_aout(OneBit_13_io_aout),
    .io_pout(OneBit_13_io_pout)
  );
  OneBit OneBit_14 ( // @[PE.scala 15:47:@354.4]
    .io_a(OneBit_14_io_a),
    .io_p(OneBit_14_io_p),
    .io_bi(OneBit_14_io_bi),
    .io_aout(OneBit_14_io_aout),
    .io_pout(OneBit_14_io_pout)
  );
  OneBit OneBit_15 ( // @[PE.scala 15:47:@357.4]
    .io_a(OneBit_15_io_a),
    .io_p(OneBit_15_io_p),
    .io_bi(OneBit_15_io_bi),
    .io_aout(OneBit_15_io_aout),
    .io_pout(OneBit_15_io_pout)
  );
  assign io_aout = _T_313; // @[PE.scala 30:13:@507.4]
  assign io_pout = _T_315; // @[PE.scala 31:13:@510.4]
  assign OneBit_io_a = io_a; // @[PE.scala 15:21:@365.4]
  assign OneBit_io_p = io_p; // @[PE.scala 15:21:@364.4]
  assign OneBit_io_bi = io_bi[0]; // @[PE.scala 15:21:@363.4]
  assign OneBit_1_io_a = OneBit_io_aout; // @[PE.scala 15:21:@370.4]
  assign OneBit_1_io_p = OneBit_io_pout; // @[PE.scala 15:21:@369.4]
  assign OneBit_1_io_bi = io_bi[1]; // @[PE.scala 15:21:@368.4]
  assign OneBit_2_io_a = OneBit_1_io_aout; // @[PE.scala 15:21:@375.4]
  assign OneBit_2_io_p = OneBit_1_io_pout; // @[PE.scala 15:21:@374.4]
  assign OneBit_2_io_bi = io_bi[2]; // @[PE.scala 15:21:@373.4]
  assign OneBit_3_io_a = OneBit_2_io_aout; // @[PE.scala 15:21:@380.4]
  assign OneBit_3_io_p = OneBit_2_io_pout; // @[PE.scala 15:21:@379.4]
  assign OneBit_3_io_bi = io_bi[3]; // @[PE.scala 15:21:@378.4]
  assign OneBit_4_io_a = OneBit_3_io_aout; // @[PE.scala 15:21:@385.4]
  assign OneBit_4_io_p = OneBit_3_io_pout; // @[PE.scala 15:21:@384.4]
  assign OneBit_4_io_bi = io_bi[4]; // @[PE.scala 15:21:@383.4]
  assign OneBit_5_io_a = OneBit_4_io_aout; // @[PE.scala 15:21:@390.4]
  assign OneBit_5_io_p = OneBit_4_io_pout; // @[PE.scala 15:21:@389.4]
  assign OneBit_5_io_bi = io_bi[5]; // @[PE.scala 15:21:@388.4]
  assign OneBit_6_io_a = OneBit_5_io_aout; // @[PE.scala 15:21:@395.4]
  assign OneBit_6_io_p = OneBit_5_io_pout; // @[PE.scala 15:21:@394.4]
  assign OneBit_6_io_bi = io_bi[6]; // @[PE.scala 15:21:@393.4]
  assign OneBit_7_io_a = OneBit_6_io_aout; // @[PE.scala 15:21:@400.4]
  assign OneBit_7_io_p = OneBit_6_io_pout; // @[PE.scala 15:21:@399.4]
  assign OneBit_7_io_bi = io_bi[7]; // @[PE.scala 15:21:@398.4]
  assign OneBit_8_io_a = OneBit_7_io_aout; // @[PE.scala 15:21:@405.4]
  assign OneBit_8_io_p = OneBit_7_io_pout; // @[PE.scala 15:21:@404.4]
  assign OneBit_8_io_bi = io_bi[8]; // @[PE.scala 15:21:@403.4]
  assign OneBit_9_io_a = OneBit_8_io_aout; // @[PE.scala 15:21:@410.4]
  assign OneBit_9_io_p = OneBit_8_io_pout; // @[PE.scala 15:21:@409.4]
  assign OneBit_9_io_bi = io_bi[9]; // @[PE.scala 15:21:@408.4]
  assign OneBit_10_io_a = OneBit_9_io_aout; // @[PE.scala 15:21:@415.4]
  assign OneBit_10_io_p = OneBit_9_io_pout; // @[PE.scala 15:21:@414.4]
  assign OneBit_10_io_bi = io_bi[10]; // @[PE.scala 15:21:@413.4]
  assign OneBit_11_io_a = OneBit_10_io_aout; // @[PE.scala 15:21:@420.4]
  assign OneBit_11_io_p = OneBit_10_io_pout; // @[PE.scala 15:21:@419.4]
  assign OneBit_11_io_bi = io_bi[11]; // @[PE.scala 15:21:@418.4]
  assign OneBit_12_io_a = OneBit_11_io_aout; // @[PE.scala 15:21:@425.4]
  assign OneBit_12_io_p = OneBit_11_io_pout; // @[PE.scala 15:21:@424.4]
  assign OneBit_12_io_bi = io_bi[12]; // @[PE.scala 15:21:@423.4]
  assign OneBit_13_io_a = OneBit_12_io_aout; // @[PE.scala 15:21:@430.4]
  assign OneBit_13_io_p = OneBit_12_io_pout; // @[PE.scala 15:21:@429.4]
  assign OneBit_13_io_bi = io_bi[13]; // @[PE.scala 15:21:@428.4]
  assign OneBit_14_io_a = OneBit_13_io_aout; // @[PE.scala 15:21:@435.4]
  assign OneBit_14_io_p = OneBit_13_io_pout; // @[PE.scala 15:21:@434.4]
  assign OneBit_14_io_bi = io_bi[14]; // @[PE.scala 15:21:@433.4]
  assign OneBit_15_io_a = OneBit_14_io_aout; // @[PE.scala 15:21:@440.4]
  assign OneBit_15_io_p = OneBit_14_io_pout; // @[PE.scala 15:21:@439.4]
  assign OneBit_15_io_bi = io_bi[15]; // @[PE.scala 15:21:@438.4]
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
  _RAND_0 = {6{`RANDOM}};
  _T_313 = _RAND_0[162:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {6{`RANDOM}};
  _T_315 = _RAND_1[162:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    _T_313 <= OneBit_15_io_aout;
    _T_315 <= OneBit_15_io_pout;
  end
endmodule
