// File: mod_full_adder.v
// Desc: Modifizierter 1-Bit Voll-Addierer für Carry-Look-Ahead-Logik

`timescale  1ns/1ps

module mod_full_adder (input  wire A, B, Cin,
                       output wire Sum, p, g);

  xor  #2 U1 (Sum, A, B, Cin);
  or   #1 U2 (p, A, B);
  and  #1 U3 (g, A, B);

endmodule