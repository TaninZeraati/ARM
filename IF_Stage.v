module IF_Stage(input clk,rst,freeze,Branch_taken,
                input [31:0] BranchAddr,
                output [31:0] PC,Instruction);
  
  wire [31:0] buffered_pc;
  
  Instruction_Memory instruction_memory(.rst(rst),
        .pc(buffered_pc),
        .instruction(Instruction));
  PC_Handler pc_handler(.clk(clk),
        .rst(rst),
        .freeze(freeze),
        .Branch_taken(Branch_taken),
        .BranchAddr(BranchAddr),
        .buffered_pc(buffered_pc));
  Adder #(32) adder(.a(buffered_pc),
        .b(32'd4),
        .result(PC));

endmodule
