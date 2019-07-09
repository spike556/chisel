
package nvdla

import chisel3._
import chisel3.util._
import ram._
import ConfigDCache._

/**
  *  1. Write Back & Write Allocate
  *  2. No Write Buffer (Blocking)
  *  3. No Pipelined
  *
  * */

class CacheTagType extends Bundle {
  val valid = Bool()
  val dirty = Bool()
  val tag = UInt((AWIDTH - setWidth - byteWidth).W)
}

class CacheReqType extends Bundle {
  val write = Bool()
  val valid = Bool()
  val index = UInt(setWidth.W)
  val wayIdx = UInt(nWay.W)     // one-hot encoding
}

class MasterReqType extends Bundle {
  val addr = UInt(AWIDTH.W)
  val data = UInt(DWIDTH.W)
  val write = Bool()
  val valid = Bool()
}

class MasterRespType extends Bundle {
  val data = UInt(DWIDTH.W)
  val ready = Bool()
}

class MemReqType extends Bundle {
  val addr = UInt(AWIDTH.W)
  val data = UInt(nBit.W)
  val write = Bool()
  val valid = Bool()
}

class MemRespType extends Bundle {
  val data = UInt(nBit.W)
  val ready = Bool()
}

class TagMem extends Module {
  val io = IO(new Bundle {
    val req = Input(new CacheReqType)
    val wdata = Input(new CacheTagType)
    val rdata = Output(Vec(nWay, new CacheTagType))
  })
  val tagMem = Array.fill(nWay)(Module(new RamSync(nSet, io.wdata.getWidth)).io)
  for (i <- tagMem.indices) {
    tagMem(i).re := !io.req.write & io.req.valid
    tagMem(i).we := io.req.write & io.req.valid & io.req.wayIdx(i)
    tagMem(i).ra := io.req.index
    tagMem(i).wa := io.req.index
    tagMem(i).di := io.wdata.asUInt()
    io.rdata(i).valid := tagMem(i).dout(io.wdata.getWidth - 1)
    io.rdata(i).dirty := tagMem(i).dout(io.wdata.getWidth - 2)
    io.rdata(i).tag := tagMem(i).dout(io.wdata.getWidth - 3, 0)
  }
}

class DataMem extends Module {
  val io = IO(new Bundle {
    val req = Input(new CacheReqType)
    val wdata = Input(Vec(dataPerLine, UInt(DWIDTH.W)))
    val rdata = Output(Vec(nWay, Vec(dataPerLine, UInt(DWIDTH.W))))
  })

  val dataMem = Array.fill(nWay)(Module(new RamSync(nSet, nBit)).io)
  for (i <- dataMem.indices) {
    dataMem(i).re := !io.req.write & io.req.valid
    dataMem(i).we := io.req.write  & io.req.valid & io.req.wayIdx(i)
    dataMem(i).ra := io.req.index
    dataMem(i).wa := io.req.index
    dataMem(i).di := io.wdata.asUInt()
    for (j <- 0 until dataPerLine) {
      io.rdata(i)(j) := dataMem(i).dout(DWIDTH * (j + 1) - 1, DWIDTH * j)
    }
  }
}

class DCache extends Module {
  val io = IO(new Bundle {
    val masterReq = Input(new MasterReqType)
    val masterResp = Output(new MasterRespType)
    val memReq = Output(new MemReqType)
    val memResp = Input(new MemRespType)
    // performance counter
    val hitCnt = Output(UInt(32.W))
    val missCnt = Output(UInt(32.W))
  })

  // address decode
  val masterTag = io.masterReq.addr(AWIDTH - 1, setWidth + byteWidth)
  val masterIndex = io.masterReq.addr(setWidth + byteWidth - 1, byteWidth)
  val masterByteIdx = io.masterReq.addr(byteWidth - 1, 0)

  val tagReq = Wire(new CacheReqType)
  val tagWriteValue = WireInit(0.U((AWIDTH - setWidth - byteWidth + 2).W).asTypeOf(new CacheTagType))
  val tagReadValue = VecInit(Seq.fill(nWay)(0.U((AWIDTH - setWidth - byteWidth + 2).W).asTypeOf(new CacheTagType)))
  val dataReq = Wire(new CacheReqType)
  val dataWriteValue = VecInit(Seq.fill(dataPerLine)(0.U(DWIDTH.W)))
  val dataReadValue = VecInit(Seq.fill(nWay)(VecInit(Seq.fill(dataPerLine)(0.U(DWIDTH.W)))))

  // initialize interface
  tagReq.index := masterIndex
  tagReq.valid := io.masterReq.valid
  tagReq.wayIdx := Fill(nWay, 1.U(1.W))
  tagReq.write := 0.U
  dataReq.index := masterIndex
  dataReq.valid := io.masterReq.valid
  dataReq.wayIdx := Fill(nWay, 1.U(1.W))
  dataReq.write := 0.U


  // tag mem instantiation
  val tagMemInst = Module(new TagMem)
  tagMemInst.io.req := tagReq
  tagMemInst.io.wdata := tagWriteValue
  tagReadValue := tagMemInst.io.rdata

  // data mem instantiation
  val dataMemInst = Module(new DataMem)
  dataMemInst.io.req := dataReq
  dataMemInst.io.wdata := dataWriteValue
  dataReadValue := dataMemInst.io.rdata

  // hit
  val tagValidHitsVec = VecInit(Seq.fill(nWay)(0.U(1.W)))
  for (i <- tagValidHitsVec.indices) {
    tagValidHitsVec(i) := (tagReadValue(i).tag === masterTag) && (tagReadValue(i).valid === 1.U)
  }   // one hot
  val tagValidHits = tagValidHitsVec.asUInt()

  // output initialization

  // to master
  io.masterResp.ready := 0.U
  val masterRespDataFlat = (0 until nWay).map(i => Mux(tagValidHits(i), 0.U, dataReadValue(i).asUInt())).reduce(_ | _)
  val masterRespData = VecInit(Seq.fill(dataPerLine)(0.U(DWIDTH.W)))
  // refactor flat => Vec
  for (i <- 0 until dataPerLine) {
    masterRespData(i) := masterRespDataFlat(DWIDTH * (i + 1) - 1, DWIDTH * i)
  }
  // idx of data in one line
  val dataIdx = io.masterReq.addr(bytePerDataWidth + dataPerLineWidth - 1, bytePerDataWidth)
  io.masterResp.data := masterRespData(dataIdx)

  // to memory
  io.memReq.addr := Cat(io.masterReq.addr(AWIDTH - 1, byteWidth), 0.U(byteWidth.W))
  io.memReq.data := masterRespData.asUInt()
  io.memReq.write := 0.U
  io.memReq.valid := 0.U

  dataWriteValue := masterRespData
  dataWriteValue(dataIdx) := io.masterReq.data

  // FSM
  val stateIdle :: stateCompare :: stateReplace :: stateWriteback :: stateAllocate :: Nil = Enum(5)
  val state = RegInit(stateIdle)
  val nextState = WireInit(stateIdle)
  state := nextState
  val replaceWay = RegInit(0.U(wayWidth.W))
  val fifoin = Wire(Decoupled(UInt(nWay.W)))
  fifoin.valid := 0.U
  fifoin.bits := tagValidHits
  val fifo = Queue(fifoin, nWay)
  fifo.nodeq()
  val needWriteBack = tagReadValue(replaceWay).valid && tagReadValue(replaceWay).dirty

  // performance counter
  val hitCnt = RegInit(0.U(32.W))
  val missCnt = RegInit(0.U(32.W))
  io.hitCnt := hitCnt
  io.missCnt := missCnt

  switch(state) {
    is(stateIdle) {
      nextState := Mux(io.masterReq.valid, stateCompare, stateIdle)
    }
    is(stateCompare) {
      when(tagValidHits.orR) {       // should be only one 1's bit
        io.masterResp.ready := 1.U
        // update fifo
        fifoin.valid := 1.U
        when(io.masterReq.write === 1.U) {
          // write hit
          // write tag
          tagReq.write := 1.U
          tagReq.wayIdx := tagValidHits
          tagWriteValue.valid := 1.U
          tagWriteValue.dirty := 1.U
          tagWriteValue.tag := (0 until nWay).map(i => Mux(tagValidHits(i), 0.U, tagReadValue(i).tag)).reduce(_ | _)
          // write data
          dataReq.write := 1.U
          dataReq.wayIdx := tagValidHits
        } .otherwise {
          // read hit, should do nothing
        }
        nextState := stateIdle
        hitCnt := hitCnt + 1.U
      } .otherwise {
        // TODO: implement FIFO
        replaceWay := fifo.deq()           // only one register in this switch block
        nextState := stateReplace
        missCnt := missCnt + 1.U
        }
    }
    is(stateReplace) {
      // write miss && read miss
      tagReq.write := 1.U
      tagReq.wayIdx := replaceWay
      tagWriteValue.valid := 1.U
      tagWriteValue.dirty := 1.U
      tagWriteValue.tag := masterTag
      io.memReq.valid := 1.U
      when(needWriteBack) {
        io.memReq.write := 1.U
        io.memReq.addr := Cat(tagReadValue(replaceWay).tag, io.masterReq.addr(setWidth + byteWidth - 1, byteWidth), 0.U(byteWidth.W))
        nextState := stateWriteback
      } .otherwise {
        nextState := stateAllocate
      }
    }
    is(stateAllocate) {
      when(io.memResp.ready) {
        dataReq.write := 1.U
        dataReq.wayIdx := replaceWay
        fifoin.valid := 1.U
        // refactor flat => Vec
        for (i <- 0 until dataPerLine) {
          dataWriteValue(i) := io.memResp.data(DWIDTH * (i + 1) - 1, DWIDTH * i)
        }
        hitCnt := hitCnt - 1.U
        nextState := stateCompare
      }
    }
    is(stateWriteback) {
      when(io.memResp.ready) {
        io.memReq.valid := 1.U  // read
        nextState := stateAllocate
      }
    }
  }

}

object elaboratedataDCache extends App {
  chisel3.Driver.execute(args, () => new DCache())
}