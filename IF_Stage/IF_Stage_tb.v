`timescale 1ns/1ns

module IF_Stage_tb ();

  reg clk, rst;
  wire[31 :0] instruction, pc;

  IF_Stage if_stage(.clk(clk) ,.rst(rst) ,.freeze(1'b0) ,.Branch_taken(1'b0) ,.BranchAddr(32'b 0),.Instruction(instruction), .PC_if(pc));

  always #5 clk=~clk;
  initial begin
    rst=1;clk=1;#20
    rst=0; #220
    $stop;
  end

endmodule


