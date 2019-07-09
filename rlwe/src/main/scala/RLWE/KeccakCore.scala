
package RLWE

import chisel3._
import chisel3.util._

/**
  *
  *  Author       :   Guozhu Xin
  *  Date         :   2019/07/09
  *  Contact      :   spikexin@outlook.com
  *  Description  :   implement Keccakc, that is Keccak-p[1600,24]
  *                   look FIPS PUB 202 for more information
  *
**/

/**
  *
  *   index = (y,x,z)
  *
**/
class stateArray extends Bundle {
  val s = Vec(5, Vec(5, (UInt(64.W))))
}


class ProcIO extends Bundle
  with HasKeccakParameters {
  val in = Input(new stateArray())
  val out = Output(new stateArray())
}

class Proc1 extends Module
  with HasKeccakParameters {
  val io = IO(new ProcIO)

  val state = io.in.s
  val columnsXorSqueez = WireInit(VecInit(Seq.fill(5)(VecInit(Seq.fill(64)(false.B)))))
  // step 1
  for (x <- 0 until 5) {
    for (z <- 0 until 64) {
      columnsXorSqueez(x)(z) := (0 until 5).map(y => state(y)(x)(z)).reduce(_ ^ _)
    }
  }
  val columnsXorInter = WireInit(VecInit(Seq.fill(5)(VecInit(Seq.fill(64)(false.B)))))
  // step 2
  for (x <- 0 until 5) {
    for (z <- 0 until 64) {
      columnsXorInter(x)(z) := columnsXorSqueez(mod(x - 1, 5))(z) ^ columnsXorSqueez(mod(x + 1, 5))(mod(z - 1, 64))
    }
  }
  // step 3
  for (y <- 0 until 5) {
    for (x <- 0 until 5) {
      io.out.s(y)(x) := state(y)(x) ^ columnsXorInter(x).asUInt()
    }
  }
}
object elaborateProc1 extends App {
  chisel3.Driver.execute(args, () => new Proc1())
}

class Proc2 extends Module
  with HasKeccakParameters {
  val io = IO(new ProcIO())

  val state = io.in.s
  for (y <- 0 until 5) {
    for (x <- 0 until 5) {
      var shamt = mod(proc2param(y)(x), 64)
      if (shamt == 0) {
        io.out.s(y)(x) := state(y)(x)
      } else {
        io.out.s(y)(x) := Cat(state(y)(x)(63 - shamt, 0), state(y)(x)(63, 64 - shamt))
      }
    }
  }
}
object elaborateProc2 extends App {
  chisel3.Driver.execute(args, () => new Proc2())
}

class Proc3 extends Module
  with HasKeccakParameters {
  val io = IO(new ProcIO())

  val state = io.in.s
  for (y <- 0 until 5) {
    for (x <- 0 until 5) {
      io.out.s(y)(x) := state(x)(mod(x + 3 * y, 5))
    }
  }
}
object elaborateProc3 extends App {
  chisel3.Driver.execute(args, () => new Proc3())
}

class Proc4 extends Module
  with HasKeccakParameters {
  val io = IO(new ProcIO())

  val state = io.in.s
  for (y <- 0 until 5) {
    for (x <- 0 until 5) {
      io.out.s(y)(x) := (~state(y)(mod(x + 1, 5)) & state(y)(mod(x + 2, 5))) ^ state(y)(x)
    }
  }
}
object elaborateProc4 extends App {
  chisel3.Driver.execute(args, () => new Proc4())
}

class Proc5(ir: Int) extends Module
  with HasKeccakParameters {
  val io = IO(new ProcIO())

  val state = io.in.s
  val RC = WireInit(VecInit(Seq.fill(64)(false.B)))
  for (j <- 0 to 6) {
    RC((1 << j) - 1) := rc(j + ir * 7).asUInt()
  }
  val nextState = Wire(new stateArray())
  nextState.s := state
  nextState.s(0)(0) := state(0)(0) ^ RC.asUInt()
  io.out.s := nextState.s
}
object elaborateProc5 extends App {
  chisel3.Driver.execute(args, () => new Proc5(0))
}



class KeccakCoreIO extends Bundle
  with HasKeccakParameters {
  val mode = Input(UInt(3.W))
  val seed = Input(UInt(ArrayLength.W))
  val inputValid = Input(Bool())
  // output length for XOF
  val d = Input(UInt((log2Ceil(MaxXOFLength) + 1).W))
  val prngNumber = Output(UInt(DataOutLength.W))
  val outputValid = Output(Bool())
}

class KeccakCore extends Module
  with HasKeccakParameters {
  val io = IO(new KeccakCoreIO())

  io.prngNumber := 0.U(DataOutLength.W)
  io.outputValid := false.B

  // secret seed
  val stateReg = RegInit(0.U(ArrayLength.W))
  when(io.inputValid) {
    stateReg := io.seed
  }

  // parameter settings

  // default set to SHA224
  val capacity = WireInit(448.U(11.W))
  val outLength = WireInit(224.U((log2Ceil(MaxXOFLength) + 1)))

  switch(io.mode) {
    is(SHA224Mode.asUInt()) {}
    is(SHA256Mode.asUInt()) {
      capacity := 512.U
      outLength := 256.U
    }
    is(SHA384Mode.asUInt()) {
      capacity := 768.U
      outLength := 384.U
    }
    is(SHA512Mode.asUInt()) {
      capacity := 1024.U
      outLength := 512.U
    }
    is(SHAKE128Mode.asUInt()) {
      capacity := 256.U
      outLength := io.d
    }
    is(SHAKE256Mode.asUInt()) {
      capacity := 512.U
      outLength := io.d
    }
  }


}

object elaborateKeccak extends App {
  chisel3.Driver.execute(args, () => new KeccakCore())
}
