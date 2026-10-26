package processor
import chisel3._
import chisel3.util._
import processor._
import chisel3.util.experimental.loadMemoryFromFile

class Pipelining(initFile: String) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(96.W))
  })

  val pc = Module(new PC)
  val reg_file = Module(new RegisterFile)
  val memory = Module(new Memory(initFile))
  val controller = Module(new Controller)
  val imm_gen = Module(new ImmGenWithAdder)
  val alu = Module(new ALU)
  val alu_ctrl = Module(new ALUControl)
  val data_mem = Module(new DataMem)
  // val instr_decoder = Module(new InstrDecoder)
  val jalr_adder = Module(new JALRAdder)

  // FETCH
  pc.io.pc_in := pc.io.pc_out
  memory.io.addr := pc.io.addr
  val if_id_reg = RegNext(0.U(96.W))
  if_id_reg := Cat(
    memory.io.instr,
    pc.io.pc_out,
    pc.io.addr
  ) //  instr  +  pc+4  +  pc

  // DECODE
  controller.io.opcode := if_id_reg(70, 64)
  reg_file.io.id_in.reg_src_a := if_id_reg(83, 79)
  reg_file.io.id_in.reg_src_b := if_id_reg(88, 84)
  imm_gen.io.instr := if_id_reg(95, 64)
  imm_gen.io.pc := if_id_reg(31, 0)
  val id_ex_reg = RegNext(0.U(181.W))
  id_ex_reg := Cat(
    pc.io.addr, // 150-181
    pc.io.pc_out, // 118-149
    controller.io.out.reg_write, // 117
    controller.io.out.mem_write, // 116
    controller.io.out.mem_read, // 115
    controller.io.out.mem_to_reg, // 114
    controller.io.out.operand_a, // 112-113
    controller.io.out.operand_b, // 111
    controller.io.out.branch, // 110
    controller.io.out.next_pc, // 108-109
    controller.io.out.alu_op, // 105-107
    reg_file.io.read_data_1.asUInt(), // 73-104
    reg_file.io.read_data_2.asUInt(), // 41-72
    if_id_reg(75, 71), // 36-40      RD
    MuxLookup( // 4-35
      controller.io.out.extend_sel,
      false.B,
      Seq(
        (0.U) -> (imm_gen.io.out.i_type),
        (1.U) -> (imm_gen.io.out.s_type),
        (2.U) -> (imm_gen.io.out.u_type),
        (3.U) -> 0.S
      )
    ).asUInt(), // immediate
    if_id_reg(78, 76), // func3                  // 1-3
    if_id_reg(30) // func7                       // 0

  )
  // pc + pc_4 + reg_wrt + mem_wrt + mem_read + mem_to_reg + operand_a + operand_b + branch + next_pc + alu_op + read1 + read2 + rd + immediate + func3 + func7

  // Execute
  alu.io.operand_a := MuxLookup(
    id_ex_reg(113, 112),
    false.B,
    Seq(
      (0.U) -> id_ex_reg(104, 73),
      (1.U) -> id_ex_reg(181, 150),
      (2.U) -> id_ex_reg(149, 118),
      (3.U) -> id_ex_reg(104, 73)
    )
  )
  alu.io.operand_b := Mux(
    id_ex_reg(111),
    id_ex_reg(35, 4),
    id_ex_reg(72, 41)
  )

  alu_ctrl.io.func.func3 := id_ex_reg(78, 76)
  alu_ctrl.io.func.func7 := id_ex_reg(75)
  alu_ctrl.io.in.ALUOp := id_ex_reg(107, 105)

  jalr_adder.io.jalr := id_ex_reg(35, 4)
  jalr_adder.io.read_data_1 := id_ex_reg(104, 73)

  val ex_mem_reg = RegNext(0.U(205.W))
  ex_mem_reg := Cat(
    id_ex_reg(181, 150), // 173-204  PC
    id_ex_reg(149, 118), // 141-172  PC+4
    id_ex_reg(117), // 140           Reg_Write
    id_ex_reg(116), // 139           Mem_Write
    id_ex_reg(115), // 138           Mem_Read
    id_ex_reg(114), // 137           Mem_to_Reg
    id_ex_reg(110), // 136           Branch
    id_ex_reg(109, 108), // 134-135  Next PC
    id_ex_reg(72, 41), // 102-133      RS2
    id_ex_reg(40, 36), // 97-101      RD
    id_ex_reg(35, 4), // 65-96         Immediate
    jalr_adder.io.computed_addr.asUInt(), // 33-64  Jalr Address
    alu.io.branch, // 32          Branch
    alu.io.data.asUInt() // 0-31  ALU Output
  )

  // Memory

  pc.io.pc_in := MuxLookup(
    ex_mem_reg(135, 134),
    0.U,
    Seq(
      (0.U) -> ex_mem_reg(149, 118),
      (1.U) -> ex_mem_reg(96, 65),
      (2.U) -> ex_mem_reg(64, 33),
      (3.U) -> Mux(ex_mem_reg(32), ex_mem_reg(96, 65), ex_mem_reg(149, 118))
    )
  )

  data_mem.io.in.data_in := ex_mem_reg(133, 102).asSInt
  data_mem.in.addr := ex_mem_reg(31, 0)
  data_mem.mem_read := ex_mem_reg(138)
  data_mem.mem_write := ex_mem_reg(139)

  // val mem_wb_reg = RegNext(0.U(70.W))
  // mem_wb_reg := Cat(
  //   ex_mem_reg(31, 0).asUInt,   //39-70
  //   data_mem.io.data.asUInt,    //7-38
  //   ex_mem_reg(137),     //6
  //   ex_mem_reg(101, 97)  //0-5
  // )

  io.out := if_id_reg

}
