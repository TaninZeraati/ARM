module Memory(input clk,rst,MEMread,MEMwrite,
                input [31:0] address,data,
                output [31:0] MEMresult);
  
  Data_Memory data_memory(.clk(clk),
        .rst(rst),
        .MEMread(MEMread),
        .MEMwrite(MEMwrite),
        .address(address),
        .data(data),
        .MEMresult(MEMresult));
  
endmodule
