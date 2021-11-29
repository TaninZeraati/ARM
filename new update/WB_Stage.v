module WB_Stage(input [31:0] ALU_result,MEM_result,
                input MEM_R_en,
                output [31:0] out);
  
  Mux #(32) m(ALU_result,MEM_result,MEM_R_en,out);
  
endmodule