module IF_Stage_Reg(input clk,rst,freeze,flush,
                input [31:0] PC_in,Instruction_in,
                output reg [31:0] PC,Instruction);
    
  always@(posedge clk)begin
    if(flush) begin
      PC<=32'd0;
      Instruction<=32'd0;
    end
    else begin
      if(freeze) begin
        PC<=PC;
        Instruction<=Instruction;
      end
      else begin
        PC<=PC_in;
        Instruction<=Instruction_in;
      end
    end
  end
endmodule

