package processor
import chisel3._

class RegFileInputs extends Bundle {
  val data = Input(SInt(32.W))
}

class RegFileOutputs extends Bundle {}

class RegisterFile extends Module {
  val io = IO(new Bundle {
    val id_in = Flipped(new InstrDecoder_RegFile_interface)
    val reg_write = Input(Bool())
    val data = Input(SInt(32.W))
    val read_data_1 = Output(SInt(32.W))
    val read_data_2 = Output(SInt(32.W))

  })
  val RegFile = Reg(Vec(32, SInt(32.W)))

  io.read_data_1 := Mux(
    (io.id_in.reg_src_a.orR),
    RegFile(io.id_in.reg_src_a),
    0.S
  )
  io.read_data_2 := Mux(
    (io.id_in.reg_src_b.orR),
    RegFile(io.id_in.reg_src_b),
    0.S
  )

  when(io.reg_write & io.id_in.reg_dest.orR) {
    RegFile(io.id_in.reg_dest) := io.data
  }

}
