;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit MM : 
  module FMul : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_1 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_2 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_3 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_4 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_5 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_6 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_7 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_8 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_9 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_9 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_9 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module FMul_10 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip b : UInt<16>, pout : UInt<178>}
    
    wire _T_13 : UInt<178>
    _T_13 <= UInt<178>("h00")
    wire _T_16 : UInt<178>
    _T_16 <= UInt<178>("h00")
    wire _T_19 : UInt<178>
    _T_19 <= UInt<178>("h00")
    wire _T_22 : UInt<178>
    _T_22 <= UInt<178>("h00")
    wire _T_25 : UInt<178>
    _T_25 <= UInt<178>("h00")
    wire _T_28 : UInt<178>
    _T_28 <= UInt<178>("h00")
    wire _T_31 : UInt<178>
    _T_31 <= UInt<178>("h00")
    wire _T_34 : UInt<178>
    _T_34 <= UInt<178>("h00")
    wire _T_37 : UInt<178>
    _T_37 <= UInt<178>("h00")
    wire _T_40 : UInt<178>
    _T_40 <= UInt<178>("h00")
    wire _T_43 : UInt<178>
    _T_43 <= UInt<178>("h00")
    wire _T_46 : UInt<178>
    _T_46 <= UInt<178>("h00")
    wire _T_49 : UInt<178>
    _T_49 <= UInt<178>("h00")
    wire _T_52 : UInt<178>
    _T_52 <= UInt<178>("h00")
    wire _T_55 : UInt<178>
    _T_55 <= UInt<178>("h00")
    wire _T_58 : UInt<178>
    _T_58 <= UInt<178>("h00")
    wire _T_61 : UInt<178>
    _T_61 <= UInt<178>("h00")
    wire tmp : UInt<178>[17] @[PEAlter.scala 17:21]
    tmp[0] <= _T_13 @[PEAlter.scala 17:21]
    tmp[1] <= _T_16 @[PEAlter.scala 17:21]
    tmp[2] <= _T_19 @[PEAlter.scala 17:21]
    tmp[3] <= _T_22 @[PEAlter.scala 17:21]
    tmp[4] <= _T_25 @[PEAlter.scala 17:21]
    tmp[5] <= _T_28 @[PEAlter.scala 17:21]
    tmp[6] <= _T_31 @[PEAlter.scala 17:21]
    tmp[7] <= _T_34 @[PEAlter.scala 17:21]
    tmp[8] <= _T_37 @[PEAlter.scala 17:21]
    tmp[9] <= _T_40 @[PEAlter.scala 17:21]
    tmp[10] <= _T_43 @[PEAlter.scala 17:21]
    tmp[11] <= _T_46 @[PEAlter.scala 17:21]
    tmp[12] <= _T_49 @[PEAlter.scala 17:21]
    tmp[13] <= _T_52 @[PEAlter.scala 17:21]
    tmp[14] <= _T_55 @[PEAlter.scala 17:21]
    tmp[15] <= _T_58 @[PEAlter.scala 17:21]
    tmp[16] <= _T_61 @[PEAlter.scala 17:21]
    node _T_84 = bits(io.b, 0, 0) @[PEAlter.scala 19:15]
    node _T_86 = eq(_T_84, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_86 : @[PEAlter.scala 19:28]
      node _T_88 = dshl(io.a, UInt<1>("h00")) @[PEAlter.scala 20:34]
      node _T_89 = xor(tmp[0], _T_88) @[PEAlter.scala 20:26]
      tmp[1] <= _T_89 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[1] <= tmp[0] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_90 = bits(io.b, 1, 1) @[PEAlter.scala 19:15]
    node _T_92 = eq(_T_90, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_92 : @[PEAlter.scala 19:28]
      node _T_94 = dshl(io.a, UInt<1>("h01")) @[PEAlter.scala 20:34]
      node _T_95 = xor(tmp[1], _T_94) @[PEAlter.scala 20:26]
      tmp[2] <= _T_95 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[2] <= tmp[1] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_96 = bits(io.b, 2, 2) @[PEAlter.scala 19:15]
    node _T_98 = eq(_T_96, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_98 : @[PEAlter.scala 19:28]
      node _T_100 = dshl(io.a, UInt<2>("h02")) @[PEAlter.scala 20:34]
      node _T_101 = xor(tmp[2], _T_100) @[PEAlter.scala 20:26]
      tmp[3] <= _T_101 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[3] <= tmp[2] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_102 = bits(io.b, 3, 3) @[PEAlter.scala 19:15]
    node _T_104 = eq(_T_102, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_104 : @[PEAlter.scala 19:28]
      node _T_106 = dshl(io.a, UInt<2>("h03")) @[PEAlter.scala 20:34]
      node _T_107 = xor(tmp[3], _T_106) @[PEAlter.scala 20:26]
      tmp[4] <= _T_107 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[4] <= tmp[3] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_108 = bits(io.b, 4, 4) @[PEAlter.scala 19:15]
    node _T_110 = eq(_T_108, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_110 : @[PEAlter.scala 19:28]
      node _T_112 = dshl(io.a, UInt<3>("h04")) @[PEAlter.scala 20:34]
      node _T_113 = xor(tmp[4], _T_112) @[PEAlter.scala 20:26]
      tmp[5] <= _T_113 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[5] <= tmp[4] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_114 = bits(io.b, 5, 5) @[PEAlter.scala 19:15]
    node _T_116 = eq(_T_114, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_116 : @[PEAlter.scala 19:28]
      node _T_118 = dshl(io.a, UInt<3>("h05")) @[PEAlter.scala 20:34]
      node _T_119 = xor(tmp[5], _T_118) @[PEAlter.scala 20:26]
      tmp[6] <= _T_119 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[6] <= tmp[5] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_120 = bits(io.b, 6, 6) @[PEAlter.scala 19:15]
    node _T_122 = eq(_T_120, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_122 : @[PEAlter.scala 19:28]
      node _T_124 = dshl(io.a, UInt<3>("h06")) @[PEAlter.scala 20:34]
      node _T_125 = xor(tmp[6], _T_124) @[PEAlter.scala 20:26]
      tmp[7] <= _T_125 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[7] <= tmp[6] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_126 = bits(io.b, 7, 7) @[PEAlter.scala 19:15]
    node _T_128 = eq(_T_126, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_128 : @[PEAlter.scala 19:28]
      node _T_130 = dshl(io.a, UInt<3>("h07")) @[PEAlter.scala 20:34]
      node _T_131 = xor(tmp[7], _T_130) @[PEAlter.scala 20:26]
      tmp[8] <= _T_131 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[8] <= tmp[7] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_132 = bits(io.b, 8, 8) @[PEAlter.scala 19:15]
    node _T_134 = eq(_T_132, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_134 : @[PEAlter.scala 19:28]
      node _T_136 = dshl(io.a, UInt<4>("h08")) @[PEAlter.scala 20:34]
      node _T_137 = xor(tmp[8], _T_136) @[PEAlter.scala 20:26]
      tmp[9] <= _T_137 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[9] <= tmp[8] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_138 = bits(io.b, 9, 9) @[PEAlter.scala 19:15]
    node _T_140 = eq(_T_138, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_140 : @[PEAlter.scala 19:28]
      node _T_142 = dshl(io.a, UInt<4>("h09")) @[PEAlter.scala 20:34]
      node _T_143 = xor(tmp[9], _T_142) @[PEAlter.scala 20:26]
      tmp[10] <= _T_143 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[10] <= tmp[9] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_144 = bits(io.b, 10, 10) @[PEAlter.scala 19:15]
    node _T_146 = eq(_T_144, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_146 : @[PEAlter.scala 19:28]
      node _T_148 = dshl(io.a, UInt<4>("h0a")) @[PEAlter.scala 20:34]
      node _T_149 = xor(tmp[10], _T_148) @[PEAlter.scala 20:26]
      tmp[11] <= _T_149 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[11] <= tmp[10] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_150 = bits(io.b, 11, 11) @[PEAlter.scala 19:15]
    node _T_152 = eq(_T_150, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_152 : @[PEAlter.scala 19:28]
      node _T_154 = dshl(io.a, UInt<4>("h0b")) @[PEAlter.scala 20:34]
      node _T_155 = xor(tmp[11], _T_154) @[PEAlter.scala 20:26]
      tmp[12] <= _T_155 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[12] <= tmp[11] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_156 = bits(io.b, 12, 12) @[PEAlter.scala 19:15]
    node _T_158 = eq(_T_156, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_158 : @[PEAlter.scala 19:28]
      node _T_160 = dshl(io.a, UInt<4>("h0c")) @[PEAlter.scala 20:34]
      node _T_161 = xor(tmp[12], _T_160) @[PEAlter.scala 20:26]
      tmp[13] <= _T_161 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[13] <= tmp[12] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_162 = bits(io.b, 13, 13) @[PEAlter.scala 19:15]
    node _T_164 = eq(_T_162, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_164 : @[PEAlter.scala 19:28]
      node _T_166 = dshl(io.a, UInt<4>("h0d")) @[PEAlter.scala 20:34]
      node _T_167 = xor(tmp[13], _T_166) @[PEAlter.scala 20:26]
      tmp[14] <= _T_167 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[14] <= tmp[13] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_168 = bits(io.b, 14, 14) @[PEAlter.scala 19:15]
    node _T_170 = eq(_T_168, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_170 : @[PEAlter.scala 19:28]
      node _T_172 = dshl(io.a, UInt<4>("h0e")) @[PEAlter.scala 20:34]
      node _T_173 = xor(tmp[14], _T_172) @[PEAlter.scala 20:26]
      tmp[15] <= _T_173 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[15] <= tmp[14] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    node _T_174 = bits(io.b, 15, 15) @[PEAlter.scala 19:15]
    node _T_176 = eq(_T_174, UInt<1>("h01")) @[PEAlter.scala 19:19]
    when _T_176 : @[PEAlter.scala 19:28]
      node _T_178 = dshl(io.a, UInt<4>("h0f")) @[PEAlter.scala 20:34]
      node _T_179 = xor(tmp[15], _T_178) @[PEAlter.scala 20:26]
      tmp[16] <= _T_179 @[PEAlter.scala 20:16]
      skip @[PEAlter.scala 19:28]
    else : @[PEAlter.scala 21:18]
      tmp[16] <= tmp[15] @[PEAlter.scala 22:16]
      skip @[PEAlter.scala 21:18]
    io.pout <= tmp[16] @[PEAlter.scala 25:11]
    
  module PEAlter_10 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}
    
    node _T_16 = dshl(io.p, UInt<5>("h010")) @[PEAlter.scala 45:21]
    inst FMul of FMul_10 @[PEAlter.scala 30:19]
    FMul.clock <= clock
    FMul.reset <= reset
    FMul.io.a <= io.a @[PEAlter.scala 31:12]
    FMul.io.b <= io.bi @[PEAlter.scala 32:12]
    node ptmp1 = xor(_T_16, FMul.io.pout) @[PEAlter.scala 45:36]
    node pGuess = dshr(ptmp1, UInt<8>("h0a3")) @[PEAlter.scala 46:22]
    node _T_18 = bits(ptmp1, 162, 0) @[PEAlter.scala 47:20]
    node _T_20 = dshl(pGuess, UInt<3>("h07")) @[PEAlter.scala 47:39]
    node _T_22 = dshl(pGuess, UInt<3>("h06")) @[PEAlter.scala 47:57]
    node _T_23 = xor(_T_20, _T_22) @[PEAlter.scala 47:47]
    node _T_25 = dshl(pGuess, UInt<2>("h03")) @[PEAlter.scala 47:75]
    node _T_26 = xor(_T_23, _T_25) @[PEAlter.scala 47:65]
    node _T_27 = xor(_T_26, pGuess) @[PEAlter.scala 47:83]
    node ptmp4 = xor(_T_18, _T_27) @[PEAlter.scala 47:28]
    reg _T_29 : UInt, clock @[PEAlter.scala 50:21]
    _T_29 <= io.a @[PEAlter.scala 50:21]
    io.aout <= _T_29 @[PEAlter.scala 50:11]
    reg _T_31 : UInt, clock @[PEAlter.scala 51:21]
    _T_31 <= ptmp4 @[PEAlter.scala 51:21]
    io.pout <= _T_31 @[PEAlter.scala 51:11]
    
  module ShiftRegs : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[1] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[1], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    io.out <= delays[0] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[2] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[2], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    io.out <= delays[1] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[3] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[3], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    io.out <= delays[2] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[4] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[4], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    io.out <= delays[3] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_4 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[5] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[4] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[5], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    delays[4] <= delays[3] @[ShiftRegs.scala 21:17]
    io.out <= delays[4] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_5 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[6] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[4] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[5] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[6], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    delays[4] <= delays[3] @[ShiftRegs.scala 21:17]
    delays[5] <= delays[4] @[ShiftRegs.scala 21:17]
    io.out <= delays[5] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[7] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[4] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[5] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[6] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[7], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    delays[4] <= delays[3] @[ShiftRegs.scala 21:17]
    delays[5] <= delays[4] @[ShiftRegs.scala 21:17]
    delays[6] <= delays[5] @[ShiftRegs.scala 21:17]
    io.out <= delays[6] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_7 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[8] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[4] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[5] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[6] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[7] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[8], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    delays[4] <= delays[3] @[ShiftRegs.scala 21:17]
    delays[5] <= delays[4] @[ShiftRegs.scala 21:17]
    delays[6] <= delays[5] @[ShiftRegs.scala 21:17]
    delays[7] <= delays[6] @[ShiftRegs.scala 21:17]
    io.out <= delays[7] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[9] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[4] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[5] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[6] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[7] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[8] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[9], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    delays[4] <= delays[3] @[ShiftRegs.scala 21:17]
    delays[5] <= delays[4] @[ShiftRegs.scala 21:17]
    delays[6] <= delays[5] @[ShiftRegs.scala 21:17]
    delays[7] <= delays[6] @[ShiftRegs.scala 21:17]
    delays[8] <= delays[7] @[ShiftRegs.scala 21:17]
    io.out <= delays[8] @[ShiftRegs.scala 24:10]
    
  module ShiftRegs_9 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : UInt<16>}
    
    wire _T_12 : UInt<16>[10] @[ShiftRegs.scala 15:31]
    _T_12[0] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[1] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[2] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[3] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[4] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[5] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[6] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[7] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[8] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    _T_12[9] <= UInt<16>("h00") @[ShiftRegs.scala 15:31]
    reg delays : UInt<16>[10], clock with : (reset => (reset, _T_12)) @[ShiftRegs.scala 15:23]
    delays[0] <= io.in @[ShiftRegs.scala 18:17]
    delays[1] <= delays[0] @[ShiftRegs.scala 21:17]
    delays[2] <= delays[1] @[ShiftRegs.scala 21:17]
    delays[3] <= delays[2] @[ShiftRegs.scala 21:17]
    delays[4] <= delays[3] @[ShiftRegs.scala 21:17]
    delays[5] <= delays[4] @[ShiftRegs.scala 21:17]
    delays[6] <= delays[5] @[ShiftRegs.scala 21:17]
    delays[7] <= delays[6] @[ShiftRegs.scala 21:17]
    delays[8] <= delays[7] @[ShiftRegs.scala 21:17]
    delays[9] <= delays[8] @[ShiftRegs.scala 21:17]
    io.out <= delays[9] @[ShiftRegs.scala 24:10]
    
  module MM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<163>, flip bi : UInt<163>, pout : UInt<163>}
    
    inst PEAlter of PEAlter @[MM.scala 16:59]
    PEAlter.clock <= clock
    PEAlter.reset <= reset
    inst PEAlter_1 of PEAlter_1 @[MM.scala 16:59]
    PEAlter_1.clock <= clock
    PEAlter_1.reset <= reset
    inst PEAlter_2 of PEAlter_2 @[MM.scala 16:59]
    PEAlter_2.clock <= clock
    PEAlter_2.reset <= reset
    inst PEAlter_3 of PEAlter_3 @[MM.scala 16:59]
    PEAlter_3.clock <= clock
    PEAlter_3.reset <= reset
    inst PEAlter_4 of PEAlter_4 @[MM.scala 16:59]
    PEAlter_4.clock <= clock
    PEAlter_4.reset <= reset
    inst PEAlter_5 of PEAlter_5 @[MM.scala 16:59]
    PEAlter_5.clock <= clock
    PEAlter_5.reset <= reset
    inst PEAlter_6 of PEAlter_6 @[MM.scala 16:59]
    PEAlter_6.clock <= clock
    PEAlter_6.reset <= reset
    inst PEAlter_7 of PEAlter_7 @[MM.scala 16:59]
    PEAlter_7.clock <= clock
    PEAlter_7.reset <= reset
    inst PEAlter_8 of PEAlter_8 @[MM.scala 16:59]
    PEAlter_8.clock <= clock
    PEAlter_8.reset <= reset
    inst PEAlter_9 of PEAlter_9 @[MM.scala 16:59]
    PEAlter_9.clock <= clock
    PEAlter_9.reset <= reset
    inst PEAlter_10 of PEAlter_10 @[MM.scala 16:59]
    PEAlter_10.clock <= clock
    PEAlter_10.reset <= reset
    wire _T_79 : {flip a : UInt<163>, flip p : UInt<163>, flip bi : UInt<16>, aout : UInt<163>, pout : UInt<163>}[11] @[MM.scala 16:22]
    _T_79[0].pout <= PEAlter.io.pout @[MM.scala 16:22]
    _T_79[0].aout <= PEAlter.io.aout @[MM.scala 16:22]
    PEAlter.io.bi <= _T_79[0].bi @[MM.scala 16:22]
    PEAlter.io.p <= _T_79[0].p @[MM.scala 16:22]
    PEAlter.io.a <= _T_79[0].a @[MM.scala 16:22]
    _T_79[1].pout <= PEAlter_1.io.pout @[MM.scala 16:22]
    _T_79[1].aout <= PEAlter_1.io.aout @[MM.scala 16:22]
    PEAlter_1.io.bi <= _T_79[1].bi @[MM.scala 16:22]
    PEAlter_1.io.p <= _T_79[1].p @[MM.scala 16:22]
    PEAlter_1.io.a <= _T_79[1].a @[MM.scala 16:22]
    _T_79[2].pout <= PEAlter_2.io.pout @[MM.scala 16:22]
    _T_79[2].aout <= PEAlter_2.io.aout @[MM.scala 16:22]
    PEAlter_2.io.bi <= _T_79[2].bi @[MM.scala 16:22]
    PEAlter_2.io.p <= _T_79[2].p @[MM.scala 16:22]
    PEAlter_2.io.a <= _T_79[2].a @[MM.scala 16:22]
    _T_79[3].pout <= PEAlter_3.io.pout @[MM.scala 16:22]
    _T_79[3].aout <= PEAlter_3.io.aout @[MM.scala 16:22]
    PEAlter_3.io.bi <= _T_79[3].bi @[MM.scala 16:22]
    PEAlter_3.io.p <= _T_79[3].p @[MM.scala 16:22]
    PEAlter_3.io.a <= _T_79[3].a @[MM.scala 16:22]
    _T_79[4].pout <= PEAlter_4.io.pout @[MM.scala 16:22]
    _T_79[4].aout <= PEAlter_4.io.aout @[MM.scala 16:22]
    PEAlter_4.io.bi <= _T_79[4].bi @[MM.scala 16:22]
    PEAlter_4.io.p <= _T_79[4].p @[MM.scala 16:22]
    PEAlter_4.io.a <= _T_79[4].a @[MM.scala 16:22]
    _T_79[5].pout <= PEAlter_5.io.pout @[MM.scala 16:22]
    _T_79[5].aout <= PEAlter_5.io.aout @[MM.scala 16:22]
    PEAlter_5.io.bi <= _T_79[5].bi @[MM.scala 16:22]
    PEAlter_5.io.p <= _T_79[5].p @[MM.scala 16:22]
    PEAlter_5.io.a <= _T_79[5].a @[MM.scala 16:22]
    _T_79[6].pout <= PEAlter_6.io.pout @[MM.scala 16:22]
    _T_79[6].aout <= PEAlter_6.io.aout @[MM.scala 16:22]
    PEAlter_6.io.bi <= _T_79[6].bi @[MM.scala 16:22]
    PEAlter_6.io.p <= _T_79[6].p @[MM.scala 16:22]
    PEAlter_6.io.a <= _T_79[6].a @[MM.scala 16:22]
    _T_79[7].pout <= PEAlter_7.io.pout @[MM.scala 16:22]
    _T_79[7].aout <= PEAlter_7.io.aout @[MM.scala 16:22]
    PEAlter_7.io.bi <= _T_79[7].bi @[MM.scala 16:22]
    PEAlter_7.io.p <= _T_79[7].p @[MM.scala 16:22]
    PEAlter_7.io.a <= _T_79[7].a @[MM.scala 16:22]
    _T_79[8].pout <= PEAlter_8.io.pout @[MM.scala 16:22]
    _T_79[8].aout <= PEAlter_8.io.aout @[MM.scala 16:22]
    PEAlter_8.io.bi <= _T_79[8].bi @[MM.scala 16:22]
    PEAlter_8.io.p <= _T_79[8].p @[MM.scala 16:22]
    PEAlter_8.io.a <= _T_79[8].a @[MM.scala 16:22]
    _T_79[9].pout <= PEAlter_9.io.pout @[MM.scala 16:22]
    _T_79[9].aout <= PEAlter_9.io.aout @[MM.scala 16:22]
    PEAlter_9.io.bi <= _T_79[9].bi @[MM.scala 16:22]
    PEAlter_9.io.p <= _T_79[9].p @[MM.scala 16:22]
    PEAlter_9.io.a <= _T_79[9].a @[MM.scala 16:22]
    _T_79[10].pout <= PEAlter_10.io.pout @[MM.scala 16:22]
    _T_79[10].aout <= PEAlter_10.io.aout @[MM.scala 16:22]
    PEAlter_10.io.bi <= _T_79[10].bi @[MM.scala 16:22]
    PEAlter_10.io.p <= _T_79[10].p @[MM.scala 16:22]
    PEAlter_10.io.a <= _T_79[10].a @[MM.scala 16:22]
    _T_79[0].a <= io.a @[MM.scala 20:18]
    _T_79[0].p <= UInt<163>("h00") @[MM.scala 21:18]
    node _T_215 = bits(io.bi, 162, 160) @[MM.scala 22:52]
    node _T_216 = cat(UInt<13>("h00"), _T_215) @[Cat.scala 30:58]
    _T_79[0].bi <= _T_216 @[MM.scala 22:19]
    _T_79[1].a <= _T_79[0].aout @[MM.scala 25:18]
    _T_79[1].p <= _T_79[0].pout @[MM.scala 26:18]
    node _T_217 = bits(io.bi, 159, 144) @[MM.scala 27:50]
    inst ShiftRegs of ShiftRegs @[ShiftRegs.scala 30:22]
    ShiftRegs.clock <= clock
    ShiftRegs.reset <= reset
    ShiftRegs.io.in <= _T_217 @[ShiftRegs.scala 31:16]
    _T_79[1].bi <= ShiftRegs.io.out @[MM.scala 27:19]
    _T_79[2].a <= _T_79[1].aout @[MM.scala 25:18]
    _T_79[2].p <= _T_79[1].pout @[MM.scala 26:18]
    node _T_218 = bits(io.bi, 143, 128) @[MM.scala 27:50]
    inst ShiftRegs_1 of ShiftRegs_1 @[ShiftRegs.scala 30:22]
    ShiftRegs_1.clock <= clock
    ShiftRegs_1.reset <= reset
    ShiftRegs_1.io.in <= _T_218 @[ShiftRegs.scala 31:16]
    _T_79[2].bi <= ShiftRegs_1.io.out @[MM.scala 27:19]
    _T_79[3].a <= _T_79[2].aout @[MM.scala 25:18]
    _T_79[3].p <= _T_79[2].pout @[MM.scala 26:18]
    node _T_219 = bits(io.bi, 127, 112) @[MM.scala 27:50]
    inst ShiftRegs_2 of ShiftRegs_2 @[ShiftRegs.scala 30:22]
    ShiftRegs_2.clock <= clock
    ShiftRegs_2.reset <= reset
    ShiftRegs_2.io.in <= _T_219 @[ShiftRegs.scala 31:16]
    _T_79[3].bi <= ShiftRegs_2.io.out @[MM.scala 27:19]
    _T_79[4].a <= _T_79[3].aout @[MM.scala 25:18]
    _T_79[4].p <= _T_79[3].pout @[MM.scala 26:18]
    node _T_220 = bits(io.bi, 111, 96) @[MM.scala 27:50]
    inst ShiftRegs_3 of ShiftRegs_3 @[ShiftRegs.scala 30:22]
    ShiftRegs_3.clock <= clock
    ShiftRegs_3.reset <= reset
    ShiftRegs_3.io.in <= _T_220 @[ShiftRegs.scala 31:16]
    _T_79[4].bi <= ShiftRegs_3.io.out @[MM.scala 27:19]
    _T_79[5].a <= _T_79[4].aout @[MM.scala 25:18]
    _T_79[5].p <= _T_79[4].pout @[MM.scala 26:18]
    node _T_221 = bits(io.bi, 95, 80) @[MM.scala 27:50]
    inst ShiftRegs_4 of ShiftRegs_4 @[ShiftRegs.scala 30:22]
    ShiftRegs_4.clock <= clock
    ShiftRegs_4.reset <= reset
    ShiftRegs_4.io.in <= _T_221 @[ShiftRegs.scala 31:16]
    _T_79[5].bi <= ShiftRegs_4.io.out @[MM.scala 27:19]
    _T_79[6].a <= _T_79[5].aout @[MM.scala 25:18]
    _T_79[6].p <= _T_79[5].pout @[MM.scala 26:18]
    node _T_222 = bits(io.bi, 79, 64) @[MM.scala 27:50]
    inst ShiftRegs_5 of ShiftRegs_5 @[ShiftRegs.scala 30:22]
    ShiftRegs_5.clock <= clock
    ShiftRegs_5.reset <= reset
    ShiftRegs_5.io.in <= _T_222 @[ShiftRegs.scala 31:16]
    _T_79[6].bi <= ShiftRegs_5.io.out @[MM.scala 27:19]
    _T_79[7].a <= _T_79[6].aout @[MM.scala 25:18]
    _T_79[7].p <= _T_79[6].pout @[MM.scala 26:18]
    node _T_223 = bits(io.bi, 63, 48) @[MM.scala 27:50]
    inst ShiftRegs_6 of ShiftRegs_6 @[ShiftRegs.scala 30:22]
    ShiftRegs_6.clock <= clock
    ShiftRegs_6.reset <= reset
    ShiftRegs_6.io.in <= _T_223 @[ShiftRegs.scala 31:16]
    _T_79[7].bi <= ShiftRegs_6.io.out @[MM.scala 27:19]
    _T_79[8].a <= _T_79[7].aout @[MM.scala 25:18]
    _T_79[8].p <= _T_79[7].pout @[MM.scala 26:18]
    node _T_224 = bits(io.bi, 47, 32) @[MM.scala 27:50]
    inst ShiftRegs_7 of ShiftRegs_7 @[ShiftRegs.scala 30:22]
    ShiftRegs_7.clock <= clock
    ShiftRegs_7.reset <= reset
    ShiftRegs_7.io.in <= _T_224 @[ShiftRegs.scala 31:16]
    _T_79[8].bi <= ShiftRegs_7.io.out @[MM.scala 27:19]
    _T_79[9].a <= _T_79[8].aout @[MM.scala 25:18]
    _T_79[9].p <= _T_79[8].pout @[MM.scala 26:18]
    node _T_225 = bits(io.bi, 31, 16) @[MM.scala 27:50]
    inst ShiftRegs_8 of ShiftRegs_8 @[ShiftRegs.scala 30:22]
    ShiftRegs_8.clock <= clock
    ShiftRegs_8.reset <= reset
    ShiftRegs_8.io.in <= _T_225 @[ShiftRegs.scala 31:16]
    _T_79[9].bi <= ShiftRegs_8.io.out @[MM.scala 27:19]
    _T_79[10].a <= _T_79[9].aout @[MM.scala 25:18]
    _T_79[10].p <= _T_79[9].pout @[MM.scala 26:18]
    node _T_226 = bits(io.bi, 15, 0) @[MM.scala 27:50]
    inst ShiftRegs_9 of ShiftRegs_9 @[ShiftRegs.scala 30:22]
    ShiftRegs_9.clock <= clock
    ShiftRegs_9.reset <= reset
    ShiftRegs_9.io.in <= _T_226 @[ShiftRegs.scala 31:16]
    _T_79[10].bi <= ShiftRegs_9.io.out @[MM.scala 27:19]
    io.pout <= _T_79[10].pout @[MM.scala 31:13]
    
