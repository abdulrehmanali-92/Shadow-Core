package processor
import chisel3._
import chisel3.util._
import processor._
import chisel3.util.experimental.loadMemoryFromFile

class Pipelining(initFile: String) extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(96.W))
    val debug_pc = Output(UInt(32.W))
    val debug_regs = Output(Vec(32, SInt(32.W)))
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

  memory.io.addr := pc.io.addr
  val if_id_reg = RegNext(
    Cat(
      memory.io.instr, // 64-95       Instruction
      pc.io.pc_out, // 32-63          PC+4
      pc.io.addr // 0-31              PC
    )
  )
  // DECODE
  controller.io.opcode := if_id_reg(70, 64) // Instruction(6, 0)  -- Opcode
  reg_file.io.id_in.reg_src_a := if_id_reg(
    83,
    79
  ) // Instruction(19, 15)  -- RS1
  reg_file.io.id_in.reg_src_b := if_id_reg(
    88,
    84
  ) // Instruction(24, 20)  -- RS2
  imm_gen.io.instr := if_id_reg(95, 64) //    Instruction
  imm_gen.io.pc := if_id_reg(31, 0) //        PC
  val id_ex_reg = RegNext(
    Cat(
      if_id_reg(31, 0), // 150-181                   PC
      if_id_reg(63, 32), // 118-149                  PC+4
      controller.io.out.reg_write, // 117            Reg Write
      controller.io.out.mem_write, // 116            Mem Write
      controller.io.out.mem_read, // 115             Mem Read
      controller.io.out.mem_to_reg, // 114           Mem To Regsiter
      controller.io.out.operand_a, // 112-113        Operand A Sel
      controller.io.out.operand_b, // 111            Operand B Sel
      controller.io.out.branch, // 110               Branch
      controller.io.out.next_pc, // 108-109          Next PC
      controller.io.out.alu_op, // 105-107           ALU OP
      reg_file.io.read_data_1.asUInt(), // 73-104    Read Data 1
      reg_file.io.read_data_2.asUInt(), // 41-72     Read Data 2
      if_id_reg(75, 71), // 36-40                    RD
      MuxLookup(
        controller.io.out.extend_sel,
        false.B,
        Seq(
          (0.U) -> (imm_gen.io.out.i_type),
          (1.U) -> (imm_gen.io.out.s_type),
          (2.U) -> (imm_gen.io.out.u_type),
          (3.U) -> 0.S
        )
      ).asUInt(), // 4-35                            immediate
      if_id_reg(78, 76), // 1-3                      func3
      if_id_reg(94) // 0                             func7
    )
  )

  // Execute
  alu.io.operand_a := MuxLookup(
    id_ex_reg(113, 112), // operand a sel
    0.U(32.W),
    Seq(
      (0.U) -> id_ex_reg(104, 73).asSInt, // Read Data 1
      (1.U) -> id_ex_reg(181, 150).asSInt, // PC
      (2.U) -> id_ex_reg(149, 118).asSInt, // PC + 4
      (3.U) -> id_ex_reg(104, 73).asSInt // Read Data 1
    )
  )
  alu.io.operand_b := Mux(
    id_ex_reg(111), // operand b sel
    id_ex_reg(35, 4).asSInt, // Immediate
    id_ex_reg(72, 41).asSInt // Read Data 2
  )

  alu_ctrl.io.func.func3 := id_ex_reg(3, 1) // func3
  alu_ctrl.io.func.func7 := id_ex_reg(0) // func7
  alu_ctrl.io.in.ALUOp := id_ex_reg(107, 105) // ALU OP

  alu.io.alu_op := alu_ctrl.io.out.alu_op

  jalr_adder.io.jalr := id_ex_reg(35, 4).asSInt // Immediate
  jalr_adder.io.read_data_1 := id_ex_reg(104, 73).asSInt // Read Data 1

  val ex_mem_reg = RegNext(
    Cat(
      id_ex_reg(181, 150), // 173-204  PC
      id_ex_reg(149, 118), // 141-172  PC+4
      id_ex_reg(117), // 140           Reg_Write
      id_ex_reg(116), // 139           Mem_Write
      id_ex_reg(115), // 138           Mem_Read
      id_ex_reg(114), // 137           Mem_to_Reg
      id_ex_reg(110), // 136           Branch
      id_ex_reg(109, 108), // 134-135  Next PC
      id_ex_reg(72, 41).asUInt, // 102-133      RS2
      id_ex_reg(40, 36), // 97-101      RD
      id_ex_reg(35, 4).asUInt, // 65-96         Immediate
      jalr_adder.io.computed_addr.asUInt, // 33-64  Jalr Address
      alu.io.branch, // 32          Branch
      alu.io.data.asUInt // 0-31  ALU Output
    )
  )
  // Memory

  pc.io.pc_in := MuxLookup(
    ex_mem_reg(135, 134),
    0.U(32.W),
    Seq(
      (0.U) -> ex_mem_reg(172, 141), //  PC + 4
      (1.U) -> ex_mem_reg(96, 65), //  Immediate
      (2.U) -> ex_mem_reg(64, 33), //  JALR Address
      (3.U) -> Mux(
        ex_mem_reg(32),
        ex_mem_reg(96, 65),
        ex_mem_reg(172, 141)
      ) //  Branch
    )
  )

  data_mem.io.in.data_in := ex_mem_reg(133, 102).asSInt
  data_mem.io.in.addr := ex_mem_reg(31, 0)
  data_mem.io.in.mem_read := ex_mem_reg(138)
  data_mem.io.in.mem_write := ex_mem_reg(139)

  val mem_wb_reg = RegNext(
    Cat(
      ex_mem_reg(31, 0).asUInt, // 39-70      ALU Output
      data_mem.io.data.asUInt, // 7-38        Mem_Data
      ex_mem_reg(140), // 6                   Reg Write
      ex_mem_reg(137), // 5                   Mem_to_Reg
      ex_mem_reg(101, 97) // 0-4              RD
    )
  )

  // Write Back

  reg_file.io.reg_write := mem_wb_reg(6)
  reg_file.io.id_in.reg_dest := mem_wb_reg(4, 0)
  reg_file.io.data := Mux(
    mem_wb_reg(5),
    mem_wb_reg(38, 7).asSInt,
    mem_wb_reg(70, 39).asSInt
  )

  io.out := if_id_reg
  io.debug_pc := pc.io.addr
  io.debug_regs := reg_file.io.debug_regs

}
