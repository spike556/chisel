;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit RamSync : 
  module RamSync : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip re : UInt<1>, flip we : UInt<1>, flip ra : UInt<8>, flip wa : UInt<8>, flip di : UInt<512>, dout : UInt<512>}
    
    smem mem : UInt<512>[256] @[RamSync.scala 26:24]
    when io.we : @[RamSync.scala 28:16]
      write mport _T_19 = mem[io.wa], clock
      _T_19 <= io.di
      skip @[RamSync.scala 28:16]
    wire _T_21 : UInt @[RamSync.scala 32:22]
    _T_21 is invalid @[RamSync.scala 32:22]
    when io.re : @[RamSync.scala 32:22]
      _T_21 <= io.ra @[RamSync.scala 32:22]
      node _T_23 = or(_T_21, UInt<8>("h00")) @[RamSync.scala 32:22]
      node _T_24 = bits(_T_23, 7, 0) @[RamSync.scala 32:22]
      read mport _T_25 = mem[_T_24], clock @[RamSync.scala 32:22]
      skip @[RamSync.scala 32:22]
    io.dout <= _T_25 @[RamSync.scala 32:11]
    
