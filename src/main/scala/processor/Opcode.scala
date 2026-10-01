package processor
import chisel3._

object Opcode {
  val R = 51.U(7.W)
  val I = 19.U(7.W)
  val S = 35.U(7.W)
  val LOAD = 3.U(7.W)
  val SB = 99.U(7.W)
  val AUIPC = 23.U(7.W)
  val LUI = 55.U(7.W)
  val UJ = 111.U(7.W)
  val JALR = 103.U(7.W)
}
