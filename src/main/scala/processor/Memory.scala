package processor
import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class Memory(initFile: String) extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(32.W))
    val instr = Output(UInt(32.W))
  })

  val mem = Mem(1024, UInt(32.W))
  io.instr := mem(io.addr(11, 2))
  loadMemoryFromFile(
    mem,
    initFile
  )
}
