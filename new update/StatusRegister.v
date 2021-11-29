module StatusRegister(input [3:0] newStatus,input s,clk,rst,output reg [3:0] status);
  //initial begin status=4'b0; end
  always@(negedge clk,posedge rst)begin
	  if(rst) status<=4'b0000;
    else if(s) status<=newStatus;
  end
endmodule