module Data_Memory(input clk,rst,MEMread,MEMwrite,
                input [31:0]address,
                input [31:0]data,
                output [31:0]MEMresult);

  reg [7:0]memory[0:63];
  wire [31:0] addr;
  
  assign addr={address[31:2],2'b00}-32'd1024;
  
  initial begin
    $readmemh("memory_file.data", memory);
  end
  
  always@(posedge clk, posedge rst) begin
    if(rst)
      $readmemh("memory_file.data",memory);
    else if(MEMwrite) begin
        memory[addr]=data[31:24];
        memory[addr+1]=data[23:16];
        memory[addr+2]=data[15:8];
        memory[addr+3]=data[7:0];
    end
  end  
  
  assign MEMresult={memory[addr],memory[addr+1],memory[addr+2],memory[addr+3]};
endmodule
