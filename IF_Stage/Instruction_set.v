`timescale 1ns/1ns

module Instrcution_set (input[31 :0] address ,output [31 :0] instructionOut);
  reg [7 :0] instruction[0 : 4095];
  initial begin $readmemb("instructions.txt", instruction); end
  assign instructionOut = {instruction[address] ,instruction[address + 1] ,instruction[address + 2] ,instruction[address + 3]};
endmodule // InstrcutionSet

