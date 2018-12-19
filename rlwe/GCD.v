module GCD( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_OPA, // @[:@6.4]
  input  [31:0] io_OPB, // @[:@6.4]
  input         io_START, // @[:@6.4]
  output [31:0] io_RESULT, // @[:@6.4]
  output        io_DONE // @[:@6.4]
);
  reg [31:0] OPAReg; // @[GCD.scala 18:20:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] OPBReg; // @[GCD.scala 19:20:@9.4]
  reg [31:0] _RAND_1;
  reg [4:0] cnt; // @[GCD.scala 20:20:@10.4]
  reg [31:0] _RAND_2;
  wire  _T_19; // @[GCD.scala 22:29:@11.4]
  wire  AisZero; // @[GCD.scala 22:17:@12.4]
  wire  _T_22; // @[GCD.scala 23:29:@13.4]
  wire  BisZero; // @[GCD.scala 23:17:@14.4]
  wire  _T_24; // @[GCD.scala 25:24:@15.4]
  wire  AisEven; // @[GCD.scala 25:17:@16.4]
  wire  _T_26; // @[GCD.scala 26:24:@17.4]
  wire  BisEven; // @[GCD.scala 26:17:@18.4]
  wire  larger; // @[GCD.scala 27:23:@19.4]
  wire [31:0] subop1; // @[GCD.scala 29:19:@20.4]
  wire [31:0] subop2; // @[GCD.scala 30:19:@21.4]
  wire [32:0] _T_28; // @[GCD.scala 32:23:@22.4]
  wire [32:0] _T_29; // @[GCD.scala 32:23:@23.4]
  wire [31:0] subRes; // @[GCD.scala 32:23:@24.4]
  wire  _T_31; // @[GCD.scala 33:34:@25.4]
  wire  subResisZero; // @[GCD.scala 33:22:@26.4]
  wire  _T_34; // @[GCD.scala 35:8:@27.4]
  wire  _T_35; // @[GCD.scala 36:27:@29.6]
  wire [4:0] _GEN_8; // @[GCD.scala 36:16:@30.6]
  wire [5:0] _T_36; // @[GCD.scala 36:16:@30.6]
  wire [4:0] _T_37; // @[GCD.scala 36:16:@31.6]
  wire [4:0] _GEN_0; // @[GCD.scala 35:18:@28.4]
  wire  _T_40; // @[GCD.scala 40:18:@36.6]
  wire [31:0] _T_41; // @[GCD.scala 41:24:@38.8]
  wire [31:0] _T_42; // @[GCD.scala 42:24:@40.8]
  wire [31:0] _T_44; // @[GCD.scala 44:24:@44.8]
  wire [31:0] _GEN_1; // @[GCD.scala 40:30:@37.6]
  wire [31:0] _GEN_2; // @[GCD.scala 40:30:@37.6]
  wire [31:0] _GEN_3; // @[GCD.scala 39:18:@35.4]
  wire [31:0] _GEN_4; // @[GCD.scala 39:18:@35.4]
  wire  _T_46; // @[GCD.scala 54:46:@54.4]
  wire [31:0] _T_48; // @[GCD.scala 54:37:@55.4]
  wire [31:0] tmp; // @[GCD.scala 54:16:@56.4]
  wire [62:0] _GEN_9; // @[GCD.scala 55:20:@57.4]
  wire [62:0] _T_49; // @[GCD.scala 55:20:@57.4]
  wire  _T_50; // @[GCD.scala 57:22:@59.4]
  assign _T_19 = OPAReg != 32'h0; // @[GCD.scala 22:29:@11.4]
  assign AisZero = _T_19 == 1'h0; // @[GCD.scala 22:17:@12.4]
  assign _T_22 = OPBReg != 32'h0; // @[GCD.scala 23:29:@13.4]
  assign BisZero = _T_22 == 1'h0; // @[GCD.scala 23:17:@14.4]
  assign _T_24 = OPAReg[0]; // @[GCD.scala 25:24:@15.4]
  assign AisEven = _T_24 == 1'h0; // @[GCD.scala 25:17:@16.4]
  assign _T_26 = OPBReg[0]; // @[GCD.scala 26:24:@17.4]
  assign BisEven = _T_26 == 1'h0; // @[GCD.scala 26:17:@18.4]
  assign larger = OPAReg > OPBReg; // @[GCD.scala 27:23:@19.4]
  assign subop1 = larger ? OPAReg : OPBReg; // @[GCD.scala 29:19:@20.4]
  assign subop2 = larger ? OPBReg : OPAReg; // @[GCD.scala 30:19:@21.4]
  assign _T_28 = subop1 - subop2; // @[GCD.scala 32:23:@22.4]
  assign _T_29 = $unsigned(_T_28); // @[GCD.scala 32:23:@23.4]
  assign subRes = _T_29[31:0]; // @[GCD.scala 32:23:@24.4]
  assign _T_31 = subRes != 32'h0; // @[GCD.scala 33:34:@25.4]
  assign subResisZero = _T_31 == 1'h0; // @[GCD.scala 33:22:@26.4]
  assign _T_34 = io_DONE == 1'h0; // @[GCD.scala 35:8:@27.4]
  assign _T_35 = AisEven & BisEven; // @[GCD.scala 36:27:@29.6]
  assign _GEN_8 = {{4'd0}, _T_35}; // @[GCD.scala 36:16:@30.6]
  assign _T_36 = cnt + _GEN_8; // @[GCD.scala 36:16:@30.6]
  assign _T_37 = _T_36[4:0]; // @[GCD.scala 36:16:@31.6]
  assign _GEN_0 = _T_34 ? _T_37 : cnt; // @[GCD.scala 35:18:@28.4]
  assign _T_40 = AisEven | BisEven; // @[GCD.scala 40:18:@36.6]
  assign _T_41 = OPAReg >> AisEven; // @[GCD.scala 41:24:@38.8]
  assign _T_42 = OPBReg >> BisEven; // @[GCD.scala 42:24:@40.8]
  assign _T_44 = subRes >> 1'h1; // @[GCD.scala 44:24:@44.8]
  assign _GEN_1 = _T_40 ? _T_41 : _T_44; // @[GCD.scala 40:30:@37.6]
  assign _GEN_2 = _T_40 ? _T_42 : subop2; // @[GCD.scala 40:30:@37.6]
  assign _GEN_3 = _T_34 ? _GEN_1 : OPAReg; // @[GCD.scala 39:18:@35.4]
  assign _GEN_4 = _T_34 ? _GEN_2 : OPBReg; // @[GCD.scala 39:18:@35.4]
  assign _T_46 = BisZero | subResisZero; // @[GCD.scala 54:46:@54.4]
  assign _T_48 = _T_46 ? OPAReg : 32'h0; // @[GCD.scala 54:37:@55.4]
  assign tmp = AisZero ? OPBReg : _T_48; // @[GCD.scala 54:16:@56.4]
  assign _GEN_9 = {{31'd0}, tmp}; // @[GCD.scala 55:20:@57.4]
  assign _T_49 = _GEN_9 << cnt; // @[GCD.scala 55:20:@57.4]
  assign _T_50 = AisZero | BisZero; // @[GCD.scala 57:22:@59.4]
  assign io_RESULT = _T_49[31:0]; // @[GCD.scala 55:13:@58.4]
  assign io_DONE = _T_50 | subResisZero; // @[GCD.scala 57:11:@61.4]
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
  OPAReg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  OPBReg = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_START) begin
      OPAReg <= io_OPA;
    end else begin
      if (_T_34) begin
        if (_T_40) begin
          OPAReg <= _T_41;
        end else begin
          OPAReg <= _T_44;
        end
      end
    end
    if (io_START) begin
      OPBReg <= io_OPB;
    end else begin
      if (_T_34) begin
        if (_T_40) begin
          OPBReg <= _T_42;
        end else begin
          if (!(larger)) begin
            OPBReg <= OPAReg;
          end
        end
      end
    end
    if (io_START) begin
      cnt <= 5'h0;
    end else begin
      if (_T_34) begin
        cnt <= _T_37;
      end
    end
  end
endmodule
