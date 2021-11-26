`timescale 1ns/1ns

module PC (input clk ,rst ,write_en ,input [31 :0] pc_next ,output reg[31 :0] PC_if);

  always @ (posedge clk ,posedge rst) begin
    if (rst) PC_if <= 32'b 0;
    else if(write_en) PC_if <= pc_next;
  end

endmodule