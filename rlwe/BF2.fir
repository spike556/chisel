;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit BF2 : 
  module MR : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<28>, ar : UInt<14>}
    
    node shift1 = dshr(io.a, UInt<4>("h0c")) @[MR.scala 26:21]
    node _T_11 = dshl(shift1, UInt<1>("h01")) @[MR.scala 27:31]
    node _T_12 = add(shift1, _T_11) @[MR.scala 27:21]
    node _T_13 = tail(_T_12, 1) @[MR.scala 27:21]
    node _T_15 = dshl(shift1, UInt<2>("h02")) @[MR.scala 27:49]
    node _T_16 = add(_T_13, _T_15) @[MR.scala 27:39]
    node _T_17 = tail(_T_16, 1) @[MR.scala 27:39]
    node _T_19 = dshl(shift1, UInt<3>("h05")) @[MR.scala 27:67]
    node _T_20 = add(_T_17, _T_19) @[MR.scala 27:57]
    node _T_21 = tail(_T_20, 1) @[MR.scala 27:57]
    node _T_23 = dshl(shift1, UInt<3>("h07")) @[MR.scala 27:85]
    node _T_24 = add(_T_21, _T_23) @[MR.scala 27:75]
    node _T_25 = tail(_T_24, 1) @[MR.scala 27:75]
    node _T_27 = dshl(shift1, UInt<4>("h09")) @[MR.scala 28:13]
    node _T_28 = add(_T_25, _T_27) @[MR.scala 27:93]
    node _T_29 = tail(_T_28, 1) @[MR.scala 27:93]
    node _T_31 = dshl(shift1, UInt<4>("h0b")) @[MR.scala 28:31]
    node _T_32 = add(_T_29, _T_31) @[MR.scala 28:21]
    node _T_33 = tail(_T_32, 1) @[MR.scala 28:21]
    node _T_35 = dshl(shift1, UInt<4>("h0d")) @[MR.scala 28:50]
    node _T_36 = add(_T_33, _T_35) @[MR.scala 28:40]
    node _T_37 = tail(_T_36, 1) @[MR.scala 28:40]
    node _T_39 = dshl(shift1, UInt<4>("h0f")) @[MR.scala 28:69]
    node _T_40 = add(_T_37, _T_39) @[MR.scala 28:59]
    node mul1 = tail(_T_40, 1) @[MR.scala 28:59]
    node qGuess = dshr(mul1, UInt<5>("h011")) @[MR.scala 29:21]
    node _T_43 = dshl(qGuess, UInt<4>("h0c")) @[MR.scala 30:29]
    node _T_44 = add(qGuess, _T_43) @[MR.scala 30:19]
    node _T_45 = tail(_T_44, 1) @[MR.scala 30:19]
    node _T_47 = dshl(qGuess, UInt<4>("h0d")) @[MR.scala 30:48]
    node _T_48 = add(_T_45, _T_47) @[MR.scala 30:38]
    node qM = tail(_T_48, 1) @[MR.scala 30:38]
    node _T_49 = sub(io.a, qM) @[MR.scala 31:16]
    node _T_50 = asUInt(_T_49) @[MR.scala 31:16]
    node z = tail(_T_50, 1) @[MR.scala 31:16]
    node _T_52 = lt(z, UInt<14>("h03001")) @[MR.scala 32:18]
    node _T_54 = sub(z, UInt<14>("h03001")) @[MR.scala 32:45]
    node _T_55 = asUInt(_T_54) @[MR.scala 32:45]
    node _T_56 = tail(_T_55, 1) @[MR.scala 32:45]
    node _T_57 = mux(_T_52, z, _T_56) @[MR.scala 32:15]
    io.ar <= _T_57 @[MR.scala 32:9]
    
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
    
  module MRez_1 : 
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
    
  module BF2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<14>, flip b : UInt<14>, flip w : UInt<14>, A : UInt<14>, B : UInt<14>}
    
    node _T_15 = mul(io.b, io.w) @[BF2.scala 18:28]
    reg bmulw : UInt, clock @[BF2.scala 18:22]
    bmulw <= _T_15 @[BF2.scala 18:22]
    reg aq1 : UInt, clock @[BF2.scala 19:20]
    aq1 <= io.a @[BF2.scala 19:20]
    inst MR of MR @[MR.scala 38:22]
    MR.clock <= clock
    MR.reset <= reset
    MR.io.a <= bmulw @[MR.scala 39:15]
    reg bmulwMR : UInt, clock @[BF2.scala 22:24]
    bmulwMR <= MR.io.ar @[BF2.scala 22:24]
    reg aq2 : UInt, clock @[BF2.scala 23:20]
    aq2 <= aq1 @[BF2.scala 23:20]
    inst MRez of MRez @[MR.scala 70:22]
    MRez.clock <= clock
    MRez.reset <= reset
    MRez.io.a <= aq2 @[MR.scala 71:15]
    MRez.io.b <= bmulwMR @[MR.scala 72:15]
    MRez.io.op <= UInt<1>("h00") @[MR.scala 73:16]
    reg _T_22 : UInt, clock @[BF2.scala 26:18]
    _T_22 <= MRez.io.res @[BF2.scala 26:18]
    io.A <= _T_22 @[BF2.scala 26:8]
    inst MRez_1 of MRez_1 @[MR.scala 70:22]
    MRez_1.clock <= clock
    MRez_1.reset <= reset
    MRez_1.io.a <= aq2 @[MR.scala 71:15]
    MRez_1.io.b <= bmulwMR @[MR.scala 72:15]
    MRez_1.io.op <= UInt<1>("h01") @[MR.scala 73:16]
    reg _T_25 : UInt, clock @[BF2.scala 27:18]
    _T_25 <= MRez_1.io.res @[BF2.scala 27:18]
    io.B <= _T_25 @[BF2.scala 27:8]
    
