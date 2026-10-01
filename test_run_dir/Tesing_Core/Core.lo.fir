circuit Core :
  module PC :
    input clock : Clock
    input reset : UInt<1>
    input io_pc_in : UInt<32>
    output io_pc_out : UInt<32>
    output io_addr : UInt<32>

    reg reg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), reg) @[PC.scala 11:20]
    node _io_pc_out_T = add(reg, UInt<3>("h4")) @[PC.scala 13:20]
    node _io_pc_out_T_1 = tail(_io_pc_out_T, 1) @[PC.scala 13:20]
    io_pc_out <= _io_pc_out_T_1 @[PC.scala 13:13]
    io_addr <= reg @[PC.scala 14:11]
    reg <= io_pc_in @[PC.scala 12:7]

  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_id_in_reg_src_a : UInt<5>
    input io_id_in_reg_src_b : UInt<5>
    input io_id_in_reg_dest : UInt<5>
    input io_reg_write : UInt<1>
    input io_data : SInt<32>
    output io_read_data_1 : SInt<32>
    output io_read_data_2 : SInt<32>

    reg RegFile_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_0) @[RegisterFile.scala 19:20]
    reg RegFile_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_1) @[RegisterFile.scala 19:20]
    reg RegFile_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_2) @[RegisterFile.scala 19:20]
    reg RegFile_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_3) @[RegisterFile.scala 19:20]
    reg RegFile_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_4) @[RegisterFile.scala 19:20]
    reg RegFile_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_5) @[RegisterFile.scala 19:20]
    reg RegFile_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_6) @[RegisterFile.scala 19:20]
    reg RegFile_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_7) @[RegisterFile.scala 19:20]
    reg RegFile_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_8) @[RegisterFile.scala 19:20]
    reg RegFile_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_9) @[RegisterFile.scala 19:20]
    reg RegFile_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_10) @[RegisterFile.scala 19:20]
    reg RegFile_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_11) @[RegisterFile.scala 19:20]
    reg RegFile_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_12) @[RegisterFile.scala 19:20]
    reg RegFile_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_13) @[RegisterFile.scala 19:20]
    reg RegFile_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_14) @[RegisterFile.scala 19:20]
    reg RegFile_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_15) @[RegisterFile.scala 19:20]
    reg RegFile_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_16) @[RegisterFile.scala 19:20]
    reg RegFile_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_17) @[RegisterFile.scala 19:20]
    reg RegFile_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_18) @[RegisterFile.scala 19:20]
    reg RegFile_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_19) @[RegisterFile.scala 19:20]
    reg RegFile_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_20) @[RegisterFile.scala 19:20]
    reg RegFile_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_21) @[RegisterFile.scala 19:20]
    reg RegFile_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_22) @[RegisterFile.scala 19:20]
    reg RegFile_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_23) @[RegisterFile.scala 19:20]
    reg RegFile_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_24) @[RegisterFile.scala 19:20]
    reg RegFile_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_25) @[RegisterFile.scala 19:20]
    reg RegFile_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_26) @[RegisterFile.scala 19:20]
    reg RegFile_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_27) @[RegisterFile.scala 19:20]
    reg RegFile_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_28) @[RegisterFile.scala 19:20]
    reg RegFile_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_29) @[RegisterFile.scala 19:20]
    reg RegFile_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_30) @[RegisterFile.scala 19:20]
    reg RegFile_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), RegFile_31) @[RegisterFile.scala 19:20]
    node _io_read_data_1_T = orr(io_id_in_reg_src_a) @[RegisterFile.scala 22:25]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_id_in_reg_src_a), RegFile_0) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_id_in_reg_src_a), RegFile_1, _GEN_0) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_id_in_reg_src_a), RegFile_2, _GEN_1) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_id_in_reg_src_a), RegFile_3, _GEN_2) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_id_in_reg_src_a), RegFile_4, _GEN_3) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_id_in_reg_src_a), RegFile_5, _GEN_4) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_id_in_reg_src_a), RegFile_6, _GEN_5) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_id_in_reg_src_a), RegFile_7, _GEN_6) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_id_in_reg_src_a), RegFile_8, _GEN_7) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_id_in_reg_src_a), RegFile_9, _GEN_8) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_id_in_reg_src_a), RegFile_10, _GEN_9) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_id_in_reg_src_a), RegFile_11, _GEN_10) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_id_in_reg_src_a), RegFile_12, _GEN_11) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_id_in_reg_src_a), RegFile_13, _GEN_12) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_id_in_reg_src_a), RegFile_14, _GEN_13) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_id_in_reg_src_a), RegFile_15, _GEN_14) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_id_in_reg_src_a), RegFile_16, _GEN_15) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_id_in_reg_src_a), RegFile_17, _GEN_16) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_id_in_reg_src_a), RegFile_18, _GEN_17) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_id_in_reg_src_a), RegFile_19, _GEN_18) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_id_in_reg_src_a), RegFile_20, _GEN_19) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_id_in_reg_src_a), RegFile_21, _GEN_20) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_id_in_reg_src_a), RegFile_22, _GEN_21) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_id_in_reg_src_a), RegFile_23, _GEN_22) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_id_in_reg_src_a), RegFile_24, _GEN_23) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_id_in_reg_src_a), RegFile_25, _GEN_24) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_id_in_reg_src_a), RegFile_26, _GEN_25) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_id_in_reg_src_a), RegFile_27, _GEN_26) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_id_in_reg_src_a), RegFile_28, _GEN_27) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_id_in_reg_src_a), RegFile_29, _GEN_28) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_id_in_reg_src_a), RegFile_30, _GEN_29) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_id_in_reg_src_a), RegFile_31, _GEN_30) @[RegisterFile.scala 21:24 RegisterFile.scala 21:24]
    node _RegFile_io_id_in_reg_src_a = _GEN_31 @[RegisterFile.scala 21:24]
    node _io_read_data_1_T_1 = mux(_io_read_data_1_T, _RegFile_io_id_in_reg_src_a, asSInt(UInt<1>("h0"))) @[RegisterFile.scala 21:24]
    node _io_read_data_2_T = orr(io_id_in_reg_src_b) @[RegisterFile.scala 27:25]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_id_in_reg_src_b), RegFile_0) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_id_in_reg_src_b), RegFile_1, _GEN_32) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_id_in_reg_src_b), RegFile_2, _GEN_33) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_id_in_reg_src_b), RegFile_3, _GEN_34) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_id_in_reg_src_b), RegFile_4, _GEN_35) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_id_in_reg_src_b), RegFile_5, _GEN_36) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_id_in_reg_src_b), RegFile_6, _GEN_37) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_id_in_reg_src_b), RegFile_7, _GEN_38) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_id_in_reg_src_b), RegFile_8, _GEN_39) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_id_in_reg_src_b), RegFile_9, _GEN_40) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_id_in_reg_src_b), RegFile_10, _GEN_41) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_id_in_reg_src_b), RegFile_11, _GEN_42) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_id_in_reg_src_b), RegFile_12, _GEN_43) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_id_in_reg_src_b), RegFile_13, _GEN_44) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_id_in_reg_src_b), RegFile_14, _GEN_45) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_id_in_reg_src_b), RegFile_15, _GEN_46) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_id_in_reg_src_b), RegFile_16, _GEN_47) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_id_in_reg_src_b), RegFile_17, _GEN_48) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_id_in_reg_src_b), RegFile_18, _GEN_49) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_id_in_reg_src_b), RegFile_19, _GEN_50) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_id_in_reg_src_b), RegFile_20, _GEN_51) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_id_in_reg_src_b), RegFile_21, _GEN_52) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_id_in_reg_src_b), RegFile_22, _GEN_53) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_id_in_reg_src_b), RegFile_23, _GEN_54) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_id_in_reg_src_b), RegFile_24, _GEN_55) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_id_in_reg_src_b), RegFile_25, _GEN_56) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_id_in_reg_src_b), RegFile_26, _GEN_57) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_id_in_reg_src_b), RegFile_27, _GEN_58) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_id_in_reg_src_b), RegFile_28, _GEN_59) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_id_in_reg_src_b), RegFile_29, _GEN_60) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_id_in_reg_src_b), RegFile_30, _GEN_61) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_id_in_reg_src_b), RegFile_31, _GEN_62) @[RegisterFile.scala 26:24 RegisterFile.scala 26:24]
    node _RegFile_io_id_in_reg_src_b = _GEN_63 @[RegisterFile.scala 26:24]
    node _io_read_data_2_T_1 = mux(_io_read_data_2_T, _RegFile_io_id_in_reg_src_b, asSInt(UInt<1>("h0"))) @[RegisterFile.scala 26:24]
    node _T = orr(io_id_in_reg_dest) @[RegisterFile.scala 32:41]
    node _T_1 = and(io_reg_write, _T) @[RegisterFile.scala 32:21]
    node _RegFile_io_id_in_reg_dest = io_data @[RegisterFile.scala 33:32 RegisterFile.scala 33:32]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_0) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_1) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_2) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_3) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_4) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_5) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_6) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_7) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_8) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_9) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_10) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_11) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_12) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_13) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_14) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_15) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_16) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_17) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_18) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_19) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_20) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_21) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_22) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_23) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_24) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_25) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_26) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_27) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_28) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_29) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_30) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_id_in_reg_dest), _RegFile_io_id_in_reg_dest, RegFile_31) @[RegisterFile.scala 33:32 RegisterFile.scala 33:32 RegisterFile.scala 19:20]
    node _GEN_96 = mux(_T_1, _GEN_64, RegFile_0) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_97 = mux(_T_1, _GEN_65, RegFile_1) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_98 = mux(_T_1, _GEN_66, RegFile_2) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_99 = mux(_T_1, _GEN_67, RegFile_3) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_100 = mux(_T_1, _GEN_68, RegFile_4) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_101 = mux(_T_1, _GEN_69, RegFile_5) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_102 = mux(_T_1, _GEN_70, RegFile_6) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_103 = mux(_T_1, _GEN_71, RegFile_7) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_104 = mux(_T_1, _GEN_72, RegFile_8) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_105 = mux(_T_1, _GEN_73, RegFile_9) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_106 = mux(_T_1, _GEN_74, RegFile_10) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_107 = mux(_T_1, _GEN_75, RegFile_11) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_108 = mux(_T_1, _GEN_76, RegFile_12) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_109 = mux(_T_1, _GEN_77, RegFile_13) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_110 = mux(_T_1, _GEN_78, RegFile_14) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_111 = mux(_T_1, _GEN_79, RegFile_15) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_112 = mux(_T_1, _GEN_80, RegFile_16) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_113 = mux(_T_1, _GEN_81, RegFile_17) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_114 = mux(_T_1, _GEN_82, RegFile_18) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_115 = mux(_T_1, _GEN_83, RegFile_19) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_116 = mux(_T_1, _GEN_84, RegFile_20) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_117 = mux(_T_1, _GEN_85, RegFile_21) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_118 = mux(_T_1, _GEN_86, RegFile_22) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_119 = mux(_T_1, _GEN_87, RegFile_23) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_120 = mux(_T_1, _GEN_88, RegFile_24) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_121 = mux(_T_1, _GEN_89, RegFile_25) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_122 = mux(_T_1, _GEN_90, RegFile_26) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_123 = mux(_T_1, _GEN_91, RegFile_27) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_124 = mux(_T_1, _GEN_92, RegFile_28) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_125 = mux(_T_1, _GEN_93, RegFile_29) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_126 = mux(_T_1, _GEN_94, RegFile_30) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    node _GEN_127 = mux(_T_1, _GEN_95, RegFile_31) @[RegisterFile.scala 32:46 RegisterFile.scala 19:20]
    io_read_data_1 <= _io_read_data_1_T_1 @[RegisterFile.scala 21:18]
    io_read_data_2 <= _io_read_data_2_T_1 @[RegisterFile.scala 26:18]
    RegFile_0 <= _GEN_96
    RegFile_1 <= _GEN_97
    RegFile_2 <= _GEN_98
    RegFile_3 <= _GEN_99
    RegFile_4 <= _GEN_100
    RegFile_5 <= _GEN_101
    RegFile_6 <= _GEN_102
    RegFile_7 <= _GEN_103
    RegFile_8 <= _GEN_104
    RegFile_9 <= _GEN_105
    RegFile_10 <= _GEN_106
    RegFile_11 <= _GEN_107
    RegFile_12 <= _GEN_108
    RegFile_13 <= _GEN_109
    RegFile_14 <= _GEN_110
    RegFile_15 <= _GEN_111
    RegFile_16 <= _GEN_112
    RegFile_17 <= _GEN_113
    RegFile_18 <= _GEN_114
    RegFile_19 <= _GEN_115
    RegFile_20 <= _GEN_116
    RegFile_21 <= _GEN_117
    RegFile_22 <= _GEN_118
    RegFile_23 <= _GEN_119
    RegFile_24 <= _GEN_120
    RegFile_25 <= _GEN_121
    RegFile_26 <= _GEN_122
    RegFile_27 <= _GEN_123
    RegFile_28 <= _GEN_124
    RegFile_29 <= _GEN_125
    RegFile_30 <= _GEN_126
    RegFile_31 <= _GEN_127

  module Selector3To2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<1>
    input io_in_1 : UInt<1>
    input io_in_2 : UInt<1>
    output io_out : UInt<2>

    node io_out_hi = or(io_in_2, io_in_1) @[SignalController.scala 65:27]
    node io_out_lo = or(io_in_0, io_in_2) @[SignalController.scala 65:50]
    node _io_out_T = cat(io_out_hi, io_out_lo) @[Cat.scala 30:58]
    io_out <= _io_out_T @[SignalController.scala 65:10]

  module AluOpSelector :
    input clock : Clock
    input reset : UInt<1>
    input io_in_r_type : UInt<1>
    input io_in_i_type : UInt<1>
    input io_in_load_type : UInt<1>
    input io_in_s_type : UInt<1>
    input io_in_sb_type : UInt<1>
    input io_in_uj_type : UInt<1>
    input io_in_jalr_type : UInt<1>
    input io_in_lui_type : UInt<1>
    input io_in_auipc_type : UInt<1>
    output io_alu_op_0 : UInt<1>
    output io_alu_op_1 : UInt<1>
    output io_alu_op_2 : UInt<1>

    node _io_alu_op_0_T = eq(io_in_r_type, UInt<1>("h0")) @[SignalController.scala 74:9]
    node _io_alu_op_0_T_1 = eq(io_in_sb_type, UInt<1>("h0")) @[SignalController.scala 74:29]
    node _io_alu_op_0_T_2 = and(_io_alu_op_0_T, _io_alu_op_0_T_1) @[SignalController.scala 74:26]
    node _io_alu_op_0_T_3 = eq(io_in_lui_type, UInt<1>("h0")) @[SignalController.scala 74:50]
    node _io_alu_op_0_T_4 = and(_io_alu_op_0_T_2, _io_alu_op_0_T_3) @[SignalController.scala 74:47]
    node _io_alu_op_0_T_5 = eq(io_in_load_type, UInt<1>("h0")) @[SignalController.scala 74:72]
    node _io_alu_op_0_T_6 = and(_io_alu_op_0_T_4, _io_alu_op_0_T_5) @[SignalController.scala 74:69]
    node _io_alu_op_1_T = eq(io_in_r_type, UInt<1>("h0")) @[SignalController.scala 77:9]
    node _io_alu_op_1_T_1 = eq(io_in_i_type, UInt<1>("h0")) @[SignalController.scala 77:29]
    node _io_alu_op_1_T_2 = and(_io_alu_op_1_T, _io_alu_op_1_T_1) @[SignalController.scala 77:26]
    node _io_alu_op_1_T_3 = eq(io_in_s_type, UInt<1>("h0")) @[SignalController.scala 77:49]
    node _io_alu_op_1_T_4 = and(_io_alu_op_1_T_2, _io_alu_op_1_T_3) @[SignalController.scala 77:46]
    node _io_alu_op_1_T_5 = eq(io_in_load_type, UInt<1>("h0")) @[SignalController.scala 77:69]
    node _io_alu_op_1_T_6 = and(_io_alu_op_1_T_4, _io_alu_op_1_T_5) @[SignalController.scala 77:66]
    node _io_alu_op_2_T = eq(io_in_r_type, UInt<1>("h0")) @[SignalController.scala 80:9]
    node _io_alu_op_2_T_1 = eq(io_in_i_type, UInt<1>("h0")) @[SignalController.scala 80:29]
    node _io_alu_op_2_T_2 = and(_io_alu_op_2_T, _io_alu_op_2_T_1) @[SignalController.scala 80:26]
    node _io_alu_op_2_T_3 = eq(io_in_sb_type, UInt<1>("h0")) @[SignalController.scala 80:49]
    node _io_alu_op_2_T_4 = and(_io_alu_op_2_T_2, _io_alu_op_2_T_3) @[SignalController.scala 80:46]
    node _io_alu_op_2_T_5 = eq(io_in_uj_type, UInt<1>("h0")) @[SignalController.scala 80:70]
    node _io_alu_op_2_T_6 = and(_io_alu_op_2_T_4, _io_alu_op_2_T_5) @[SignalController.scala 80:67]
    node _io_alu_op_2_T_7 = eq(io_in_jalr_type, UInt<1>("h0")) @[SignalController.scala 80:91]
    node _io_alu_op_2_T_8 = and(_io_alu_op_2_T_6, _io_alu_op_2_T_7) @[SignalController.scala 80:88]
    io_alu_op_0 <= _io_alu_op_0_T_6 @[SignalController.scala 74:5]
    io_alu_op_1 <= _io_alu_op_1_T_6 @[SignalController.scala 77:5]
    io_alu_op_2 <= _io_alu_op_2_T_8 @[SignalController.scala 80:5]

  module SignalController :
    input clock : Clock
    input reset : UInt<1>
    input io_in_r_type : UInt<1>
    input io_in_i_type : UInt<1>
    input io_in_load_type : UInt<1>
    input io_in_s_type : UInt<1>
    input io_in_sb_type : UInt<1>
    input io_in_uj_type : UInt<1>
    input io_in_jalr_type : UInt<1>
    input io_in_lui_type : UInt<1>
    input io_in_auipc_type : UInt<1>
    output io_out_reg_write : UInt<1>
    output io_out_mem_write : UInt<1>
    output io_out_mem_read : UInt<1>
    output io_out_mem_to_reg : UInt<1>
    output io_out_branch : UInt<1>
    output io_out_operand_a : UInt<2>
    output io_out_operand_b : UInt<1>
    output io_out_extend_sel : UInt<2>
    output io_out_next_pc : UInt<2>
    output io_out_alu_op : UInt<3>

    inst op_a_selector of Selector3To2 @[SignalController.scala 22:29]
    inst imm_extend_selector of Selector3To2 @[SignalController.scala 23:35]
    inst next_pc_selector of Selector3To2 @[SignalController.scala 24:32]
    inst alu_op_selector of AluOpSelector @[SignalController.scala 25:31]
    node _io_out_reg_write_T = or(io_in_i_type, io_in_r_type) @[SignalController.scala 27:36]
    node _io_out_reg_write_T_1 = or(_io_out_reg_write_T, io_in_load_type) @[SignalController.scala 27:51]
    node _io_out_reg_write_T_2 = or(_io_out_reg_write_T_1, io_in_lui_type) @[SignalController.scala 27:69]
    node _io_out_reg_write_T_3 = or(_io_out_reg_write_T_2, io_in_uj_type) @[SignalController.scala 27:86]
    node _io_out_reg_write_T_4 = or(_io_out_reg_write_T_3, io_in_jalr_type) @[SignalController.scala 27:102]
    node _op_a_selector_io_in_1_T = or(io_in_uj_type, io_in_jalr_type) @[SignalController.scala 33:43]
    node _io_out_operand_b_T = or(io_in_i_type, io_in_load_type) @[SignalController.scala 36:36]
    node _io_out_operand_b_T_1 = or(_io_out_operand_b_T, io_in_lui_type) @[SignalController.scala 36:54]
    node _io_out_operand_b_T_2 = or(_io_out_operand_b_T_1, io_in_auipc_type) @[SignalController.scala 36:71]
    node _io_out_operand_b_T_3 = or(_io_out_operand_b_T_2, io_in_s_type) @[SignalController.scala 36:90]
    node _imm_extend_selector_io_in_1_T = or(io_in_lui_type, io_in_auipc_type) @[SignalController.scala 38:50]
    node io_out_alu_op_hi = cat(alu_op_selector.io_alu_op_2, alu_op_selector.io_alu_op_1) @[Cat.scala 30:58]
    node _io_out_alu_op_T = cat(io_out_alu_op_hi, alu_op_selector.io_alu_op_0) @[Cat.scala 30:58]
    io_out_reg_write <= _io_out_reg_write_T_4 @[SignalController.scala 27:20]
    io_out_mem_write <= io_in_s_type @[SignalController.scala 28:20]
    io_out_mem_read <= io_in_load_type @[SignalController.scala 29:19]
    io_out_mem_to_reg <= io_in_load_type @[SignalController.scala 30:21]
    io_out_branch <= io_in_sb_type @[SignalController.scala 31:17]
    io_out_operand_a <= op_a_selector.io_out @[SignalController.scala 35:20]
    io_out_operand_b <= _io_out_operand_b_T_3 @[SignalController.scala 36:20]
    io_out_extend_sel <= imm_extend_selector.io_out @[SignalController.scala 40:21]
    io_out_next_pc <= next_pc_selector.io_out @[SignalController.scala 44:18]
    io_out_alu_op <= _io_out_alu_op_T @[SignalController.scala 54:17]
    op_a_selector.clock <= clock
    op_a_selector.reset <= reset
    op_a_selector.io_in_0 <= io_in_auipc_type @[SignalController.scala 32:26]
    op_a_selector.io_in_1 <= _op_a_selector_io_in_1_T @[SignalController.scala 33:26]
    op_a_selector.io_in_2 <= io_in_lui_type @[SignalController.scala 34:26]
    imm_extend_selector.clock <= clock
    imm_extend_selector.reset <= reset
    imm_extend_selector.io_in_0 <= io_in_s_type @[SignalController.scala 37:32]
    imm_extend_selector.io_in_1 <= _imm_extend_selector_io_in_1_T @[SignalController.scala 38:32]
    imm_extend_selector.io_in_2 <= UInt<1>("h0") @[SignalController.scala 39:32]
    next_pc_selector.clock <= clock
    next_pc_selector.reset <= reset
    next_pc_selector.io_in_0 <= io_in_uj_type @[SignalController.scala 41:29]
    next_pc_selector.io_in_1 <= io_in_jalr_type @[SignalController.scala 42:29]
    next_pc_selector.io_in_2 <= io_in_sb_type @[SignalController.scala 43:29]
    alu_op_selector.clock <= clock
    alu_op_selector.reset <= reset
    alu_op_selector.io_in_r_type <= io_in_r_type @[SignalController.scala 45:32]
    alu_op_selector.io_in_i_type <= io_in_i_type @[SignalController.scala 46:32]
    alu_op_selector.io_in_load_type <= io_in_load_type @[SignalController.scala 47:35]
    alu_op_selector.io_in_s_type <= io_in_s_type @[SignalController.scala 48:32]
    alu_op_selector.io_in_sb_type <= io_in_sb_type @[SignalController.scala 49:33]
    alu_op_selector.io_in_uj_type <= io_in_uj_type @[SignalController.scala 50:33]
    alu_op_selector.io_in_jalr_type <= io_in_jalr_type @[SignalController.scala 51:35]
    alu_op_selector.io_in_lui_type <= io_in_lui_type @[SignalController.scala 52:34]
    alu_op_selector.io_in_auipc_type <= io_in_auipc_type @[SignalController.scala 53:36]

  module TypeController :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_out_r_type : UInt<1>
    output io_out_i_type : UInt<1>
    output io_out_load_type : UInt<1>
    output io_out_s_type : UInt<1>
    output io_out_sb_type : UInt<1>
    output io_out_uj_type : UInt<1>
    output io_out_jalr_type : UInt<1>
    output io_out_lui_type : UInt<1>
    output io_out_auipc_type : UInt<1>

    node _T = eq(UInt<7>("h33"), io_opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<7>("h13"), io_opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<7>("h3"), io_opcode) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<7>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<7>("h67"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<7>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<7>("h17"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 60:25 TypeController.scala 23:21]
    node _GEN_1 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 56:23 TypeController.scala 22:19]
    node _GEN_2 = mux(_T_7, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_3 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 52:24 TypeController.scala 21:20]
    node _GEN_4 = mux(_T_6, UInt<1>("h0"), _GEN_1) @[Conditional.scala 39:67 TypeController.scala 22:19]
    node _GEN_5 = mux(_T_6, UInt<1>("h0"), _GEN_2) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_6 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 48:22 TypeController.scala 20:18]
    node _GEN_7 = mux(_T_5, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67 TypeController.scala 21:20]
    node _GEN_8 = mux(_T_5, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 TypeController.scala 22:19]
    node _GEN_9 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_10 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 44:22 TypeController.scala 19:18]
    node _GEN_11 = mux(_T_4, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67 TypeController.scala 20:18]
    node _GEN_12 = mux(_T_4, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67 TypeController.scala 21:20]
    node _GEN_13 = mux(_T_4, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 TypeController.scala 22:19]
    node _GEN_14 = mux(_T_4, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_15 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 40:21 TypeController.scala 18:17]
    node _GEN_16 = mux(_T_3, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 TypeController.scala 19:18]
    node _GEN_17 = mux(_T_3, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67 TypeController.scala 20:18]
    node _GEN_18 = mux(_T_3, UInt<1>("h0"), _GEN_12) @[Conditional.scala 39:67 TypeController.scala 21:20]
    node _GEN_19 = mux(_T_3, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 TypeController.scala 22:19]
    node _GEN_20 = mux(_T_3, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_21 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 36:24 TypeController.scala 17:20]
    node _GEN_22 = mux(_T_2, UInt<1>("h0"), _GEN_15) @[Conditional.scala 39:67 TypeController.scala 18:17]
    node _GEN_23 = mux(_T_2, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 TypeController.scala 19:18]
    node _GEN_24 = mux(_T_2, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 TypeController.scala 20:18]
    node _GEN_25 = mux(_T_2, UInt<1>("h0"), _GEN_18) @[Conditional.scala 39:67 TypeController.scala 21:20]
    node _GEN_26 = mux(_T_2, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 TypeController.scala 22:19]
    node _GEN_27 = mux(_T_2, UInt<1>("h0"), _GEN_20) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_28 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 TypeController.scala 32:21 TypeController.scala 16:17]
    node _GEN_29 = mux(_T_1, UInt<1>("h0"), _GEN_21) @[Conditional.scala 39:67 TypeController.scala 17:20]
    node _GEN_30 = mux(_T_1, UInt<1>("h0"), _GEN_22) @[Conditional.scala 39:67 TypeController.scala 18:17]
    node _GEN_31 = mux(_T_1, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 TypeController.scala 19:18]
    node _GEN_32 = mux(_T_1, UInt<1>("h0"), _GEN_24) @[Conditional.scala 39:67 TypeController.scala 20:18]
    node _GEN_33 = mux(_T_1, UInt<1>("h0"), _GEN_25) @[Conditional.scala 39:67 TypeController.scala 21:20]
    node _GEN_34 = mux(_T_1, UInt<1>("h0"), _GEN_26) @[Conditional.scala 39:67 TypeController.scala 22:19]
    node _GEN_35 = mux(_T_1, UInt<1>("h0"), _GEN_27) @[Conditional.scala 39:67 TypeController.scala 23:21]
    node _GEN_36 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 TypeController.scala 28:21 TypeController.scala 15:17]
    node _GEN_37 = mux(_T, UInt<1>("h0"), _GEN_28) @[Conditional.scala 40:58 TypeController.scala 16:17]
    node _GEN_38 = mux(_T, UInt<1>("h0"), _GEN_29) @[Conditional.scala 40:58 TypeController.scala 17:20]
    node _GEN_39 = mux(_T, UInt<1>("h0"), _GEN_30) @[Conditional.scala 40:58 TypeController.scala 18:17]
    node _GEN_40 = mux(_T, UInt<1>("h0"), _GEN_31) @[Conditional.scala 40:58 TypeController.scala 19:18]
    node _GEN_41 = mux(_T, UInt<1>("h0"), _GEN_32) @[Conditional.scala 40:58 TypeController.scala 20:18]
    node _GEN_42 = mux(_T, UInt<1>("h0"), _GEN_33) @[Conditional.scala 40:58 TypeController.scala 21:20]
    node _GEN_43 = mux(_T, UInt<1>("h0"), _GEN_34) @[Conditional.scala 40:58 TypeController.scala 22:19]
    node _GEN_44 = mux(_T, UInt<1>("h0"), _GEN_35) @[Conditional.scala 40:58 TypeController.scala 23:21]
    io_out_r_type <= _GEN_36
    io_out_i_type <= _GEN_37
    io_out_load_type <= _GEN_38
    io_out_s_type <= _GEN_39
    io_out_sb_type <= _GEN_40
    io_out_uj_type <= _GEN_41
    io_out_jalr_type <= _GEN_42
    io_out_lui_type <= _GEN_43
    io_out_auipc_type <= _GEN_44

  module Controller :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_out_reg_write : UInt<1>
    output io_out_mem_write : UInt<1>
    output io_out_mem_read : UInt<1>
    output io_out_mem_to_reg : UInt<1>
    output io_out_branch : UInt<1>
    output io_out_operand_a : UInt<2>
    output io_out_operand_b : UInt<1>
    output io_out_extend_sel : UInt<2>
    output io_out_next_pc : UInt<2>
    output io_out_alu_op : UInt<3>

    inst signal_ctrl of SignalController @[Controller.scala 12:27]
    inst type_ctrl of TypeController @[Controller.scala 13:25]
    io_out_reg_write <= signal_ctrl.io_out_reg_write @[Controller.scala 17:10]
    io_out_mem_write <= signal_ctrl.io_out_mem_write @[Controller.scala 17:10]
    io_out_mem_read <= signal_ctrl.io_out_mem_read @[Controller.scala 17:10]
    io_out_mem_to_reg <= signal_ctrl.io_out_mem_to_reg @[Controller.scala 17:10]
    io_out_branch <= signal_ctrl.io_out_branch @[Controller.scala 17:10]
    io_out_operand_a <= signal_ctrl.io_out_operand_a @[Controller.scala 17:10]
    io_out_operand_b <= signal_ctrl.io_out_operand_b @[Controller.scala 17:10]
    io_out_extend_sel <= signal_ctrl.io_out_extend_sel @[Controller.scala 17:10]
    io_out_next_pc <= signal_ctrl.io_out_next_pc @[Controller.scala 17:10]
    io_out_alu_op <= signal_ctrl.io_out_alu_op @[Controller.scala 17:10]
    signal_ctrl.clock <= clock
    signal_ctrl.reset <= reset
    signal_ctrl.io_in_r_type <= type_ctrl.io_out_r_type @[Controller.scala 16:21]
    signal_ctrl.io_in_i_type <= type_ctrl.io_out_i_type @[Controller.scala 16:21]
    signal_ctrl.io_in_load_type <= type_ctrl.io_out_load_type @[Controller.scala 16:21]
    signal_ctrl.io_in_s_type <= type_ctrl.io_out_s_type @[Controller.scala 16:21]
    signal_ctrl.io_in_sb_type <= type_ctrl.io_out_sb_type @[Controller.scala 16:21]
    signal_ctrl.io_in_uj_type <= type_ctrl.io_out_uj_type @[Controller.scala 16:21]
    signal_ctrl.io_in_jalr_type <= type_ctrl.io_out_jalr_type @[Controller.scala 16:21]
    signal_ctrl.io_in_lui_type <= type_ctrl.io_out_lui_type @[Controller.scala 16:21]
    signal_ctrl.io_in_auipc_type <= type_ctrl.io_out_auipc_type @[Controller.scala 16:21]
    type_ctrl.clock <= clock
    type_ctrl.reset <= reset
    type_ctrl.io_opcode <= io_opcode @[Controller.scala 15:13]

  module ImmGen :
    input clock : Clock
    input reset : UInt<1>
    input io_instr : UInt<32>
    output io_out_i_type : SInt<32>
    output io_out_s_type : SInt<32>
    output io_out_sb_type : SInt<32>
    output io_out_u_type : SInt<32>
    output io_out_uj_type : SInt<32>

    node _io_out_i_type_T = bits(io_instr, 31, 31) @[ImmGen.scala 21:26]
    node _io_out_i_type_T_1 = mux(_io_out_i_type_T, UInt<1>("h1"), UInt<1>("h0")) @[ImmGen.scala 21:17]
    node _io_out_i_type_T_2 = bits(_io_out_i_type_T_1, 0, 0) @[Bitwise.scala 72:15]
    node io_out_i_type_hi = mux(_io_out_i_type_T_2, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_out_i_type_lo = bits(io_instr, 31, 20) @[ImmGen.scala 22:13]
    node _io_out_i_type_T_3 = cat(io_out_i_type_hi, io_out_i_type_lo) @[Cat.scala 30:58]
    node _io_out_i_type_T_4 = asSInt(_io_out_i_type_T_3) @[ImmGen.scala 23:5]
    node _io_out_s_type_T = bits(io_instr, 31, 31) @[ImmGen.scala 26:26]
    node _io_out_s_type_T_1 = mux(_io_out_s_type_T, UInt<1>("h1"), UInt<1>("h0")) @[ImmGen.scala 26:17]
    node _io_out_s_type_T_2 = bits(_io_out_s_type_T_1, 0, 0) @[Bitwise.scala 72:15]
    node io_out_s_type_hi_hi = mux(_io_out_s_type_T_2, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_out_s_type_hi_lo = bits(io_instr, 31, 25) @[ImmGen.scala 27:13]
    node io_out_s_type_lo = bits(io_instr, 11, 7) @[ImmGen.scala 28:13]
    node io_out_s_type_hi = cat(io_out_s_type_hi_hi, io_out_s_type_hi_lo) @[Cat.scala 30:58]
    node _io_out_s_type_T_3 = cat(io_out_s_type_hi, io_out_s_type_lo) @[Cat.scala 30:58]
    node _io_out_s_type_T_4 = asSInt(_io_out_s_type_T_3) @[ImmGen.scala 29:5]
    node _io_out_sb_type_T = bits(io_instr, 31, 31) @[ImmGen.scala 32:26]
    node _io_out_sb_type_T_1 = mux(_io_out_sb_type_T, UInt<1>("h1"), UInt<1>("h0")) @[ImmGen.scala 32:17]
    node _io_out_sb_type_T_2 = bits(_io_out_sb_type_T_1, 0, 0) @[Bitwise.scala 72:15]
    node io_out_sb_type_hi_hi_hi = mux(_io_out_sb_type_T_2, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_out_sb_type_hi_hi_lo = bits(io_instr, 31, 31) @[ImmGen.scala 33:13]
    node io_out_sb_type_hi_lo = bits(io_instr, 7, 7) @[ImmGen.scala 34:13]
    node io_out_sb_type_lo_hi_hi = bits(io_instr, 30, 25) @[ImmGen.scala 35:13]
    node io_out_sb_type_lo_hi_lo = bits(io_instr, 11, 8) @[ImmGen.scala 36:13]
    node io_out_sb_type_lo_hi = cat(io_out_sb_type_lo_hi_hi, io_out_sb_type_lo_hi_lo) @[Cat.scala 30:58]
    node io_out_sb_type_lo = cat(io_out_sb_type_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_out_sb_type_hi_hi = cat(io_out_sb_type_hi_hi_hi, io_out_sb_type_hi_hi_lo) @[Cat.scala 30:58]
    node io_out_sb_type_hi = cat(io_out_sb_type_hi_hi, io_out_sb_type_hi_lo) @[Cat.scala 30:58]
    node _io_out_sb_type_T_3 = cat(io_out_sb_type_hi, io_out_sb_type_lo) @[Cat.scala 30:58]
    node _io_out_sb_type_T_4 = asSInt(_io_out_sb_type_T_3) @[ImmGen.scala 38:5]
    node io_out_u_type_hi = bits(io_instr, 31, 12) @[ImmGen.scala 40:32]
    node io_out_u_type_lo = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_out_u_type_T = cat(io_out_u_type_hi, io_out_u_type_lo) @[Cat.scala 30:58]
    node _io_out_u_type_T_1 = asSInt(_io_out_u_type_T) @[ImmGen.scala 40:57]
    node _io_out_uj_type_T = bits(io_instr, 31, 31) @[ImmGen.scala 43:26]
    node _io_out_uj_type_T_1 = mux(_io_out_uj_type_T, UInt<1>("h1"), UInt<1>("h0")) @[ImmGen.scala 43:17]
    node _io_out_uj_type_T_2 = bits(_io_out_uj_type_T_1, 0, 0) @[Bitwise.scala 72:15]
    node io_out_uj_type_hi_hi_hi = mux(_io_out_uj_type_T_2, UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node io_out_uj_type_hi_hi_lo = bits(io_instr, 19, 12) @[ImmGen.scala 44:13]
    node io_out_uj_type_hi_lo = bits(io_instr, 20, 20) @[ImmGen.scala 45:13]
    node io_out_uj_type_lo_hi = bits(io_instr, 30, 21) @[ImmGen.scala 46:13]
    node io_out_uj_type_lo = cat(io_out_uj_type_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_out_uj_type_hi_hi = cat(io_out_uj_type_hi_hi_hi, io_out_uj_type_hi_hi_lo) @[Cat.scala 30:58]
    node io_out_uj_type_hi = cat(io_out_uj_type_hi_hi, io_out_uj_type_hi_lo) @[Cat.scala 30:58]
    node _io_out_uj_type_T_3 = cat(io_out_uj_type_hi, io_out_uj_type_lo) @[Cat.scala 30:58]
    node _io_out_uj_type_T_4 = asSInt(_io_out_uj_type_T_3) @[ImmGen.scala 48:5]
    io_out_i_type <= _io_out_i_type_T_4 @[ImmGen.scala 20:17]
    io_out_s_type <= _io_out_s_type_T_4 @[ImmGen.scala 25:17]
    io_out_sb_type <= asSInt(bits(_io_out_sb_type_T_4, 31, 0)) @[ImmGen.scala 31:18]
    io_out_u_type <= _io_out_u_type_T_1 @[ImmGen.scala 40:17]
    io_out_uj_type <= _io_out_uj_type_T_4 @[ImmGen.scala 42:18]

  module Branch :
    input clock : Clock
    input reset : UInt<1>
    input io_alu_result : SInt<32>
    input io_alu_op : UInt<5>
    output io_br_taken : UInt<1>

    node _io_br_taken_T = bits(io_alu_result, 0, 0) @[Branch.scala 12:32]
    node _io_br_taken_T_1 = bits(io_alu_op, 4, 3) @[Branch.scala 12:53]
    node _io_br_taken_T_2 = eq(_io_br_taken_T_1, UInt<2>("h2")) @[Branch.scala 12:60]
    node _io_br_taken_T_3 = mux(_io_br_taken_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 12:42]
    node _io_br_taken_T_4 = and(_io_br_taken_T, _io_br_taken_T_3) @[Branch.scala 12:37]
    io_br_taken <= _io_br_taken_T_4 @[Branch.scala 12:15]

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_operand_a : SInt<32>
    input io_operand_b : SInt<32>
    input io_alu_op : UInt<5>
    output io_data : SInt<32>
    output io_branch : UInt<1>

    inst br_module of Branch @[ALU.scala 16:25]
    node _T = eq(UInt<5>("h0"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T = add(io_operand_a, io_operand_b) @[ALU.scala 22:31]
    node _io_data_T_1 = tail(_io_data_T, 1) @[ALU.scala 22:31]
    node _io_data_T_2 = asSInt(_io_data_T_1) @[ALU.scala 22:31]
    node _T_1 = eq(UInt<5>("h1"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_3 = bits(io_operand_b, 4, 0) @[ALU.scala 25:49]
    node _io_data_T_4 = dshl(io_operand_a, _io_data_T_3) @[ALU.scala 25:32]
    node _T_2 = eq(UInt<5>("h2"), io_alu_op) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<5>("h14"), io_alu_op) @[Conditional.scala 37:30]
    node _T_4 = or(_T_2, _T_3) @[Conditional.scala 37:55]
    node _io_data_T_5 = lt(io_operand_a, io_operand_b) @[ALU.scala 28:32]
    node _io_data_T_6 = asSInt(_io_data_T_5) @[ALU.scala 28:48]
    node _io_data_T_7 = and(_io_data_T_6, asSInt(UInt<2>("h1"))) @[ALU.scala 28:55]
    node _io_data_T_8 = asSInt(_io_data_T_7) @[ALU.scala 28:55]
    node _T_5 = eq(UInt<5>("h3"), io_alu_op) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<5>("h16"), io_alu_op) @[Conditional.scala 37:30]
    node _T_7 = or(_T_5, _T_6) @[Conditional.scala 37:55]
    node _io_data_T_9 = asUInt(io_operand_a) @[ALU.scala 31:32]
    node _io_data_T_10 = asUInt(io_operand_b) @[ALU.scala 31:54]
    node _io_data_T_11 = lt(_io_data_T_9, _io_data_T_10) @[ALU.scala 31:39]
    node _io_data_T_12 = asSInt(_io_data_T_11) @[ALU.scala 31:62]
    node _io_data_T_13 = and(_io_data_T_12, asSInt(UInt<2>("h1"))) @[ALU.scala 31:69]
    node _io_data_T_14 = asSInt(_io_data_T_13) @[ALU.scala 31:69]
    node _T_8 = eq(UInt<5>("h4"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_15 = xor(io_operand_a, io_operand_b) @[ALU.scala 34:31]
    node _io_data_T_16 = asSInt(_io_data_T_15) @[ALU.scala 34:31]
    node _T_9 = eq(UInt<5>("h5"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_17 = asUInt(io_operand_a) @[ALU.scala 37:32]
    node _io_data_T_18 = bits(io_operand_b, 4, 0) @[ALU.scala 38:19]
    node _io_data_T_19 = dshr(_io_data_T_17, _io_data_T_18) @[ALU.scala 37:39]
    node _io_data_T_20 = asSInt(_io_data_T_19) @[ALU.scala 40:18]
    node _T_10 = eq(UInt<5>("h6"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_21 = or(io_operand_a, io_operand_b) @[ALU.scala 43:31]
    node _io_data_T_22 = asSInt(_io_data_T_21) @[ALU.scala 43:31]
    node _T_11 = eq(UInt<5>("h7"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_23 = and(io_operand_a, io_operand_b) @[ALU.scala 46:31]
    node _io_data_T_24 = asSInt(_io_data_T_23) @[ALU.scala 46:31]
    node _T_12 = eq(UInt<5>("h8"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_25 = sub(io_operand_a, io_operand_b) @[ALU.scala 49:31]
    node _io_data_T_26 = tail(_io_data_T_25, 1) @[ALU.scala 49:31]
    node _io_data_T_27 = asSInt(_io_data_T_26) @[ALU.scala 49:31]
    node _T_13 = eq(UInt<5>("hd"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_28 = bits(io_operand_b, 4, 0) @[ALU.scala 52:48]
    node _io_data_T_29 = dshr(io_operand_a, _io_data_T_28) @[ALU.scala 52:32]
    node _T_14 = eq(UInt<5>("h10"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_30 = eq(io_operand_a, io_operand_b) @[ALU.scala 55:32]
    node _io_data_T_31 = asSInt(_io_data_T_30) @[ALU.scala 55:50]
    node _io_data_T_32 = and(_io_data_T_31, asSInt(UInt<2>("h1"))) @[ALU.scala 55:57]
    node _io_data_T_33 = asSInt(_io_data_T_32) @[ALU.scala 55:57]
    node _T_15 = eq(UInt<5>("h11"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_34 = eq(io_operand_a, io_operand_b) @[ALU.scala 58:34]
    node _io_data_T_35 = eq(_io_data_T_34, UInt<1>("h0")) @[ALU.scala 58:19]
    node _io_data_T_36 = asSInt(_io_data_T_35) @[ALU.scala 58:53]
    node _io_data_T_37 = and(_io_data_T_36, asSInt(UInt<2>("h1"))) @[ALU.scala 58:60]
    node _io_data_T_38 = asSInt(_io_data_T_37) @[ALU.scala 58:60]
    node _T_16 = eq(UInt<5>("h15"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_39 = geq(io_operand_a, io_operand_b) @[ALU.scala 61:32]
    node _io_data_T_40 = asSInt(_io_data_T_39) @[ALU.scala 61:49]
    node _io_data_T_41 = and(_io_data_T_40, asSInt(UInt<2>("h1"))) @[ALU.scala 61:56]
    node _io_data_T_42 = asSInt(_io_data_T_41) @[ALU.scala 61:56]
    node _T_17 = eq(UInt<5>("h17"), io_alu_op) @[Conditional.scala 37:30]
    node _io_data_T_43 = asUInt(io_operand_a) @[ALU.scala 64:32]
    node _io_data_T_44 = asUInt(io_operand_b) @[ALU.scala 64:55]
    node _io_data_T_45 = geq(_io_data_T_43, _io_data_T_44) @[ALU.scala 64:39]
    node _io_data_T_46 = asSInt(_io_data_T_45) @[ALU.scala 64:63]
    node _io_data_T_47 = and(_io_data_T_46, asSInt(UInt<2>("h1"))) @[ALU.scala 64:70]
    node _io_data_T_48 = asSInt(_io_data_T_47) @[ALU.scala 64:70]
    node _T_18 = eq(UInt<5>("h1f"), io_alu_op) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_18, io_operand_a, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 ALU.scala 67:15 ALU.scala 18:11]
    node _GEN_1 = mux(_T_17, _io_data_T_48, _GEN_0) @[Conditional.scala 39:67 ALU.scala 64:15]
    node _GEN_2 = mux(_T_16, _io_data_T_42, _GEN_1) @[Conditional.scala 39:67 ALU.scala 61:15]
    node _GEN_3 = mux(_T_15, _io_data_T_38, _GEN_2) @[Conditional.scala 39:67 ALU.scala 58:15]
    node _GEN_4 = mux(_T_14, _io_data_T_33, _GEN_3) @[Conditional.scala 39:67 ALU.scala 55:15]
    node _GEN_5 = mux(_T_13, _io_data_T_29, _GEN_4) @[Conditional.scala 39:67 ALU.scala 52:15]
    node _GEN_6 = mux(_T_12, _io_data_T_27, _GEN_5) @[Conditional.scala 39:67 ALU.scala 49:15]
    node _GEN_7 = mux(_T_11, _io_data_T_24, _GEN_6) @[Conditional.scala 39:67 ALU.scala 46:15]
    node _GEN_8 = mux(_T_10, _io_data_T_22, _GEN_7) @[Conditional.scala 39:67 ALU.scala 43:15]
    node _GEN_9 = mux(_T_9, _io_data_T_20, _GEN_8) @[Conditional.scala 39:67 ALU.scala 37:15]
    node _GEN_10 = mux(_T_8, _io_data_T_16, _GEN_9) @[Conditional.scala 39:67 ALU.scala 34:15]
    node _GEN_11 = mux(_T_7, _io_data_T_14, _GEN_10) @[Conditional.scala 39:67 ALU.scala 31:15]
    node _GEN_12 = mux(_T_4, _io_data_T_8, _GEN_11) @[Conditional.scala 39:67 ALU.scala 28:15]
    node _GEN_13 = mux(_T_1, _io_data_T_4, _GEN_12) @[Conditional.scala 39:67 ALU.scala 25:15]
    node _GEN_14 = mux(_T, _io_data_T_2, _GEN_13) @[Conditional.scala 40:58 ALU.scala 22:15]
    io_data <= asSInt(bits(_GEN_14, 31, 0))
    io_branch <= br_module.io_br_taken @[ALU.scala 73:13]
    br_module.clock <= clock
    br_module.reset <= reset
    br_module.io_alu_result <= io_data @[ALU.scala 71:27]
    br_module.io_alu_op <= io_alu_op @[ALU.scala 72:23]

  module PriEncoder :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<1>
    input io_in_1 : UInt<1>
    input io_in_2 : UInt<1>
    input io_in_3 : UInt<1>
    input io_in_4 : UInt<1>
    input io_in_5 : UInt<1>
    input io_in_6 : UInt<1>
    input io_in_7 : UInt<1>
    output io_out : UInt<3>

    node _GEN_0 = mux(io_in_1, UInt<1>("h1"), UInt<1>("h0")) @[PriEncoder.scala 35:24 PriEncoder.scala 36:12 PriEncoder.scala 38:12]
    node _GEN_1 = mux(io_in_2, UInt<2>("h2"), _GEN_0) @[PriEncoder.scala 33:24 PriEncoder.scala 34:12]
    node _GEN_2 = mux(io_in_3, UInt<2>("h3"), _GEN_1) @[PriEncoder.scala 31:24 PriEncoder.scala 32:12]
    node _GEN_3 = mux(io_in_4, UInt<3>("h4"), _GEN_2) @[PriEncoder.scala 29:24 PriEncoder.scala 30:12]
    node _GEN_4 = mux(io_in_5, UInt<3>("h5"), _GEN_3) @[PriEncoder.scala 27:24 PriEncoder.scala 28:12]
    node _GEN_5 = mux(io_in_6, UInt<3>("h6"), _GEN_4) @[PriEncoder.scala 25:24 PriEncoder.scala 26:12]
    node _GEN_6 = mux(io_in_7, UInt<3>("h7"), _GEN_5) @[PriEncoder.scala 23:18 PriEncoder.scala 24:12]
    io_out <= _GEN_6

  module ALUControl :
    input clock : Clock
    input reset : UInt<1>
    input io_in_ALUOp : UInt<3>
    output io_out_alu_op : UInt<5>
    input io_func_func3 : UInt<3>
    input io_func_func7 : UInt<1>

    inst pri_encoder of PriEncoder @[ALUControl.scala 21:27]
    node _pri_encoder_io_in_0_T = bits(io_in_ALUOp, 2, 2) @[ALUControl.scala 23:40]
    node _pri_encoder_io_in_0_T_1 = eq(_pri_encoder_io_in_0_T, UInt<1>("h0")) @[ALUControl.scala 23:28]
    node _pri_encoder_io_in_0_T_2 = bits(io_in_ALUOp, 1, 1) @[ALUControl.scala 23:58]
    node _pri_encoder_io_in_0_T_3 = and(_pri_encoder_io_in_0_T_1, _pri_encoder_io_in_0_T_2) @[ALUControl.scala 23:45]
    node _pri_encoder_io_in_0_T_4 = bits(io_in_ALUOp, 0, 0) @[ALUControl.scala 23:75]
    node _pri_encoder_io_in_0_T_5 = and(_pri_encoder_io_in_0_T_3, _pri_encoder_io_in_0_T_4) @[ALUControl.scala 23:62]
    node _pri_encoder_io_in_1_T = bits(io_in_ALUOp, 2, 2) @[ALUControl.scala 25:28]
    node _pri_encoder_io_in_1_T_1 = eq(_pri_encoder_io_in_1_T, UInt<1>("h0")) @[ALUControl.scala 25:16]
    node _pri_encoder_io_in_1_T_2 = bits(io_in_ALUOp, 1, 1) @[ALUControl.scala 25:46]
    node _pri_encoder_io_in_1_T_3 = and(_pri_encoder_io_in_1_T_1, _pri_encoder_io_in_1_T_2) @[ALUControl.scala 25:33]
    node _pri_encoder_io_in_1_T_4 = bits(io_in_ALUOp, 0, 0) @[ALUControl.scala 25:66]
    node _pri_encoder_io_in_1_T_5 = eq(_pri_encoder_io_in_1_T_4, UInt<1>("h0")) @[ALUControl.scala 25:53]
    node _pri_encoder_io_in_1_T_6 = and(_pri_encoder_io_in_1_T_3, _pri_encoder_io_in_1_T_5) @[ALUControl.scala 25:50]
    node _pri_encoder_io_in_2_T = bits(io_in_ALUOp, 2, 2) @[ALUControl.scala 27:28]
    node _pri_encoder_io_in_2_T_1 = eq(_pri_encoder_io_in_2_T, UInt<1>("h0")) @[ALUControl.scala 27:16]
    node _pri_encoder_io_in_2_T_2 = bits(io_in_ALUOp, 1, 1) @[ALUControl.scala 27:48]
    node _pri_encoder_io_in_2_T_3 = eq(_pri_encoder_io_in_2_T_2, UInt<1>("h0")) @[ALUControl.scala 27:36]
    node _pri_encoder_io_in_2_T_4 = and(_pri_encoder_io_in_2_T_1, _pri_encoder_io_in_2_T_3) @[ALUControl.scala 27:33]
    node _pri_encoder_io_in_2_T_5 = bits(io_in_ALUOp, 0, 0) @[ALUControl.scala 28:11]
    node _pri_encoder_io_in_2_T_6 = eq(_pri_encoder_io_in_2_T_5, UInt<1>("h0")) @[ALUControl.scala 27:56]
    node _pri_encoder_io_in_2_T_7 = and(_pri_encoder_io_in_2_T_4, _pri_encoder_io_in_2_T_6) @[ALUControl.scala 27:53]
    node _pri_encoder_io_in_2_T_8 = eq(io_func_func7, UInt<1>("h0")) @[ALUControl.scala 28:20]
    node _pri_encoder_io_in_2_T_9 = and(_pri_encoder_io_in_2_T_7, _pri_encoder_io_in_2_T_8) @[ALUControl.scala 28:17]
    node _pri_encoder_io_in_3_T = bits(io_in_ALUOp, 2, 2) @[ALUControl.scala 30:28]
    node _pri_encoder_io_in_3_T_1 = eq(_pri_encoder_io_in_3_T, UInt<1>("h0")) @[ALUControl.scala 30:16]
    node _pri_encoder_io_in_3_T_2 = bits(io_in_ALUOp, 1, 1) @[ALUControl.scala 30:48]
    node _pri_encoder_io_in_3_T_3 = eq(_pri_encoder_io_in_3_T_2, UInt<1>("h0")) @[ALUControl.scala 30:36]
    node _pri_encoder_io_in_3_T_4 = and(_pri_encoder_io_in_3_T_1, _pri_encoder_io_in_3_T_3) @[ALUControl.scala 30:33]
    node _pri_encoder_io_in_3_T_5 = bits(io_in_ALUOp, 0, 0) @[ALUControl.scala 31:11]
    node _pri_encoder_io_in_3_T_6 = eq(_pri_encoder_io_in_3_T_5, UInt<1>("h0")) @[ALUControl.scala 30:56]
    node _pri_encoder_io_in_3_T_7 = and(_pri_encoder_io_in_3_T_4, _pri_encoder_io_in_3_T_6) @[ALUControl.scala 30:53]
    node _pri_encoder_io_in_3_T_8 = and(_pri_encoder_io_in_3_T_7, io_func_func7) @[ALUControl.scala 31:17]
    node _pri_encoder_io_in_4_T = bits(io_in_ALUOp, 2, 2) @[ALUControl.scala 32:40]
    node _pri_encoder_io_in_4_T_1 = eq(_pri_encoder_io_in_4_T, UInt<1>("h0")) @[ALUControl.scala 32:28]
    node _pri_encoder_io_in_4_T_2 = bits(io_in_ALUOp, 1, 1) @[ALUControl.scala 32:60]
    node _pri_encoder_io_in_4_T_3 = eq(_pri_encoder_io_in_4_T_2, UInt<1>("h0")) @[ALUControl.scala 32:48]
    node _pri_encoder_io_in_4_T_4 = and(_pri_encoder_io_in_4_T_1, _pri_encoder_io_in_4_T_3) @[ALUControl.scala 32:45]
    node _pri_encoder_io_in_4_T_5 = bits(io_in_ALUOp, 0, 0) @[ALUControl.scala 32:79]
    node _pri_encoder_io_in_4_T_6 = and(_pri_encoder_io_in_4_T_4, _pri_encoder_io_in_4_T_5) @[ALUControl.scala 32:65]
    node _pri_encoder_io_in_4_T_7 = eq(io_func_func7, UInt<1>("h0")) @[ALUControl.scala 34:9]
    node _pri_encoder_io_in_4_T_8 = and(_pri_encoder_io_in_4_T_6, _pri_encoder_io_in_4_T_7) @[ALUControl.scala 34:6]
    node _pri_encoder_io_in_5_T = bits(io_in_ALUOp, 2, 2) @[ALUControl.scala 36:28]
    node _pri_encoder_io_in_5_T_1 = eq(_pri_encoder_io_in_5_T, UInt<1>("h0")) @[ALUControl.scala 36:16]
    node _pri_encoder_io_in_5_T_2 = bits(io_in_ALUOp, 1, 1) @[ALUControl.scala 36:49]
    node _pri_encoder_io_in_5_T_3 = eq(_pri_encoder_io_in_5_T_2, UInt<1>("h0")) @[ALUControl.scala 36:36]
    node _pri_encoder_io_in_5_T_4 = and(_pri_encoder_io_in_5_T_1, _pri_encoder_io_in_5_T_3) @[ALUControl.scala 36:33]
    node _pri_encoder_io_in_5_T_5 = bits(io_in_ALUOp, 0, 0) @[ALUControl.scala 36:69]
    node _pri_encoder_io_in_5_T_6 = and(_pri_encoder_io_in_5_T_4, _pri_encoder_io_in_5_T_5) @[ALUControl.scala 36:55]
    node _pri_encoder_io_in_5_T_7 = and(_pri_encoder_io_in_5_T_6, io_func_func7) @[ALUControl.scala 38:6]
    node _pri_encoder_io_in_6_T = and(io_func_func7, pri_encoder.io_in_5) @[ALUControl.scala 39:43]
    node _pri_encoder_io_in_6_T_1 = bits(io_func_func3, 0, 0) @[ALUControl.scala 40:30]
    node _pri_encoder_io_in_6_T_2 = bits(io_func_func3, 1, 1) @[ALUControl.scala 40:52]
    node _pri_encoder_io_in_6_T_3 = eq(_pri_encoder_io_in_6_T_2, UInt<1>("h0")) @[ALUControl.scala 40:38]
    node _pri_encoder_io_in_6_T_4 = and(_pri_encoder_io_in_6_T_1, _pri_encoder_io_in_6_T_3) @[ALUControl.scala 40:35]
    node _pri_encoder_io_in_6_T_5 = bits(io_func_func3, 2, 2) @[ALUControl.scala 40:73]
    node _pri_encoder_io_in_6_T_6 = and(_pri_encoder_io_in_6_T_4, _pri_encoder_io_in_6_T_5) @[ALUControl.scala 40:57]
    node _pri_encoder_io_in_6_T_7 = and(_pri_encoder_io_in_6_T, _pri_encoder_io_in_6_T_6) @[ALUControl.scala 40:13]
    node _pri_encoder_io_in_7_T = eq(pri_encoder.io_in_6, UInt<1>("h0")) @[ALUControl.scala 41:28]
    node _pri_encoder_io_in_7_T_1 = eq(pri_encoder.io_in_0, UInt<1>("h0")) @[ALUControl.scala 42:16]
    node _pri_encoder_io_in_7_T_2 = and(_pri_encoder_io_in_7_T, _pri_encoder_io_in_7_T_1) @[ALUControl.scala 42:13]
    node _pri_encoder_io_in_7_T_3 = eq(pri_encoder.io_in_1, UInt<1>("h0")) @[ALUControl.scala 42:42]
    node _pri_encoder_io_in_7_T_4 = and(_pri_encoder_io_in_7_T_2, _pri_encoder_io_in_7_T_3) @[ALUControl.scala 42:39]
    node _pri_encoder_io_in_7_T_5 = eq(pri_encoder.io_in_2, UInt<1>("h0")) @[ALUControl.scala 44:9]
    node _pri_encoder_io_in_7_T_6 = and(_pri_encoder_io_in_7_T_4, _pri_encoder_io_in_7_T_5) @[ALUControl.scala 44:6]
    node _pri_encoder_io_in_7_T_7 = eq(pri_encoder.io_in_3, UInt<1>("h0")) @[ALUControl.scala 44:35]
    node _pri_encoder_io_in_7_T_8 = and(_pri_encoder_io_in_7_T_6, _pri_encoder_io_in_7_T_7) @[ALUControl.scala 44:32]
    node _pri_encoder_io_in_7_T_9 = eq(pri_encoder.io_in_4, UInt<1>("h0")) @[ALUControl.scala 44:61]
    node _pri_encoder_io_in_7_T_10 = and(_pri_encoder_io_in_7_T_8, _pri_encoder_io_in_7_T_9) @[ALUControl.scala 44:58]
    node _pri_encoder_io_in_7_T_11 = eq(pri_encoder.io_in_5, UInt<1>("h0")) @[ALUControl.scala 46:9]
    node _pri_encoder_io_in_7_T_12 = and(_pri_encoder_io_in_7_T_10, _pri_encoder_io_in_7_T_11) @[ALUControl.scala 46:6]
    node _io_out_alu_op_T = cat(UInt<2>("h2"), io_func_func3) @[Cat.scala 30:58]
    node _io_out_alu_op_T_1 = cat(UInt<1>("h0"), io_func_func3) @[Cat.scala 30:58]
    node _io_out_alu_op_T_2 = cat(UInt<1>("h1"), io_func_func3) @[Cat.scala 30:58]
    node _io_out_alu_op_T_3 = cat(UInt<1>("h0"), io_func_func3) @[Cat.scala 30:58]
    node _io_out_alu_op_T_4 = cat(UInt<1>("h0"), io_func_func3) @[Cat.scala 30:58]
    node _io_out_alu_op_T_5 = cat(UInt<1>("h1"), io_func_func3) @[Cat.scala 30:58]
    node _io_out_alu_op_T_6 = eq(UInt<1>("h1"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_7 = mux(_io_out_alu_op_T_6, _io_out_alu_op_T, UInt<5>("h1f")) @[Mux.scala 80:57]
    node _io_out_alu_op_T_8 = eq(UInt<2>("h2"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_9 = mux(_io_out_alu_op_T_8, _io_out_alu_op_T_1, _io_out_alu_op_T_7) @[Mux.scala 80:57]
    node _io_out_alu_op_T_10 = eq(UInt<2>("h3"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_11 = mux(_io_out_alu_op_T_10, _io_out_alu_op_T_2, _io_out_alu_op_T_9) @[Mux.scala 80:57]
    node _io_out_alu_op_T_12 = eq(UInt<3>("h4"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_13 = mux(_io_out_alu_op_T_12, _io_out_alu_op_T_3, _io_out_alu_op_T_11) @[Mux.scala 80:57]
    node _io_out_alu_op_T_14 = eq(UInt<3>("h5"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_15 = mux(_io_out_alu_op_T_14, _io_out_alu_op_T_4, _io_out_alu_op_T_13) @[Mux.scala 80:57]
    node _io_out_alu_op_T_16 = eq(UInt<3>("h6"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_17 = mux(_io_out_alu_op_T_16, _io_out_alu_op_T_5, _io_out_alu_op_T_15) @[Mux.scala 80:57]
    node _io_out_alu_op_T_18 = eq(UInt<3>("h7"), pri_encoder.io_out) @[Mux.scala 80:60]
    node _io_out_alu_op_T_19 = mux(_io_out_alu_op_T_18, UInt<1>("h0"), _io_out_alu_op_T_17) @[Mux.scala 80:57]
    io_out_alu_op <= _io_out_alu_op_T_19 @[ALUControl.scala 48:17]
    pri_encoder.clock <= clock
    pri_encoder.reset <= reset
    pri_encoder.io_in_0 <= _pri_encoder_io_in_0_T_5 @[ALUControl.scala 23:24]
    pri_encoder.io_in_1 <= _pri_encoder_io_in_1_T_6 @[ALUControl.scala 25:12]
    pri_encoder.io_in_2 <= _pri_encoder_io_in_2_T_9 @[ALUControl.scala 27:12]
    pri_encoder.io_in_3 <= _pri_encoder_io_in_3_T_8 @[ALUControl.scala 30:12]
    pri_encoder.io_in_4 <= _pri_encoder_io_in_4_T_8 @[ALUControl.scala 32:24]
    pri_encoder.io_in_5 <= _pri_encoder_io_in_5_T_7 @[ALUControl.scala 36:12]
    pri_encoder.io_in_6 <= _pri_encoder_io_in_6_T_7 @[ALUControl.scala 39:24]
    pri_encoder.io_in_7 <= _pri_encoder_io_in_7_T_12 @[ALUControl.scala 41:24]

  module DataMem :
    input clock : Clock
    input reset : UInt<1>
    input io_in_data_in : SInt<32>
    input io_in_addr : UInt<5>
    input io_in_mem_read : UInt<1>
    input io_in_mem_write : UInt<1>
    output io_data : SInt<32>

    mem DataMem : @[DataMem.scala 19:20]
      data-type => SInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_data_MPORT
      writer => MPORT
      read-under-write => undefined
    node _GEN_0 = validif(io_in_mem_read, io_in_addr) @[DataMem.scala 23:30 DataMem.scala 24:28]
    node _GEN_1 = validif(io_in_mem_read, clock) @[DataMem.scala 23:30 DataMem.scala 24:28]
    node _GEN_2 = mux(io_in_mem_read, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 23:30 DataMem.scala 24:28 DataMem.scala 19:20]
    node _GEN_3 = validif(io_in_mem_write, io_in_addr) @[DataMem.scala 21:25]
    node _GEN_4 = validif(io_in_mem_write, clock) @[DataMem.scala 21:25]
    node _GEN_5 = mux(io_in_mem_write, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 21:25 DataMem.scala 19:20]
    node _GEN_6 = validif(io_in_mem_write, UInt<1>("h1")) @[DataMem.scala 21:25]
    node _GEN_7 = validif(io_in_mem_write, io_in_data_in) @[DataMem.scala 21:25]
    node _GEN_8 = validif(eq(io_in_mem_write, UInt<1>("h0")), _GEN_0) @[DataMem.scala 21:25]
    node _GEN_9 = validif(eq(io_in_mem_write, UInt<1>("h0")), _GEN_1) @[DataMem.scala 21:25]
    node _GEN_10 = mux(io_in_mem_write, UInt<1>("h0"), _GEN_2) @[DataMem.scala 21:25 DataMem.scala 19:20]
    io_data is invalid
    DataMem.io_data_MPORT.addr <= _GEN_8
    DataMem.io_data_MPORT.en <= _GEN_10
    DataMem.io_data_MPORT.clk <= _GEN_9
    DataMem.MPORT.addr <= _GEN_3
    DataMem.MPORT.en <= _GEN_5
    DataMem.MPORT.clk <= _GEN_4
    DataMem.MPORT.data <= _GEN_7
    DataMem.MPORT.mask <= _GEN_6

  module InstrDecoder :
    input clock : Clock
    input reset : UInt<1>
    input io_instr : UInt<32>
    output io_opcode : UInt<7>
    output io_rf_out_reg_src_a : UInt<5>
    output io_rf_out_reg_src_b : UInt<5>
    output io_rf_out_reg_dest : UInt<5>
    output io_ac_out_func3 : UInt<3>
    output io_ac_out_func7 : UInt<1>

    node _io_opcode_T = bits(io_instr, 6, 0) @[InstrDecoder.scala 15:24]
    node _io_rf_out_reg_dest_T = bits(io_instr, 11, 7) @[InstrDecoder.scala 16:33]
    node _io_ac_out_func3_T = bits(io_instr, 14, 12) @[InstrDecoder.scala 17:30]
    node _io_rf_out_reg_src_a_T = bits(io_instr, 19, 15) @[InstrDecoder.scala 18:34]
    node _io_rf_out_reg_src_b_T = bits(io_instr, 24, 20) @[InstrDecoder.scala 19:34]
    node _io_ac_out_func7_T = bits(io_instr, 30, 30) @[InstrDecoder.scala 20:30]
    io_opcode <= _io_opcode_T @[InstrDecoder.scala 15:13]
    io_rf_out_reg_src_a <= _io_rf_out_reg_src_a_T @[InstrDecoder.scala 18:23]
    io_rf_out_reg_src_b <= _io_rf_out_reg_src_b_T @[InstrDecoder.scala 19:23]
    io_rf_out_reg_dest <= _io_rf_out_reg_dest_T @[InstrDecoder.scala 16:22]
    io_ac_out_func3 <= _io_ac_out_func3_T @[InstrDecoder.scala 17:19]
    io_ac_out_func7 <= _io_ac_out_func7_T @[InstrDecoder.scala 20:19]

  module JALRAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_read_data_1 : SInt<32>
    input io_jalr : SInt<32>
    output io_computed_addr : SInt<32>

    node _io_computed_addr_T = add(io_read_data_1, io_jalr) @[JALRAdder.scala 11:39]
    node _io_computed_addr_T_1 = tail(_io_computed_addr_T, 1) @[JALRAdder.scala 11:39]
    node _io_computed_addr_T_2 = asSInt(_io_computed_addr_T_1) @[JALRAdder.scala 11:39]
    node _io_computed_addr_T_3 = and(_io_computed_addr_T_2, asSInt(UInt<2>("h2"))) @[JALRAdder.scala 11:50]
    node _io_computed_addr_T_4 = asSInt(_io_computed_addr_T_3) @[JALRAdder.scala 11:50]
    io_computed_addr <= _io_computed_addr_T_4 @[JALRAdder.scala 11:20]

  module Core :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>
    output io_instr : UInt<32>

    inst pc of PC @[Core.scala 15:18]
    inst reg_file of RegisterFile @[Core.scala 16:24]
    inst controller of Controller @[Core.scala 18:26]
    inst imm_gen of ImmGen @[Core.scala 19:23]
    inst alu of ALU @[Core.scala 20:19]
    inst alu_ctrl of ALUControl @[Core.scala 21:24]
    inst data_mem of DataMem @[Core.scala 22:24]
    inst instr_decoder of InstrDecoder @[Core.scala 23:29]
    inst jalr_adder of JALRAdder @[Core.scala 24:26]
    mem mem : @[Core.scala 26:16]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_instr_MPORT
      read-under-write => undefined
    node _io_instr_T = bits(pc.io_addr, 11, 2) @[Core.scala 27:29]
    node _alu_io_operand_a_T = asSInt(pc.io_addr) @[Core.scala 57:27]
    node _alu_io_operand_a_T_1 = asSInt(pc.io_pc_out) @[Core.scala 58:29]
    node _alu_io_operand_a_T_2 = eq(UInt<1>("h1"), controller.io_out_operand_a) @[Mux.scala 80:60]
    node _alu_io_operand_a_T_3 = mux(_alu_io_operand_a_T_2, _alu_io_operand_a_T, reg_file.io_read_data_1) @[Mux.scala 80:57]
    node _alu_io_operand_a_T_4 = eq(UInt<2>("h2"), controller.io_out_operand_a) @[Mux.scala 80:60]
    node _alu_io_operand_a_T_5 = mux(_alu_io_operand_a_T_4, _alu_io_operand_a_T_1, _alu_io_operand_a_T_3) @[Mux.scala 80:57]
    node _alu_io_operand_a_T_6 = eq(UInt<2>("h3"), controller.io_out_operand_a) @[Mux.scala 80:60]
    node _alu_io_operand_a_T_7 = mux(_alu_io_operand_a_T_6, reg_file.io_read_data_1, _alu_io_operand_a_T_5) @[Mux.scala 80:57]
    node _alu_io_operand_b_T = eq(UInt<1>("h1"), controller.io_out_extend_sel) @[Mux.scala 80:60]
    node _alu_io_operand_b_T_1 = mux(_alu_io_operand_b_T, imm_gen.io_out_s_type, imm_gen.io_out_i_type) @[Mux.scala 80:57]
    node _alu_io_operand_b_T_2 = eq(UInt<2>("h2"), controller.io_out_extend_sel) @[Mux.scala 80:60]
    node _alu_io_operand_b_T_3 = mux(_alu_io_operand_b_T_2, imm_gen.io_out_u_type, _alu_io_operand_b_T_1) @[Mux.scala 80:57]
    node _alu_io_operand_b_T_4 = eq(UInt<2>("h3"), controller.io_out_extend_sel) @[Mux.scala 80:60]
    node _alu_io_operand_b_T_5 = mux(_alu_io_operand_b_T_4, asSInt(UInt<1>("h0")), _alu_io_operand_b_T_3) @[Mux.scala 80:57]
    node _alu_io_operand_b_T_6 = mux(controller.io_out_operand_b, _alu_io_operand_b_T_5, reg_file.io_read_data_2) @[Core.scala 64:26]
    node _data_mem_io_in_addr_T = asUInt(alu.io_data) @[Core.scala 84:38]
    node _pc_io_pc_in_T = asSInt(pc.io_addr) @[Core.scala 99:53]
    node _pc_io_pc_in_T_1 = add(imm_gen.io_out_uj_type, _pc_io_pc_in_T) @[Core.scala 99:40]
    node _pc_io_pc_in_T_2 = tail(_pc_io_pc_in_T_1, 1) @[Core.scala 99:40]
    node _pc_io_pc_in_T_3 = asSInt(_pc_io_pc_in_T_2) @[Core.scala 99:40]
    node _pc_io_pc_in_T_4 = asUInt(_pc_io_pc_in_T_3) @[Core.scala 99:61]
    node _pc_io_pc_in_T_5 = asUInt(jalr_adder.io_computed_addr) @[Core.scala 100:46]
    node _pc_io_pc_in_T_6 = and(alu.io_branch, controller.io_out_branch) @[Core.scala 102:24]
    node _pc_io_pc_in_T_7 = asSInt(pc.io_addr) @[Core.scala 103:46]
    node _pc_io_pc_in_T_8 = add(imm_gen.io_out_sb_type, _pc_io_pc_in_T_7) @[Core.scala 103:33]
    node _pc_io_pc_in_T_9 = tail(_pc_io_pc_in_T_8, 1) @[Core.scala 103:33]
    node _pc_io_pc_in_T_10 = asSInt(_pc_io_pc_in_T_9) @[Core.scala 103:33]
    node _pc_io_pc_in_T_11 = asUInt(_pc_io_pc_in_T_10) @[Core.scala 103:54]
    node _pc_io_pc_in_T_12 = mux(_pc_io_pc_in_T_6, _pc_io_pc_in_T_11, pc.io_pc_out) @[Core.scala 101:20]
    node _pc_io_pc_in_T_13 = eq(UInt<1>("h1"), controller.io_out_next_pc) @[Mux.scala 80:60]
    node _pc_io_pc_in_T_14 = mux(_pc_io_pc_in_T_13, _pc_io_pc_in_T_4, pc.io_pc_out) @[Mux.scala 80:57]
    node _pc_io_pc_in_T_15 = eq(UInt<2>("h2"), controller.io_out_next_pc) @[Mux.scala 80:60]
    node _pc_io_pc_in_T_16 = mux(_pc_io_pc_in_T_15, _pc_io_pc_in_T_5, _pc_io_pc_in_T_14) @[Mux.scala 80:57]
    node _pc_io_pc_in_T_17 = eq(UInt<2>("h3"), controller.io_out_next_pc) @[Mux.scala 80:60]
    node _pc_io_pc_in_T_18 = mux(_pc_io_pc_in_T_17, _pc_io_pc_in_T_12, _pc_io_pc_in_T_16) @[Mux.scala 80:57]
    node _reg_file_io_data_T = mux(controller.io_out_mem_to_reg, data_mem.io_data, alu.io_data) @[Core.scala 110:26]
    io_out <= UInt<1>("h0") @[Core.scala 13:10]
    io_instr <= mem.io_instr_MPORT.data @[Core.scala 27:12]
    pc.clock <= clock
    pc.reset <= reset
    pc.io_pc_in <= _pc_io_pc_in_T_18 @[Core.scala 94:15]
    reg_file.clock <= clock
    reg_file.reset <= reset
    reg_file.io_id_in_reg_src_a <= instr_decoder.io_rf_out_reg_src_a @[Core.scala 43:27]
    reg_file.io_id_in_reg_src_b <= instr_decoder.io_rf_out_reg_src_b @[Core.scala 43:27]
    reg_file.io_id_in_reg_dest <= instr_decoder.io_rf_out_reg_dest @[Core.scala 43:27]
    reg_file.io_reg_write <= controller.io_out_reg_write @[Core.scala 116:25]
    reg_file.io_data <= _reg_file_io_data_T @[Core.scala 110:20]
    controller.clock <= clock
    controller.reset <= reset
    controller.io_opcode <= instr_decoder.io_opcode @[Core.scala 40:27]
    imm_gen.clock <= clock
    imm_gen.reset <= reset
    imm_gen.io_instr <= instr_decoder.io_instr @[Core.scala 46:20]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_operand_a <= _alu_io_operand_a_T_7 @[Core.scala 52:20]
    alu.io_operand_b <= _alu_io_operand_b_T_6 @[Core.scala 64:20]
    alu.io_alu_op <= alu_ctrl.io_out_alu_op @[Core.scala 81:17]
    alu_ctrl.clock <= clock
    alu_ctrl.reset <= reset
    alu_ctrl.io_in_ALUOp <= controller.io_out_alu_op @[Core.scala 80:24]
    alu_ctrl.io_func_func3 <= instr_decoder.io_ac_out_func3 @[Core.scala 49:27]
    alu_ctrl.io_func_func7 <= instr_decoder.io_ac_out_func7 @[Core.scala 49:27]
    data_mem.clock <= clock
    data_mem.reset <= reset
    data_mem.io_in_data_in <= reg_file.io_read_data_2 @[Core.scala 85:26]
    data_mem.io_in_addr <= bits(_data_mem_io_in_addr_T, 4, 0) @[Core.scala 84:23]
    data_mem.io_in_mem_read <= controller.io_out_mem_read @[Core.scala 86:27]
    data_mem.io_in_mem_write <= controller.io_out_mem_write @[Core.scala 87:28]
    instr_decoder.clock <= clock
    instr_decoder.reset <= reset
    instr_decoder.io_instr <= io_instr @[Core.scala 37:26]
    jalr_adder.clock <= clock
    jalr_adder.reset <= reset
    jalr_adder.io_read_data_1 <= reg_file.io_read_data_1 @[Core.scala 90:29]
    jalr_adder.io_jalr <= imm_gen.io_out_i_type @[Core.scala 91:22]
    mem.io_instr_MPORT.addr <= _io_instr_T @[Core.scala 27:18]
    mem.io_instr_MPORT.en <= UInt<1>("h1") @[Core.scala 27:18]
    mem.io_instr_MPORT.clk <= clock @[Core.scala 27:18]
