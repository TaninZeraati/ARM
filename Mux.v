module Mux#(parameter n=9)(input [n-1:0] a,b,input selector,output [n-1:0]result);
  assign result = selector?b:a;
endmodule

