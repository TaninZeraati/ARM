module TB();
  
  reg clk,rst;
  wire [31:0] IF_Stage_pc;
  ARM cut(.clk(clk),
        .rst(rst),
        .IF_Stage_pc(IF_Stage_pc));
  
  initial begin
    #10 clk=1; rst=1;
    #10 clk=0; rst=0;
    repeat(600) #10 clk=~clk;
  end
endmodule
