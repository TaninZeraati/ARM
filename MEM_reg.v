module MEM_reg(input clk,rst,WB_en_in,MEM_R_en_in,
               input [31:0] ALU_result_in, Mem_read_value_in,
               input [3:0] Dest_in,
                      
               output reg WB_en,MEM_R_en,
               output reg [31:0] ALU_result,Mem_read_value,
               output reg [3:0] Dest);
  
  always@(posedge clk)begin
    WB_en<=WB_en_in;
    MEM_R_en<=MEM_R_en_in;
    Dest<=Dest_in;
    ALU_result<=ALU_result_in;
    Mem_read_value<=Mem_read_value_in;
  end
endmodule
