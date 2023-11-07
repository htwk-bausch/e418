// File: half_adder.v
// Desc: 1-Bit Halb-Addierer

`timescale  1ns/1ps

module half_adder (input  wire A, B,
                   output wire Sum, Cout);

  xor #1 U1 (Sum, A, B);
  and #1 U2 (Cout, A, B);

endmodule