module Shifter(input [31:0] Val_Rm,
               input [11:0] operand_of_shift,
               input immediate,mem_type,
               output reg [31:0] second_value);
      
  reg [4:0] imm_rot;
  reg [39:0] immed,first_val;
  reg [63:0] second_val;
  
  always@(*)begin
    if(mem_type)
      second_value={{20{operand_of_shift[11]}},operand_of_shift};
    else if(immediate) begin
      imm_rot={operand_of_shift[11:8],1'b0};
      first_val = {operand_of_shift[7:0],24'b000000000000000000000000,operand_of_shift[7:0]}>>imm_rot;
      second_value=first_val[31:0];
    end
    else if(operand_of_shift[4]==0) begin
      if(operand_of_shift[6:5]==2'b00) second_value=Val_Rm<<operand_of_shift[11:7];
      if(operand_of_shift[6:5]==2'b01) second_value=Val_Rm>>operand_of_shift[11:7];
      if(operand_of_shift[6:5]==2'b10) second_value=Val_Rm>>>operand_of_shift[11:7];
      if(operand_of_shift[6:5]==2'b11) begin
        second_val={Val_Rm,Val_Rm}>>operand_of_shift[11:7];
        second_value=second_val[31:0];
      end
    end
  end 
endmodule
