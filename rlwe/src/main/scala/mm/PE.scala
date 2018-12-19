
package mm

import chisel3._

class PE (digitLen: Int, regout: Boolean = true) extends Module{
  val io = IO(new Bundle() {
    val a = Input(UInt(163.W))
    val p = Input(UInt(163.W))
    val bi = Input(UInt(digitLen.W))
    val aout = Output(UInt(163.W))
    val pout = Output(UInt(163.W))
  })

  val bits = VecInit(Seq.fill(digitLen)(Module(new OneBit()).io))

  for (i <- 0 until digitLen) {
    if (i == 0) {
      bits(i).a := io.a
      bits(i).p := io.p
      bits(i).bi := io.bi(i)
    } else {
      bits(i).a := bits(i - 1).aout
      bits(i).p := bits(i - 1).pout
      bits(i).bi := io.bi(i)
    }
  }

  if (regout) {
    io.aout := RegNext(bits(digitLen - 1).aout)
    io.pout := RegNext(bits(digitLen - 1).pout)
  }
  else {
    io.aout := bits(digitLen - 1).aout
    io.pout := bits(digitLen - 1).pout
  }

}

object elaboratePE extends App {
  chisel3.Driver.execute(args, () => new PE(16))
}

//object elaboratePE{
//  println(getVerilog())
//}