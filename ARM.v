module ARM(input clk,rst, output [31:0] IFpc);
  
  wire [3:0] Dest_wb,SR,new_status,src1,src2;
  wire [3:0] ID_EXE_CMD,ID_Dest,EXE_EXE_CMD,EXE_Dest,MEM_EXE_CMD,MEM_Dest,WB_Dest;
  wire [11:0] Shift_operand_IN,Shift_operand;
  wire [23:0] Signed_imm_24_IN,Signed_imm_24;
  wire [31:0] IFinstruction,IDinstructionIn,Val_Rn_IN,Val_Rm_IN,Val_Rn,Val_Rm,MEM_Val_Rm;
  wire [31:0] EXE_ALU_result,MEM_ALU_result,WB_ALU_result;
  wire [31:0] IDpc,EXEpcIn,EXEpcOut,MEMpcIn,MEMpcOut,WBpcIn,WBpcOut;
  wire [31:0] BranchAddr,Result_WB,MEM_result,WB_MEM_result;
  
  // Instruction Fetch
  IF_Stage if_stage(.clk(clk),
        .rst(rst),
        .freeze(Hazard_Detected),
        .Branch_taken(Branch_taken),
        .BranchAddr(BranchAddr),
        .PC(IFpc),
        .Instruction(IFinstruction));
  IF_Stage_Reg if_stage_reg(.clk(clk),
        .rst(rst),
        .freeze(Hazard_Detected),
        .flush(Branch_taken),
        .PC_in(IFpc),
        .Instruction_in(IFinstruction),
        .PC(IDpc),
        .Instruction(IDinstructionIn));
  
  // Instruction Decode
  ID_Stage id_stage(.clk(clk),
        .rst(rst),
        .Instruction(IDinstructionIn),
        .Result_WB(Result_WB),
        .writeBackEn(writeBackEn),
        .Dest_wb(Dest_wb),
        .hazard(Hazard_Detected),
        .SR(SR),
        .WB_EN(ID_WB_EN),
        .MEM_R_EN(ID_MEM_R_EN),
        .MEM_W_EN(ID_MEM_W_EN),
        .B(ID_B),
        .S(ID_S),
        .EXE_CMD(ID_EXE_CMD),
        .Val_Rn(Val_Rn_IN),
        .Val_Rm(Val_Rm_IN),
        .imm(imm_IN),
        .Shift_operand(Shift_operand_IN),
        .Signed_imm_24(Signed_imm_24_IN),
        .Dest(ID_Dest),
        .src1(src1),
        .src2(src2),
        .Two_src(Two_Src),
        .Rn_is_valid(Rn_is_valid));
  ID_Stage_Reg id_stage_reg(.clk(clk),
        .rst(rst),
        .flush(Branch_taken),
        .WB_EN_IN(ID_WB_EN),
        .MEM_R_EN_IN(ID_MEM_R_EN),
        .MEM_W_EN_IN(ID_MEM_W_EN),
        .B_IN(ID_B),
        .S_IN(ID_S),
        .EXE_CMD_IN(ID_EXE_CMD),
        .PC_IN(IDpc),
        .Val_Rn_IN(Val_Rn_IN),
        .Val_Rm_IN(Val_Rm_IN),
        .imm_IN(imm_IN),
        .Shift_operand_IN(Shift_operand_IN),
        .Signed_imm_24_IN(Signed_imm_24_IN),
        .Dest_IN(ID_Dest),
        .WB_EN(EXE_WB_EN),
        .MEM_R_EN(EXE_MEM_R_EN),
        .MEM_W_EN(EXE_MEM_W_EN),
        .B(Branch_taken),
        .S(EXE_S),
        .EXE_CMD(EXE_EXE_CMD),
        .PC(EXEpcIn),
        .Val_Rn(Val_Rn),
        .Val_Rm(Val_Rm),
        .imm(imm),
        .Shift_operand(Shift_operand),
        .Signed_imm_24(Signed_imm_24),
        .Dest(EXE_Dest));
  
  // Execution
  EXE_Stage exe_stage(.clk(clk),
        .EXE_CMD(EXE_EXE_CMD),
        .MEM_R_EN(EXE_MEM_R_EN),
        .MEM_W_EN(EXE_MEM_W_EN),
        .PC(EXEpcIn),
        .Val_Rn(Val_Rn),
        .Val_Rm(Val_Rm),
        .imm(imm),
        .Shift_operand(Shift_operand),
        .Signed_imm_24(Signed_imm_24),
        .SR(SR),
        .ALU_result(EXE_ALU_result),
        .Br_addr(BranchAddr),
        .status(new_status));
  EXE_Stage_Reg exe_stage_reg(.clk(clk),
        .rst(rst),
        .WB_en_in(EXE_WB_EN),
        .MEM_R_EN_in(EXE_MEM_R_EN),
        .MEM_W_EN_in(EXE_MEM_W_EN),
        .ALU_result_in(EXE_ALU_result),
        .ST_val_in(Val_Rm),
        .Dest_in(EXE_Dest),
        .WB_en(MEM_WB_EN),
        .MEM_R_EN(MEM_MEM_R_EN),
        .MEM_W_EN(MEM_MEM_W_EN),
        .ALU_result(MEM_ALU_result),
        .ST_val(MEM_Val_Rm),
        .Dest(MEM_Dest));
  
  // Memory Stage
  Memory memory(.clk(clk),
        .rst(rst),
        .MEMread(MEM_MEM_R_EN),
        .MEMwrite(MEM_MEM_W_EN),
        .address(MEM_ALU_result),
        .data(MEM_Val_Rm),
        .MEMresult(MEM_result));
  MEM_reg mem_reg(.clk(clk),
        .rst(rst),
        .WB_en_in(MEM_WB_EN),
        .MEM_R_en_in(MEM_MEM_R_EN),
        .ALU_result_in(MEM_ALU_result),
        .Mem_read_value_in(MEM_result),
        .Dest_in(MEM_Dest),
        .WB_en(writeBackEn),
        .MEM_R_en(WB_MEM_R_EN),
        .ALU_result(WB_ALU_result),
        .Mem_read_value(WB_MEM_result),
        .Dest(Dest_wb));
  
  // WriteBack Stage
  WB_Stage wb_stage(.ALU_result(WB_ALU_result),
        .MEM_result(WB_MEM_result),
        .MEM_R_en(WB_MEM_R_EN),
        .out(Result_WB));

  // Other modules
  HazardDetectionUnit hazard_detection_unit(.src1(src1),
        .src2(src2),
        .Two_Src(Two_Src),
        .Rn_is_valid(Rn_is_valid),
        .Exe_Dest(EXE_Dest),
        .Exe_WB_EN(EXE_WB_EN),
        .Mem_Dest(MEM_Dest),
        .Mem_WB_EN(MEM_WB_EN),
        .Hazard_Detected(Hazard_Detected));
  StatusRegister status_register(.clk(clk),
        .rst(rst),
        .change_status(EXE_S),
        .status_in(new_status),
        .status_out(SR));
  
endmodule