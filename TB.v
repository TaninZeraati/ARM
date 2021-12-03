module TB();
  
  reg clk,rst;
  wire [31:0] IFpc;
  ARM cut(clk,rst,IFpc);
  
  initial begin
    #10 clk=1; rst=1;
    #10 clk=0; rst=0;
    repeat(600) #10 clk=~clk;
  end
endmodule