module MEM_Stage(input clk,rst,MEMread,MEMwrite,
                input [31:0] address,data,
                output [31:0] MEMresult);
  
  Data_Mem dm(clk,rst,MEMwrite,MEMread,address,data,MEMresult);
  
endmodule