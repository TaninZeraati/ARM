module IF_Stage(input clk,rst,freeze,Branch_taken,
                input [31:0] BranchAddr,
                output [31:0] PC,Instruction);
  
  wire [31:0] pc;
  
  Instruction_Memory ins_mem(rst, pc, Instruction);
  PC_Handler pc_handler(clk,rst,freeze,Branch_taken,BranchAddr,pc);
  Adder #(32) adder(pc,32'd4,PC);

endmodule