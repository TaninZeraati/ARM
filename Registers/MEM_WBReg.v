`timescale 1ns/1ns

module MEM_WBReg (input clk, rst,input[31: 0] pc_in, instruction_in,
              output reg [31: 0] pc, instruction);

  always @ (posedge clk, posedge rst) begin
    if (rst) begin
      pc <= 0;
      instruction <= 0;
    end
    else if (clk) begin
      instruction <= instruction_in;
      pc <= pc_in;
    end
  end

endmodule


