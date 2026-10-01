error id: file://<WORKSPACE>/src/main/scala/processor/Top.scala:processor/PC#io.
file://<WORKSPACE>/src/main/scala/processor/Top.scala
empty definition using pc, found symbol in pc: 
found definition using semanticdb; symbol processor/PC#io.
empty definition using fallback
non-local guesses:

offset: 2510
uri: file://<WORKSPACE>/src/main/scala/processor/Top.scala
text:
```scala
package processor
import chisel3._
import processor._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class Top(initFile: String) extends Module {

  val io = IO(new Bundle {
    val out = Output(UInt(32.W))
    val instr = Output(UInt(32.W))
  })
  io.out := 0.U

  val pc = Module(new PC)
  val reg_file = Module(new RegisterFile)
  // val memory = Module(new Memory(initFile))
  val controller = Module(new Controller)
  val imm_gen = Module(new ImmGen)
  val alu = Module(new ALU)
  val alu_ctrl = Module(new ALUControl)
  val data_mem = Module(new SyncDataMem)
  val instr_decoder = Module(new InstrDecoder)
  val jalr_adder = Module(new JALRAdder)

  val mem = Mem(1024, UInt(32.W))
  io.instr := mem(pc.io.addr(11, 2))
  loadMemoryFromFile(
    mem,
    initFile
  )

  // PC --> Instruction Memory
  // pc.io.addr <> memory.io.addr

  // Instruction Memory --> Instruction Decoder
  instr_decoder.io.instr := io.instr

  // Instruction Decoder --> Controller
  instr_decoder.io.opcode <> controller.io.opcode

  // Instruction Decoder --> Register File
  instr_decoder.io.rf_out <> reg_file.io.id_in

  // Insruction Decoder --> Immediate Generater
  imm_gen.io.instr := instr_decoder.io.instr

  // Instruction Decoder --> ALU Control
  instr_decoder.io.ac_out <> alu_ctrl.io.func

  // ALU Operand A
  alu.io.operand_a := MuxLookup(
    controller.io.out.operand_a,
    false.B,
    Seq(
      (0.U) -> reg_file.io.read_data_1,
      (1.U) -> pc.io.addr.asSInt,
      (2.U) -> pc.io.pc_out.asSInt,
      (3.U) -> reg_file.io.read_data_1
    )
  )

  // ALU Operand B
  alu.io.operand_b := Mux(
    controller.io.out.operand_b,
    MuxLookup(
      controller.io.out.extend_sel,
      false.B,
      Seq(
        (0.U) -> (imm_gen.io.out.i_type),
        (1.U) -> (imm_gen.io.out.s_type),
        (2.U) -> (imm_gen.io.out.u_type),
        (3.U) -> 0.S
      )
    ),
    reg_file.io.read_data_2
  )

  // ALU Operation
  alu_ctrl.io.in.ALUOp := controller.io.out.alu_op
  alu.io.alu_op := alu_ctrl.io.out.alu_op

  // Data Memory
  data_mem.io.in.addr := alu.io.data.asUInt
  data_mem.io.in.data_in := reg_file.io.read_data_2
  data_mem.io.in.mem_read := controller.io.out.mem_read
  data_mem.io.in.mem_write := controller.io.out.mem_write

  // Adder for jalr
  jalr_adder.io.read_data_1 := reg_file.io.read_data_1
  jalr_adder.io.jalr := imm_gen.io.out.i_type

  // Next PC
  pc.io.pc_in := MuxLookup(
    controller.io.out.next_pc,
    0.U,
    Seq(
      (0.U) -> (pc.io@@.pc_out).asUInt,
      (1.U) -> (imm_gen.io.out.uj_type).asUInt,
      (2.U) -> (jalr_adder.io.computed_addr).asUInt,
      (3.U) -> (Mux(
        (alu.io.branch & controller.io.out.branch),
        imm_gen.io.out.sb_type,
        pc.io.pc_out.asSInt
      )).asUInt
    )
  )

  // Write Back
  reg_file.io.data := Mux(
    controller.io.out.mem_to_reg,
    data_mem.io.data,
    alu.io.data
  )

  reg_file.io.reg_write := controller.io.out.reg_write
}

```


#### Short summary: 

empty definition using pc, found symbol in pc: 