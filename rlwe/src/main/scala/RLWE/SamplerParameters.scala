
package RLWE

trait HasSamplerParameters {
  // datawidth for binomial
  // support k = 1, 2, 4, 8, 16
  // val k = 8
  // val Bound = (0x3001 * (1 << (0 + 2 + 4 + 6 + 8 + 10))) << 8
  // val Bound = 0xfff0010

  // number of Sampler
  val SamplerNum = 32
}
