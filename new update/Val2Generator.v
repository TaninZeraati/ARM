module Val2Generator(input [31:0] Val_Rm,input [11:0] Shift_operand,input imm,MEM,
      output reg [31:0] Val2);
      
  reg [4:0] rotate_imm;
  reg [39:0] immed,_val;
  reg [63:0] __val;
  always@(*)begin
    if(MEM)
      Val2={{20{Shift_operand[11]}},Shift_operand};
    else if(imm) begin
      rotate_imm={Shift_operand[11:8],1'b0};
      immed={Shift_operand[7:0],24'b000000000000000000000000,Shift_operand[7:0]};
      _val=immed>>rotate_imm;
      Val2=_val[31:0];
    end
    else if(Shift_operand[4]==0) begin
      if(Shift_operand[6:5]==2'b00) Val2=Val_Rm<<Shift_operand[11:7];
      if(Shift_operand[6:5]==2'b01) Val2=Val_Rm>>Shift_operand[11:7];
      if(Shift_operand[6:5]==2'b10) Val2=Val_Rm>>>Shift_operand[11:7];
      if(Shift_operand[6:5]==2'b11) begin
        __val={Val_Rm,Val_Rm}>>Shift_operand[11:7];
        Val2=__val[31:0];
      end
    end
  end 
endmodule