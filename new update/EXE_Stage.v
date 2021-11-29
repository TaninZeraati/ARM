module EXE_Stage(input clk,
                input [3:0] EXE_CMD,
                input MEM_R_EN,MEM_W_EN,
                input [31:0] PC,Val_Rn,Val_Rm,
                input imm,
                input [11:0] Shift_operand,
                input [23:0] Signed_imm_24,
                input [3:0] SR,
                output [31:0] ALU_result,Br_addr,
                output [3:0] status);
                
  wire MEM;
  wire [31:0] Val2;
  wire [31:0] Br_Im,_Br_Im;
  
  assign Br_Im={{8{Signed_imm_24[23]}},Signed_imm_24}<<2;
  //assign Br_Im=_Br_Im<<2;
  
  or o(MEM,MEM_R_EN,MEM_W_EN);
  
  ALU alu(Val_Rn,Val2,EXE_CMD,SR[1],ALU_result,status);
  Val2Generator v2g(Val_Rm,Shift_operand,imm,MEM,Val2);
  Adder #(32) a(PC,Br_Im,Br_addr);
  
endmodule