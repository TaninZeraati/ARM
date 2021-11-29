module Mux#(parameter b=9)(input [b-1:0]A,B,input s,output [b-1:0]w);
  assign w=s?B:A;
endmodule


