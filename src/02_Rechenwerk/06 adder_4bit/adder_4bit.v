// File: adder_4bit.v
// Desc: 4-Bit Voll-Addierer (Verhaltensmodell)

`timescale 1ns/1ps

module adder_4bit (input  wire [3:0] A, B,
                   output wire [3:0] Sum,
                   output wire       Cout);

  assign {Cout, Sum} = A + B;
  
endmodule