package processor
import chisel3._

class PC extends Module {
  val io = IO(new Bundle {
    val pc_in = Input(UInt(32.W))
    val pc_out = Output(UInt(32.W))
    val addr = Output(UInt(32.W))
  })

  val reg = RegNext(0.U(32.W))
  reg := io.pc_in
  io.pc_out := reg + 4.U
  io.addr := reg

}
