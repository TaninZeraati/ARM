`timescale 1ns/1ns

module IF_Stage(input clk,rst,freeze,Branch_taken,input[31:0] BranchAddr, output [31:0] PC_if,Instruction);
  
  wire[31:0] pc_next,npc;
  Adder ad(4, PC_if,pc_next);
  
  mux_2in #(.N(32)) mx(BranchAddr, pc_next,Branch_taken,npc);
  PC pc0(clk,rst,~freeze,npc,PC_if);
  
  //Instruction_set instset(PC_if,Instruction);
  reg [7 :0] instruction[0 : 255];
  initial begin $readmemb("instructions.txt", instruction); end
  assign Instruction = {instruction[PC_if] ,instruction[PC_if + 1] ,instruction[PC_if + 2] ,instruction[PC_if + 3]};
  
  
endmodule
