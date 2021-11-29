module Data_Mem(input clk,rst,Memwf,MemRead,input [31:0]add,input [31:0]Memwdata,output [31:0]R);
  reg [7:0]Mem[0:63];
  wire [31:0] addr;
  assign addr={add[31:2],2'b00}-32'd1024;
  initial begin
    $readmemh("mem.data", Mem);
  end
  assign R={Mem[addr],Mem[addr+1],Mem[addr+2],Mem[addr+3]};
  always@(posedge clk, posedge rst) begin
    if(rst)
      $readmemh("mem.data",Mem);
    else if(Memwf) begin
        Mem[addr]=Memwdata[31:24];
        Mem[addr+1]=Memwdata[23:16];
        Mem[addr+2]=Memwdata[15:8];
        Mem[addr+3]=Memwdata[7:0];
    end
  end
endmodule