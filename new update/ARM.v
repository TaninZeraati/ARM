module ARM(input clk,rst, output [31:0] IFpc);
  
  wire Branch_taken,Hazard_Detected;
  wire ID_WB_EN,EXE_WB_EN,MEM_WB_EN,WB_WB_EN,writeBackEn;
  wire ID_MEM_R_EN,EXE_MEM_R_EN,MEM_MEM_R_EN,WB_MEM_R_EN;
  wire ID_MEM_W_EN,EXE_MEM_W_EN,MEM_MEM_W_EN;
  wire ID_S,EXE_S,MEM_S,WB_S,ID_B,MEM_B,WB_B;
  wire Two_Src;
  wire [3:0] Dest_wb,SR,newStatus,src1,src2;
  wire [3:0] ID_EXE_CMD,ID_Dest,EXE_EXE_CMD,EXE_Dest,MEM_EXE_CMD,MEM_Dest,WB_Dest;
  wire [11:0] Shift_operand_IN,Shift_operand;
  wire [23:0] Signed_imm_24_IN,Signed_imm_24;
  wire [31:0] IFinstruction,IDinstructionIn,Val_Rn_IN,Val_Rm_IN,Val_Rn,Val_Rm,MEM_Val_Rm;
  wire [31:0] EXE_ALU_result,MEM_ALU_result,WB_ALU_result;
  wire [31:0] IDpc,EXEpcIn,EXEpcOut,MEMpcIn,MEMpcOut,WBpcIn,WBpcOut;
  wire [31:0] BranchAddr,Result_WB,MEM_result,WB_MEM_result;
  
  //assign Hazard_Detected=1'b0;
      
  IF_Stage ifs(clk,rst,Hazard_Detected,Branch_taken,BranchAddr,IFpc,IFinstruction);
  IF_Stage_Reg ifsr(clk,rst,Hazard_Detected,Branch_taken,IFpc,IFinstruction,IDpc,IDinstructionIn);
  
  ID_Stage ids(clk,rst,IDinstructionIn,Result_WB,writeBackEn,Dest_wb,Hazard_Detected,SR,
        ID_WB_EN,ID_MEM_R_EN,ID_MEM_W_EN,ID_B,ID_S,ID_EXE_CMD,
        Val_Rn_IN,Val_Rm_IN,imm_IN,Shift_operand_IN,Signed_imm_24_IN,ID_Dest,
        src1,src2,Two_Src,hasRn);
  ID_Stage_Reg idsr(clk,rst,Branch_taken,ID_WB_EN,ID_MEM_R_EN,ID_MEM_W_EN,ID_B,ID_S,ID_EXE_CMD,
        IDpc,Val_Rn_IN,Val_Rm_IN,imm_IN,Shift_operand_IN,Signed_imm_24_IN,ID_Dest,
        EXE_WB_EN,EXE_MEM_R_EN,EXE_MEM_W_EN,Branch_taken,EXE_S,EXE_EXE_CMD,EXEpcIn,
        Val_Rn,Val_Rm,imm,Shift_operand,Signed_imm_24,EXE_Dest);
        
  HazardDetectionUnit hdu(src1,src2,Two_Src,hasRn,EXE_Dest,EXE_WB_EN,MEM_Dest,MEM_WB_EN,Hazard_Detected);
  
  EXE_Stage exes(clk,EXE_EXE_CMD,EXE_MEM_R_EN,EXE_MEM_W_EN,EXEpcIn,Val_Rn,Val_Rm,imm,
                Shift_operand,Signed_imm_24,SR,EXE_ALU_result,BranchAddr,newStatus);
  EXE_Stage_Reg exesr(clk,rst,EXE_WB_EN,EXE_MEM_R_EN,EXE_MEM_W_EN,EXE_ALU_result,Val_Rm,EXE_Dest,
                MEM_WB_EN,MEM_MEM_R_EN,MEM_MEM_W_EN,MEM_ALU_result,MEM_Val_Rm,MEM_Dest);
  StatusRegister sr(newStatus,EXE_S,clk,rst,SR);
  
  MEM_Stage mems(clk,rst,MEM_MEM_R_EN,MEM_MEM_W_EN,MEM_ALU_result,MEM_Val_Rm,MEM_result);
  MEM_Stage_Reg memsr(clk,rst,MEM_WB_EN,MEM_MEM_R_EN,MEM_ALU_result,MEM_result,MEM_Dest,
                      writeBackEn,WB_MEM_R_EN,WB_ALU_result,WB_MEM_result,Dest_wb);
  
  WB_Stage wbs(WB_ALU_result,WB_MEM_result,WB_MEM_R_EN,Result_WB);
  
endmodule