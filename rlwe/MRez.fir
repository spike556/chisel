;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit MRez : 
  module MRez : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<14>, flip b : UInt<14>, flip op : UInt<1>, res : UInt<14>}
    
    node _T_13 = not(io.b) @[MR.scala 59:22]
    node b = mux(io.op, _T_13, io.b) @[MR.scala 59:14]
    node _T_14 = add(io.a, b) @[MR.scala 60:21]
    node _T_15 = tail(_T_14, 1) @[MR.scala 60:21]
    node _T_16 = add(_T_15, io.op) @[MR.scala 60:25]
    node addRes = tail(_T_16, 1) @[MR.scala 60:25]
    when io.op : @[MR.scala 61:15]
      node _T_17 = lt(io.a, io.b) @[MR.scala 62:24]
      node _T_19 = add(addRes, UInt<14>("h03001")) @[MR.scala 62:39]
      node _T_20 = tail(_T_19, 1) @[MR.scala 62:39]
      node _T_21 = mux(_T_17, _T_20, addRes) @[MR.scala 62:18]
      io.res <= _T_21 @[MR.scala 62:12]
      skip @[MR.scala 61:15]
    else : @[MR.scala 63:16]
      node _T_23 = lt(addRes, UInt<14>("h03001")) @[MR.scala 64:26]
      node _T_25 = sub(addRes, UInt<14>("h03001")) @[MR.scala 64:52]
      node _T_26 = asUInt(_T_25) @[MR.scala 64:52]
      node _T_27 = tail(_T_26, 1) @[MR.scala 64:52]
      node _T_28 = mux(_T_23, addRes, _T_27) @[MR.scala 64:18]
      io.res <= _T_28 @[MR.scala 64:12]
      skip @[MR.scala 63:16]
    
