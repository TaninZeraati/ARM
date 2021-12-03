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
                
  wire [31:0] alu_b;
  wire [31:0] branch_immediate;
  
  assign branch_immediate={{8{Signed_imm_24[23]}},Signed_imm_24}<<2;
  
  or _or(memory_type_instruction,MEM_R_EN,MEM_W_EN);
  
  ALU alu(.a(Val_Rn),
        .b(alu_b),
        .EXE_CMD(EXE_CMD),
        .c(SR[1]),
        .result(ALU_result),
        .SR(status));
  Shifter shifter(.Val_Rm(Val_Rm),
        .Shift_operand(Shift_operand),
        .imm(imm),
        .memory_type_instruction(memory_type_instruction),
        .alu_b(alu_b));
  Adder #(32) adder(.a(PC),
        .b(branch_immediate),
        .result(Br_addr));
  
endmodule
