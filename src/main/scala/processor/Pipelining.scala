package processor
import chisel3._
import processor._

class Pipelining(initFIle: String) extends Module {
  val io = IO(new Byndle {
    val out = Output(UInt(32.W))
  })
  
  val pc = Module(new PC)
  val reg_file = Module(new RegisterFile)
  val memory = Module(new Memory(initFile))
  val controller = Module(new Controller)
  val imm_gen = Module(new ImmGen)
  val alu = Module(new ALU)
  val alu_ctrl = Module(new ALUControl)
  val data_mem = Module(new DataMem)
  val instr_decoder = Module(new InstrDecoder)
  val jalr_adder = Module(new JALRAdder)

}
