package processor
import chisel3._
import chisel3.util._
import Opcode._

class ImmGenOutput extends Bundle {
  val i_type = Output(SInt(32.W))
  val s_type = Output(SInt(32.W))
  val sb_type = Output(SInt(32.W))
  val u_type = Output(SInt(32.W))
  val uj_type = Output(SInt(32.W))

}
class ImmGen extends Module {
  val io = IO(new Bundle {
    val instr = Input(UInt(32.W))
    val out = new ImmGenOutput
  })

  io.out.i_type := Cat(
    Fill(20, Mux(io.instr(31), 1.U, 0.U)),
    io.instr(31, 20)
  ).asSInt

  io.out.s_type := Cat(
    Fill(20, Mux(io.instr(31), 1.U, 0.U)),
    io.instr(31, 25),
    io.instr(11, 7)
  ).asSInt

  io.out.sb_type := Cat(
    Fill(20, Mux(io.instr(31), 1.U, 0.U)),
    io.instr(31),
    io.instr(7),
    io.instr(30, 25),
    io.instr(11, 8),
    0.U
  ).asSInt

  io.out.u_type := Cat(io.instr(31, 12), Fill(12, 0.U)).asSInt

  io.out.uj_type := Cat(
    Fill(12, Mux(io.instr(31), 1.U, 0.U)),
    io.instr(19, 12),
    io.instr(20),
    io.instr(30, 21),
    0.U
  ).asSInt
}
