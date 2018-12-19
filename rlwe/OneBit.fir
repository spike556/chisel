;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit OneBit : 
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
    
