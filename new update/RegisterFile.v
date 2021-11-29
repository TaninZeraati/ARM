module RegisterFile(input clk,rst,
                    input [3:0] src1,src2,Dest_wb,
                    input [31:0] Result_WB,
                    input writeBackEn,
                    output [31:0] reg1,reg2);
  
  reg [31:0] registers[0:14];
  
  initial begin
    registers[0]=32'd0; registers[5]=32'd5; registers[10]=32'd10;
    registers[1]=32'd1; registers[6]=32'd6; registers[11]=32'd11;
    registers[2]=32'd2; registers[7]=32'd7; registers[12]=32'd12;
    registers[3]=32'd3; registers[8]=32'd8; registers[13]=32'd13;
    registers[4]=32'd4; registers[9]=32'd9; registers[14]=32'd14;
  end
  
  assign reg1=registers[src1]; assign reg2=registers[src2];
  
  always@(posedge rst,negedge clk)begin
    if(rst) begin
      registers[0]=32'd0; registers[5]=32'd5; registers[10]=32'd10;
      registers[1]=32'd1; registers[6]=32'd6; registers[11]=32'd11;
      registers[2]=32'd2; registers[7]=32'd7; registers[12]=32'd12;
      registers[3]=32'd3; registers[8]=32'd8; registers[13]=32'd13;
      registers[4]=32'd4; registers[9]=32'd9; registers[14]=32'd14;
    end
    else if(writeBackEn)
      registers[Dest_wb]<=Result_WB;
  end
  
endmodule