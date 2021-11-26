`timescale 1ns/1ns

module mux_2in#(parameter N)(a ,b ,c ,out);
      input [N-1 : 0] a ,b;
      input c;
      output [N-1 :0] out;

      assign out = c ? a : b;

endmodule 


