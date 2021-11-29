module Adder#(parameter b)(input [b-1:0] A,B,output [b-1:0] W);
  assign W=A+B;
endmodule