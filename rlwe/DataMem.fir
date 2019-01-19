;buildInfoPackage: chisel3, version: 3.1.3, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-09-12 19:37:29.007, builtAtMillis: 1536781049007
circuit DataMem : 
  module RamSync : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip re : UInt<1>, flip we : UInt<1>, flip ra : UInt<8>, flip wa : UInt<8>, flip di : UInt<128>, dout : UInt<128>}
    
    smem mem : UInt<128>[256] @[RamSync.scala 26:24]
    when io.we : @[RamSync.scala 28:16]
      infer mport _T_19 = mem[io.wa], clock @[RamSync.scala 29:8]
      _T_19 <= io.di @[RamSync.scala 29:16]
      io.dout <= UInt<1>("h00") @[RamSync.scala 30:13]
      skip @[RamSync.scala 28:16]
    else : @[RamSync.scala 32:20]
      when io.re : @[RamSync.scala 32:20]
        infer mport _T_21 = mem[io.ra], clock @[RamSync.scala 33:19]
        io.dout <= _T_21 @[RamSync.scala 33:13]
        skip @[RamSync.scala 32:20]
      else : @[RamSync.scala 34:15]
        io.dout <= UInt<1>("h00") @[RamSync.scala 35:13]
        skip @[RamSync.scala 34:15]
    
  module RamSync_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip re : UInt<1>, flip we : UInt<1>, flip ra : UInt<8>, flip wa : UInt<8>, flip di : UInt<128>, dout : UInt<128>}
    
    smem mem : UInt<128>[256] @[RamSync.scala 26:24]
    when io.we : @[RamSync.scala 28:16]
      infer mport _T_19 = mem[io.wa], clock @[RamSync.scala 29:8]
      _T_19 <= io.di @[RamSync.scala 29:16]
      io.dout <= UInt<1>("h00") @[RamSync.scala 30:13]
      skip @[RamSync.scala 28:16]
    else : @[RamSync.scala 32:20]
      when io.re : @[RamSync.scala 32:20]
        infer mport _T_21 = mem[io.ra], clock @[RamSync.scala 33:19]
        io.dout <= _T_21 @[RamSync.scala 33:13]
        skip @[RamSync.scala 32:20]
      else : @[RamSync.scala 34:15]
        io.dout <= UInt<1>("h00") @[RamSync.scala 35:13]
        skip @[RamSync.scala 34:15]
    
  module RamSync_2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip re : UInt<1>, flip we : UInt<1>, flip ra : UInt<8>, flip wa : UInt<8>, flip di : UInt<128>, dout : UInt<128>}
    
    smem mem : UInt<128>[256] @[RamSync.scala 26:24]
    when io.we : @[RamSync.scala 28:16]
      infer mport _T_19 = mem[io.wa], clock @[RamSync.scala 29:8]
      _T_19 <= io.di @[RamSync.scala 29:16]
      io.dout <= UInt<1>("h00") @[RamSync.scala 30:13]
      skip @[RamSync.scala 28:16]
    else : @[RamSync.scala 32:20]
      when io.re : @[RamSync.scala 32:20]
        infer mport _T_21 = mem[io.ra], clock @[RamSync.scala 33:19]
        io.dout <= _T_21 @[RamSync.scala 33:13]
        skip @[RamSync.scala 32:20]
      else : @[RamSync.scala 34:15]
        io.dout <= UInt<1>("h00") @[RamSync.scala 35:13]
        skip @[RamSync.scala 34:15]
    
  module RamSync_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip re : UInt<1>, flip we : UInt<1>, flip ra : UInt<8>, flip wa : UInt<8>, flip di : UInt<128>, dout : UInt<128>}
    
    smem mem : UInt<128>[256] @[RamSync.scala 26:24]
    when io.we : @[RamSync.scala 28:16]
      infer mport _T_19 = mem[io.wa], clock @[RamSync.scala 29:8]
      _T_19 <= io.di @[RamSync.scala 29:16]
      io.dout <= UInt<1>("h00") @[RamSync.scala 30:13]
      skip @[RamSync.scala 28:16]
    else : @[RamSync.scala 32:20]
      when io.re : @[RamSync.scala 32:20]
        infer mport _T_21 = mem[io.ra], clock @[RamSync.scala 33:19]
        io.dout <= _T_21 @[RamSync.scala 33:13]
        skip @[RamSync.scala 32:20]
      else : @[RamSync.scala 34:15]
        io.dout <= UInt<1>("h00") @[RamSync.scala 35:13]
        skip @[RamSync.scala 34:15]
    
  module DataMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip req : {write : UInt<1>, valid : UInt<1>, index : UInt<8>, wayIdx : UInt<4>}, flip wdata : UInt<32>[4], rdata : UInt<32>[4][4]}
    
    inst RamSync of RamSync @[DCache.scala 78:40]
    RamSync.clock <= clock
    RamSync.reset <= reset
    inst RamSync_1 of RamSync_1 @[DCache.scala 78:40]
    RamSync_1.clock <= clock
    RamSync_1.reset <= reset
    inst RamSync_2 of RamSync_2 @[DCache.scala 78:40]
    RamSync_2.clock <= clock
    RamSync_2.reset <= reset
    inst RamSync_3 of RamSync_3 @[DCache.scala 78:40]
    RamSync_3.clock <= clock
    RamSync_3.reset <= reset
    node _T_278 = eq(io.req.write, UInt<1>("h00")) @[DCache.scala 80:22]
    node _T_279 = and(_T_278, io.req.valid) @[DCache.scala 80:36]
    RamSync.io.re <= _T_279 @[DCache.scala 80:19]
    node _T_280 = and(io.req.write, io.req.valid) @[DCache.scala 81:36]
    node _T_281 = bits(io.req.wayIdx, 0, 0) @[DCache.scala 81:66]
    node _T_282 = and(_T_280, _T_281) @[DCache.scala 81:51]
    RamSync.io.we <= _T_282 @[DCache.scala 81:19]
    RamSync.io.ra <= io.req.index @[DCache.scala 82:19]
    RamSync.io.wa <= io.req.index @[DCache.scala 83:19]
    node _T_283 = cat(io.wdata[1], io.wdata[0]) @[DCache.scala 84:37]
    node _T_284 = cat(io.wdata[3], io.wdata[2]) @[DCache.scala 84:37]
    node _T_285 = cat(_T_284, _T_283) @[DCache.scala 84:37]
    RamSync.io.di <= _T_285 @[DCache.scala 84:19]
    node _T_286 = bits(RamSync.io.dout, 31, 0) @[DCache.scala 86:40]
    io.rdata[0][0] <= _T_286 @[DCache.scala 86:22]
    node _T_287 = bits(RamSync.io.dout, 63, 32) @[DCache.scala 86:40]
    io.rdata[0][1] <= _T_287 @[DCache.scala 86:22]
    node _T_288 = bits(RamSync.io.dout, 95, 64) @[DCache.scala 86:40]
    io.rdata[0][2] <= _T_288 @[DCache.scala 86:22]
    node _T_289 = bits(RamSync.io.dout, 127, 96) @[DCache.scala 86:40]
    io.rdata[0][3] <= _T_289 @[DCache.scala 86:22]
    node _T_291 = eq(io.req.write, UInt<1>("h00")) @[DCache.scala 80:22]
    node _T_292 = and(_T_291, io.req.valid) @[DCache.scala 80:36]
    RamSync_1.io.re <= _T_292 @[DCache.scala 80:19]
    node _T_293 = and(io.req.write, io.req.valid) @[DCache.scala 81:36]
    node _T_294 = bits(io.req.wayIdx, 1, 1) @[DCache.scala 81:66]
    node _T_295 = and(_T_293, _T_294) @[DCache.scala 81:51]
    RamSync_1.io.we <= _T_295 @[DCache.scala 81:19]
    RamSync_1.io.ra <= io.req.index @[DCache.scala 82:19]
    RamSync_1.io.wa <= io.req.index @[DCache.scala 83:19]
    node _T_296 = cat(io.wdata[1], io.wdata[0]) @[DCache.scala 84:37]
    node _T_297 = cat(io.wdata[3], io.wdata[2]) @[DCache.scala 84:37]
    node _T_298 = cat(_T_297, _T_296) @[DCache.scala 84:37]
    RamSync_1.io.di <= _T_298 @[DCache.scala 84:19]
    node _T_299 = bits(RamSync_1.io.dout, 31, 0) @[DCache.scala 86:40]
    io.rdata[1][0] <= _T_299 @[DCache.scala 86:22]
    node _T_300 = bits(RamSync_1.io.dout, 63, 32) @[DCache.scala 86:40]
    io.rdata[1][1] <= _T_300 @[DCache.scala 86:22]
    node _T_301 = bits(RamSync_1.io.dout, 95, 64) @[DCache.scala 86:40]
    io.rdata[1][2] <= _T_301 @[DCache.scala 86:22]
    node _T_302 = bits(RamSync_1.io.dout, 127, 96) @[DCache.scala 86:40]
    io.rdata[1][3] <= _T_302 @[DCache.scala 86:22]
    node _T_304 = eq(io.req.write, UInt<1>("h00")) @[DCache.scala 80:22]
    node _T_305 = and(_T_304, io.req.valid) @[DCache.scala 80:36]
    RamSync_2.io.re <= _T_305 @[DCache.scala 80:19]
    node _T_306 = and(io.req.write, io.req.valid) @[DCache.scala 81:36]
    node _T_307 = bits(io.req.wayIdx, 2, 2) @[DCache.scala 81:66]
    node _T_308 = and(_T_306, _T_307) @[DCache.scala 81:51]
    RamSync_2.io.we <= _T_308 @[DCache.scala 81:19]
    RamSync_2.io.ra <= io.req.index @[DCache.scala 82:19]
    RamSync_2.io.wa <= io.req.index @[DCache.scala 83:19]
    node _T_309 = cat(io.wdata[1], io.wdata[0]) @[DCache.scala 84:37]
    node _T_310 = cat(io.wdata[3], io.wdata[2]) @[DCache.scala 84:37]
    node _T_311 = cat(_T_310, _T_309) @[DCache.scala 84:37]
    RamSync_2.io.di <= _T_311 @[DCache.scala 84:19]
    node _T_312 = bits(RamSync_2.io.dout, 31, 0) @[DCache.scala 86:40]
    io.rdata[2][0] <= _T_312 @[DCache.scala 86:22]
    node _T_313 = bits(RamSync_2.io.dout, 63, 32) @[DCache.scala 86:40]
    io.rdata[2][1] <= _T_313 @[DCache.scala 86:22]
    node _T_314 = bits(RamSync_2.io.dout, 95, 64) @[DCache.scala 86:40]
    io.rdata[2][2] <= _T_314 @[DCache.scala 86:22]
    node _T_315 = bits(RamSync_2.io.dout, 127, 96) @[DCache.scala 86:40]
    io.rdata[2][3] <= _T_315 @[DCache.scala 86:22]
    node _T_317 = eq(io.req.write, UInt<1>("h00")) @[DCache.scala 80:22]
    node _T_318 = and(_T_317, io.req.valid) @[DCache.scala 80:36]
    RamSync_3.io.re <= _T_318 @[DCache.scala 80:19]
    node _T_319 = and(io.req.write, io.req.valid) @[DCache.scala 81:36]
    node _T_320 = bits(io.req.wayIdx, 3, 3) @[DCache.scala 81:66]
    node _T_321 = and(_T_319, _T_320) @[DCache.scala 81:51]
    RamSync_3.io.we <= _T_321 @[DCache.scala 81:19]
    RamSync_3.io.ra <= io.req.index @[DCache.scala 82:19]
    RamSync_3.io.wa <= io.req.index @[DCache.scala 83:19]
    node _T_322 = cat(io.wdata[1], io.wdata[0]) @[DCache.scala 84:37]
    node _T_323 = cat(io.wdata[3], io.wdata[2]) @[DCache.scala 84:37]
    node _T_324 = cat(_T_323, _T_322) @[DCache.scala 84:37]
    RamSync_3.io.di <= _T_324 @[DCache.scala 84:19]
    node _T_325 = bits(RamSync_3.io.dout, 31, 0) @[DCache.scala 86:40]
    io.rdata[3][0] <= _T_325 @[DCache.scala 86:22]
    node _T_326 = bits(RamSync_3.io.dout, 63, 32) @[DCache.scala 86:40]
    io.rdata[3][1] <= _T_326 @[DCache.scala 86:22]
    node _T_327 = bits(RamSync_3.io.dout, 95, 64) @[DCache.scala 86:40]
    io.rdata[3][2] <= _T_327 @[DCache.scala 86:22]
    node _T_328 = bits(RamSync_3.io.dout, 127, 96) @[DCache.scala 86:40]
    io.rdata[3][3] <= _T_328 @[DCache.scala 86:22]
    
