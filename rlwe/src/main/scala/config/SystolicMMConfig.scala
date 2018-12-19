
package config
import chisel3._
import chisel3.util._

package SystolicMMConfig {
  object poly {
    val g =  Cat(Fill(155,0.U(1.W)), "hc9".U(8.W))
  }
}
