// File: full_adder.v
// Desc: 1-Bit Voll-Addierer

`timescale 1ns/1ps

module full_adder (input  wire A, B, Cin,
                   output wire Sum, Cout);

  wire HA1_Sum, HA1_Cout, HA2_Cout;

  half_adder U1 (.A(A),       .B(B),  .Sum(HA1_Sum), .Cout(HA1_Cout));
  half_adder U2 (.A(HA1_Sum), .B(Cin),.Sum(Sum),     .Cout(HA2_Cout));

  or  #1 U3 (Cout, HA2_Cout, HA1_Cout);
  
endmodule