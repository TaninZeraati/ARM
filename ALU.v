module ALU(input [31:0] a,b,input [3:0] EXE_CMD,input c, output reg [31:0] result, output [3:0] SR);
  
  reg C,V;
  wire N,Z;
  
  always@(*)begin
    if(EXE_CMD==3'b0001)
      result=b;
    else if(EXE_CMD==4'b1001)
      result=~b;
    else if(EXE_CMD==4'b0010) begin
      {C,result}=a+b;
      V=(a[31]==b[31])&(a[31]!=result[31]);
    end
    else if(EXE_CMD==4'b0011) begin
      {C,result}=a+b+{31'b0,c};
      V=(a[31]==b[31]);
    end
    else if(EXE_CMD==4'b0100) begin
      {C,result}=a-b;
      V=(a[31]!=b[31])&(a[31]!=result[31]);
    end
    else if(EXE_CMD==4'b0101) begin
      {C,result}=a-b-{31'b0,~c};
      V=(a[31]==b[31])&(a[31]!=result[31]);
    end
    else if(EXE_CMD==4'b0110)
      result=a&b;
    else if(EXE_CMD==4'b0111)
      result=a|b;
    else if(EXE_CMD==4'b1000)
      result=a^b;
  end
  
  assign N=result[31];
  assign Z=(result==32'b0);
  assign SR={N,Z,C,V};
  
endmodule
