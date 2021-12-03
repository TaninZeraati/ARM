module StatusRegister(input clk,rst,change_status,
                      input [3:0] status_in,
                      output reg [3:0] status_out);
  
  always@(negedge clk,posedge rst)begin
    if(rst)
	    status_out<=4'b0000;
    else if(change_status)
      status_out<=status_in;
  end
  
endmodule