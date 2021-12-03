module ALU(input [31:0] Al,m2,input [3:0] exe_cmd_in,input c, output reg [31:0] res, output [3:0] SR);
  
  reg C,V;
  wire N,Z;
  
  always@(*)begin
    if(exe_cmd_in==3'b0001)  //MOV
      res=m2;
    else if(exe_cmd_in==4'b1001) //MOVN
      res=~m2;
    else if(exe_cmd_in==4'b0010) begin //ADD,LDR,STR
      {C,res}=Al+m2; 
      V=(Al[31]==m2[31])&(Al[31]!=res[31]);
    end
    else if(exe_cmd_in==4'b0011) begin //ADC
      {C,res}=Al+m2+{31'b0,c};
      V=(Al[31]==m2[31]);
    end
    else if(exe_cmd_in==4'b0100) begin //SUB,CMP
      {C,res}=Al-m2;
      V=(Al[31]!=m2[31])&(Al[31]!=res[31]);
    end
    else if(exe_cmd_in==4'b0101) begin //SBC
      {C,res}=Al-m2-{31'b0,~c};
      V=(Al[31]==m2[31])&(Al[31]!=res[31]);
    end
    else if(exe_cmd_in==4'b0110) //AND,TST
      res=Al&m2;
    else if(exe_cmd_in==4'b0111) //ORR
      res=Al|m2;
    else if(exe_cmd_in==4'b1000) //EOR
      res=Al^m2;
  end
  
  assign N=res[31];  //N
  assign Z=(res==32'b0); //Z
  assign SR={N,Z,C,V};
  
endmodule