module PC_Handler(input clk,rst,freeze,Branch_taken,
                  input [31:0] BranchAddr,
                  output [31:0] buffered_pc);
  
  reg [31:0] pc;
  
  always@(posedge clk,posedge rst)begin
    if(rst) begin
      pc<=32'b0;
    end
    else if(Branch_taken)
      pc<=BranchAddr;
    else begin
      if(freeze)
        pc<=pc;
      else
        pc<=pc+32'd4;
    end
  end
  
  assign buffered_pc=pc;
endmodule
