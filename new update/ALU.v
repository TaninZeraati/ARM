module ALU(input [31:0] a,b,input [3:0] EXE_CMD,input c, output reg [31:0] w, output [3:0] SR);
  
  reg C,V;
  wire N,Z;
  
  always@(*)begin
    if(EXE_CMD==3'b0001)      w=b;      //MOV
    else if(EXE_CMD==4'b1001) w=~b;     //MOVN
    else if(EXE_CMD==4'b0010) begin   	 //ADD,LDR,STR
      {C,w}=a+b; 
      V=(a[31]==b[31])&(a[31]!=w[31]);
    end
    else if(EXE_CMD==4'b0011) begin     //ADC
      {C,w}=a+b+{31'b0,c};
      V=(a[31]==b[31]);
    end
    else if(EXE_CMD==4'b0100) begin     //SUB,CMP
      {C,w}=a-b;
      V=(a[31]!=b[31])&(a[31]!=w[31]);
    end
    else if(EXE_CMD==4'b0101) begin     //SBC
      {C,w}=a-b-{31'b0,~c};
      V=(a[31]==b[31])&(a[31]!=w[31]);
    end
    else if(EXE_CMD==4'b0110) w=a&b;    //AND,TST
    else if(EXE_CMD==4'b0111) w=a|b;    //ORR
    else if(EXE_CMD==4'b1000) w=a^b;    //EOR
  end
  
  assign N=w[31];  //N
  assign Z=(w==32'b0); //Z
  assign SR={N,Z,C,V};
  //assign SR[1]=(EXE_CMD==3'b0010 || EXE_CMD==3'b0011 || EXE_CMD==3'b0100 || EXE_CMD==3'b0101); //C
  //assign SR[0]=(EXE_CMD==3'b0010 || EXE_CMD==3'b0011 || EXE_CMD==3'b0100 || EXE_CMD==3'b0101); //V
  
endmodule