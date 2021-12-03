module Adder#(parameter n)(input [n-1:0] a,b, output [n-1:0] result);
  assign result = a+b;
endmodule