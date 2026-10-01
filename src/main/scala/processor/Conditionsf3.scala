import chisel3._
object Conditionsf3 {
  val BEQ = 0.U(3.W)
  val BNE = 1.U(3.W)
  val SLT = 2.U(3.W)
  val SLTU = 3.U(3.W)
  val BLT = 4.U(3.W)
  val BGE = 5.U(3.W)
  val BLTU = 6.U(3.W)
  val BGEU = 7.U(3.W)
}
