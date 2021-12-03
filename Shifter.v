module Shifter(input [31:0] Val_Rm,
               input [11:0] Shift_operand,
               input imm,memory_type_instruction,
               output reg [31:0] alu_b);
      
  reg [4:0] rotate_imm;
  reg [39:0] immed,first_pre_value;
  reg [63:0] second_pre_value;
  
  always@(*)begin
    if(memory_type_instruction)
      alu_b={{20{Shift_operand[11]}},Shift_operand};
    else if(imm) begin
      rotate_imm={Shift_operand[11:8],1'b0};
      first_pre_value = {Shift_operand[7:0],24'b000000000000000000000000,Shift_operand[7:0]}>>rotate_imm;
      alu_b=first_pre_value[31:0];
    end
    else if(Shift_operand[4]==0) begin
      if(Shift_operand[6:5]==2'b00)
        alu_b=Val_Rm<<Shift_operand[11:7];
      if(Shift_operand[6:5]==2'b01)
        alu_b=Val_Rm>>Shift_operand[11:7];
      if(Shift_operand[6:5]==2'b10)
        alu_b=Val_Rm>>>Shift_operand[11:7];
      if(Shift_operand[6:5]==2'b11) begin
        second_pre_value={Val_Rm,Val_Rm}>>Shift_operand[11:7];
        alu_b=second_pre_value[31:0];
      end
    end
  end 
endmodule

