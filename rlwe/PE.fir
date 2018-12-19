;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit PE : 
  module OneBit : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_9 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_10 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_11 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_12 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_13 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_14 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module OneBit_15 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_15 = bits(io.a, 161, 0) @[OneBit.scala 18:24]
    node aShift = cat(_T_15, UInt<1>("h00")) @[Cat.scala 30:58]
    node _T_17 = bits(io.a, 162, 162) @[OneBit.scala 19:22]
    node _T_19 = eq(_T_17, UInt<1>("h01")) @[OneBit.scala 19:28]
    node _T_24 = mux(UInt<1>("h00"), UInt<155>("h07ffffffffffffffffffffffffffffffffffffff"), UInt<155>("h00")) @[Bitwise.scala 72:12]
    node _T_26 = cat(_T_24, UInt<8>("h0c9")) @[Cat.scala 30:58]
    node _T_27 = xor(aShift, _T_26) @[OneBit.scala 19:44]
    node _T_28 = mux(_T_19, _T_27, aShift) @[OneBit.scala 19:17]
    io.aout <= _T_28 @[OneBit.scala 19:11]
    node _T_30 = eq(io.bi, UInt<1>("h01")) @[OneBit.scala 20:24]
    node _T_31 = xor(io.a, io.p) @[OneBit.scala 20:38]
    node _T_32 = mux(_T_30, _T_31, io.p) @[OneBit.scala 20:17]
    io.pout <= _T_32 @[OneBit.scala 20:11]
    
  module PE : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    inst OneBit of OneBit @[PE.scala 15:47]
    OneBit.clock <= clock
    OneBit.reset <= reset
    inst OneBit_1 of OneBit_1 @[PE.scala 15:47]
    OneBit_1.clock <= clock
    OneBit_1.reset <= reset
    inst OneBit_2 of OneBit_2 @[PE.scala 15:47]
    OneBit_2.clock <= clock
    OneBit_2.reset <= reset
    inst OneBit_3 of OneBit_3 @[PE.scala 15:47]
    OneBit_3.clock <= clock
    OneBit_3.reset <= reset
    inst OneBit_4 of OneBit_4 @[PE.scala 15:47]
    OneBit_4.clock <= clock
    OneBit_4.reset <= reset
    inst OneBit_5 of OneBit_5 @[PE.scala 15:47]
    OneBit_5.clock <= clock
    OneBit_5.reset <= reset
    inst OneBit_6 of OneBit_6 @[PE.scala 15:47]
    OneBit_6.clock <= clock
    OneBit_6.reset <= reset
    inst OneBit_7 of OneBit_7 @[PE.scala 15:47]
    OneBit_7.clock <= clock
    OneBit_7.reset <= reset
    inst OneBit_8 of OneBit_8 @[PE.scala 15:47]
    OneBit_8.clock <= clock
    OneBit_8.reset <= reset
    inst OneBit_9 of OneBit_9 @[PE.scala 15:47]
    OneBit_9.clock <= clock
    OneBit_9.reset <= reset
    inst OneBit_10 of OneBit_10 @[PE.scala 15:47]
    OneBit_10.clock <= clock
    OneBit_10.reset <= reset
    inst OneBit_11 of OneBit_11 @[PE.scala 15:47]
    OneBit_11.clock <= clock
    OneBit_11.reset <= reset
    inst OneBit_12 of OneBit_12 @[PE.scala 15:47]
    OneBit_12.clock <= clock
    OneBit_12.reset <= reset
    inst OneBit_13 of OneBit_13 @[PE.scala 15:47]
    OneBit_13.clock <= clock
    OneBit_13.reset <= reset
    inst OneBit_14 of OneBit_14 @[PE.scala 15:47]
    OneBit_14.clock <= clock
    OneBit_14.reset <= reset
    inst OneBit_15 of OneBit_15 @[PE.scala 15:47]
    OneBit_15.clock <= clock
    OneBit_15.reset <= reset
    wire bits : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<1>, aout : UInt<163>, pout : UInt<163>}[16] @[PE.scala 15:21]
    bits[0].pout <= OneBit.io.pout @[PE.scala 15:21]
    bits[0].aout <= OneBit.io.aout @[PE.scala 15:21]
    OneBit.io.bi <= bits[0].bi @[PE.scala 15:21]
    OneBit.io.p <= bits[0].p @[PE.scala 15:21]
    OneBit.io.a <= bits[0].a @[PE.scala 15:21]
    bits[1].pout <= OneBit_1.io.pout @[PE.scala 15:21]
    bits[1].aout <= OneBit_1.io.aout @[PE.scala 15:21]
    OneBit_1.io.bi <= bits[1].bi @[PE.scala 15:21]
    OneBit_1.io.p <= bits[1].p @[PE.scala 15:21]
    OneBit_1.io.a <= bits[1].a @[PE.scala 15:21]
    bits[2].pout <= OneBit_2.io.pout @[PE.scala 15:21]
    bits[2].aout <= OneBit_2.io.aout @[PE.scala 15:21]
    OneBit_2.io.bi <= bits[2].bi @[PE.scala 15:21]
    OneBit_2.io.p <= bits[2].p @[PE.scala 15:21]
    OneBit_2.io.a <= bits[2].a @[PE.scala 15:21]
    bits[3].pout <= OneBit_3.io.pout @[PE.scala 15:21]
    bits[3].aout <= OneBit_3.io.aout @[PE.scala 15:21]
    OneBit_3.io.bi <= bits[3].bi @[PE.scala 15:21]
    OneBit_3.io.p <= bits[3].p @[PE.scala 15:21]
    OneBit_3.io.a <= bits[3].a @[PE.scala 15:21]
    bits[4].pout <= OneBit_4.io.pout @[PE.scala 15:21]
    bits[4].aout <= OneBit_4.io.aout @[PE.scala 15:21]
    OneBit_4.io.bi <= bits[4].bi @[PE.scala 15:21]
    OneBit_4.io.p <= bits[4].p @[PE.scala 15:21]
    OneBit_4.io.a <= bits[4].a @[PE.scala 15:21]
    bits[5].pout <= OneBit_5.io.pout @[PE.scala 15:21]
    bits[5].aout <= OneBit_5.io.aout @[PE.scala 15:21]
    OneBit_5.io.bi <= bits[5].bi @[PE.scala 15:21]
    OneBit_5.io.p <= bits[5].p @[PE.scala 15:21]
    OneBit_5.io.a <= bits[5].a @[PE.scala 15:21]
    bits[6].pout <= OneBit_6.io.pout @[PE.scala 15:21]
    bits[6].aout <= OneBit_6.io.aout @[PE.scala 15:21]
    OneBit_6.io.bi <= bits[6].bi @[PE.scala 15:21]
    OneBit_6.io.p <= bits[6].p @[PE.scala 15:21]
    OneBit_6.io.a <= bits[6].a @[PE.scala 15:21]
    bits[7].pout <= OneBit_7.io.pout @[PE.scala 15:21]
    bits[7].aout <= OneBit_7.io.aout @[PE.scala 15:21]
    OneBit_7.io.bi <= bits[7].bi @[PE.scala 15:21]
    OneBit_7.io.p <= bits[7].p @[PE.scala 15:21]
    OneBit_7.io.a <= bits[7].a @[PE.scala 15:21]
    bits[8].pout <= OneBit_8.io.pout @[PE.scala 15:21]
    bits[8].aout <= OneBit_8.io.aout @[PE.scala 15:21]
    OneBit_8.io.bi <= bits[8].bi @[PE.scala 15:21]
    OneBit_8.io.p <= bits[8].p @[PE.scala 15:21]
    OneBit_8.io.a <= bits[8].a @[PE.scala 15:21]
    bits[9].pout <= OneBit_9.io.pout @[PE.scala 15:21]
    bits[9].aout <= OneBit_9.io.aout @[PE.scala 15:21]
    OneBit_9.io.bi <= bits[9].bi @[PE.scala 15:21]
    OneBit_9.io.p <= bits[9].p @[PE.scala 15:21]
    OneBit_9.io.a <= bits[9].a @[PE.scala 15:21]
    bits[10].pout <= OneBit_10.io.pout @[PE.scala 15:21]
    bits[10].aout <= OneBit_10.io.aout @[PE.scala 15:21]
    OneBit_10.io.bi <= bits[10].bi @[PE.scala 15:21]
    OneBit_10.io.p <= bits[10].p @[PE.scala 15:21]
    OneBit_10.io.a <= bits[10].a @[PE.scala 15:21]
    bits[11].pout <= OneBit_11.io.pout @[PE.scala 15:21]
    bits[11].aout <= OneBit_11.io.aout @[PE.scala 15:21]
    OneBit_11.io.bi <= bits[11].bi @[PE.scala 15:21]
    OneBit_11.io.p <= bits[11].p @[PE.scala 15:21]
    OneBit_11.io.a <= bits[11].a @[PE.scala 15:21]
    bits[12].pout <= OneBit_12.io.pout @[PE.scala 15:21]
    bits[12].aout <= OneBit_12.io.aout @[PE.scala 15:21]
    OneBit_12.io.bi <= bits[12].bi @[PE.scala 15:21]
    OneBit_12.io.p <= bits[12].p @[PE.scala 15:21]
    OneBit_12.io.a <= bits[12].a @[PE.scala 15:21]
    bits[13].pout <= OneBit_13.io.pout @[PE.scala 15:21]
    bits[13].aout <= OneBit_13.io.aout @[PE.scala 15:21]
    OneBit_13.io.bi <= bits[13].bi @[PE.scala 15:21]
    OneBit_13.io.p <= bits[13].p @[PE.scala 15:21]
    OneBit_13.io.a <= bits[13].a @[PE.scala 15:21]
    bits[14].pout <= OneBit_14.io.pout @[PE.scala 15:21]
    bits[14].aout <= OneBit_14.io.aout @[PE.scala 15:21]
    OneBit_14.io.bi <= bits[14].bi @[PE.scala 15:21]
    OneBit_14.io.p <= bits[14].p @[PE.scala 15:21]
    OneBit_14.io.a <= bits[14].a @[PE.scala 15:21]
    bits[15].pout <= OneBit_15.io.pout @[PE.scala 15:21]
    bits[15].aout <= OneBit_15.io.aout @[PE.scala 15:21]
    OneBit_15.io.bi <= bits[15].bi @[PE.scala 15:21]
    OneBit_15.io.p <= bits[15].p @[PE.scala 15:21]
    OneBit_15.io.a <= bits[15].a @[PE.scala 15:21]
    bits[0].a <= io.a @[PE.scala 19:17]
    bits[0].p <= io.p @[PE.scala 20:17]
    node _T_296 = bits(io.bi, 0, 0) @[PE.scala 21:26]
    bits[0].bi <= _T_296 @[PE.scala 21:18]
    bits[1].a <= bits[0].aout @[PE.scala 23:17]
    bits[1].p <= bits[0].pout @[PE.scala 24:17]
    node _T_297 = bits(io.bi, 1, 1) @[PE.scala 25:26]
    bits[1].bi <= _T_297 @[PE.scala 25:18]
    bits[2].a <= bits[1].aout @[PE.scala 23:17]
    bits[2].p <= bits[1].pout @[PE.scala 24:17]
    node _T_298 = bits(io.bi, 2, 2) @[PE.scala 25:26]
    bits[2].bi <= _T_298 @[PE.scala 25:18]
    bits[3].a <= bits[2].aout @[PE.scala 23:17]
    bits[3].p <= bits[2].pout @[PE.scala 24:17]
    node _T_299 = bits(io.bi, 3, 3) @[PE.scala 25:26]
    bits[3].bi <= _T_299 @[PE.scala 25:18]
    bits[4].a <= bits[3].aout @[PE.scala 23:17]
    bits[4].p <= bits[3].pout @[PE.scala 24:17]
    node _T_300 = bits(io.bi, 4, 4) @[PE.scala 25:26]
    bits[4].bi <= _T_300 @[PE.scala 25:18]
    bits[5].a <= bits[4].aout @[PE.scala 23:17]
    bits[5].p <= bits[4].pout @[PE.scala 24:17]
    node _T_301 = bits(io.bi, 5, 5) @[PE.scala 25:26]
    bits[5].bi <= _T_301 @[PE.scala 25:18]
    bits[6].a <= bits[5].aout @[PE.scala 23:17]
    bits[6].p <= bits[5].pout @[PE.scala 24:17]
    node _T_302 = bits(io.bi, 6, 6) @[PE.scala 25:26]
    bits[6].bi <= _T_302 @[PE.scala 25:18]
    bits[7].a <= bits[6].aout @[PE.scala 23:17]
    bits[7].p <= bits[6].pout @[PE.scala 24:17]
    node _T_303 = bits(io.bi, 7, 7) @[PE.scala 25:26]
    bits[7].bi <= _T_303 @[PE.scala 25:18]
    bits[8].a <= bits[7].aout @[PE.scala 23:17]
    bits[8].p <= bits[7].pout @[PE.scala 24:17]
    node _T_304 = bits(io.bi, 8, 8) @[PE.scala 25:26]
    bits[8].bi <= _T_304 @[PE.scala 25:18]
    bits[9].a <= bits[8].aout @[PE.scala 23:17]
    bits[9].p <= bits[8].pout @[PE.scala 24:17]
    node _T_305 = bits(io.bi, 9, 9) @[PE.scala 25:26]
    bits[9].bi <= _T_305 @[PE.scala 25:18]
    bits[10].a <= bits[9].aout @[PE.scala 23:17]
    bits[10].p <= bits[9].pout @[PE.scala 24:17]
    node _T_306 = bits(io.bi, 10, 10) @[PE.scala 25:26]
    bits[10].bi <= _T_306 @[PE.scala 25:18]
    bits[11].a <= bits[10].aout @[PE.scala 23:17]
    bits[11].p <= bits[10].pout @[PE.scala 24:17]
    node _T_307 = bits(io.bi, 11, 11) @[PE.scala 25:26]
    bits[11].bi <= _T_307 @[PE.scala 25:18]
    bits[12].a <= bits[11].aout @[PE.scala 23:17]
    bits[12].p <= bits[11].pout @[PE.scala 24:17]
    node _T_308 = bits(io.bi, 12, 12) @[PE.scala 25:26]
    bits[12].bi <= _T_308 @[PE.scala 25:18]
    bits[13].a <= bits[12].aout @[PE.scala 23:17]
    bits[13].p <= bits[12].pout @[PE.scala 24:17]
    node _T_309 = bits(io.bi, 13, 13) @[PE.scala 25:26]
    bits[13].bi <= _T_309 @[PE.scala 25:18]
    bits[14].a <= bits[13].aout @[PE.scala 23:17]
    bits[14].p <= bits[13].pout @[PE.scala 24:17]
    node _T_310 = bits(io.bi, 14, 14) @[PE.scala 25:26]
    bits[14].bi <= _T_310 @[PE.scala 25:18]
    bits[15].a <= bits[14].aout @[PE.scala 23:17]
    bits[15].p <= bits[14].pout @[PE.scala 24:17]
    node _T_311 = bits(io.bi, 15, 15) @[PE.scala 25:26]
    bits[15].bi <= _T_311 @[PE.scala 25:18]
    reg _T_313 : UInt, clock @[PE.scala 30:23]
    _T_313 <= bits[15].aout @[PE.scala 30:23]
    io.aout <= _T_313 @[PE.scala 30:13]
    reg _T_315 : UInt, clock @[PE.scala 31:23]
    _T_315 <= bits[15].pout @[PE.scala 31:23]
    io.pout <= _T_315 @[PE.scala 31:13]
    
