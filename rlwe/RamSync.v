module RamSync( // @[:@3.2]
  input          clock, // @[:@4.4]
  input          reset, // @[:@5.4]
  input          io_re, // @[:@6.4]
  input          io_we, // @[:@6.4]
  input  [7:0]   io_ra, // @[:@6.4]
  input  [7:0]   io_wa, // @[:@6.4]
  input  [511:0] io_di, // @[:@6.4]
  output [511:0] io_dout // @[:@6.4]
);
  reg [511:0] mem [0:255]; // @[RamSync.scala 26:24:@8.4]
  reg [511:0] _RAND_0;
  wire [511:0] mem__T_25_data; // @[RamSync.scala 26:24:@8.4]
  wire [7:0] mem__T_25_addr; // @[RamSync.scala 26:24:@8.4]
  wire [511:0] mem__T_19_data; // @[RamSync.scala 26:24:@8.4]
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
  _RAND_0 = {16{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[511:0];
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
