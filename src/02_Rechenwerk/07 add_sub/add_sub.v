// File: add_sub.v
// Desc: 1-Bit Voll-Addierer mit Subtraktionsfunktion

`timescale 1ns/1ps

module add_sub (
  input  A,
  input  B,
  input  Cin,
  input  Binv,
  output Sum,
  output Cout);

  wire B_xor;

  // if Binv == 1 invert input B and assign value to B_xor
  // if Binv == 0 assign B to B_xor
  assign B_xor = Binv ? ~B : B;
    
  // assign Sum and Cout
  assign Sum  = (A ^ B_xor ^ Cin);
  assign Cout = (A & B_xor) | (A & Cin) | (B_xor & Cin);

  // alternative version mit XOR
  // assign Sum = (A ^ (B ^ Binv) ^ Cin);
  // assign Cout = (A & (B ^ Binv)) | (A & Cin) | ((B ^ Binv) & Cin);

endmodule