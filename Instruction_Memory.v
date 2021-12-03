module Instruction_Memory(input rst, input[31:0] pc, output[31:0] instruction);
  reg [7:0] instructions[0:512];
  
  initial begin
    $readmemb("test.data",instructions);
  end
  
  always@(posedge rst)begin
    $readmemb("test.data",instructions);
  end
  
  assign instruction={instructions[pc],instructions[pc+1],instructions[pc+2],instructions[pc+3]};
endmodule
