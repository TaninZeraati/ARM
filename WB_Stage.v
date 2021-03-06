module WB_Stage(input [31:0] ALU_result,MEM_result,
                input MEM_R_en,
                output [31:0] out);
  
  Mux #(32) _mux(.a(ALU_result),
        .b(MEM_result),
        .selector(MEM_R_en),
        .result(out));
  
endmodule
