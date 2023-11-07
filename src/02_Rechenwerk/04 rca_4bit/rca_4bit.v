// File: rca_4bit.v
// Desc: 4-Bit Voll-Addierer

`timescale 1ns/1ps

module rca_4bit (input  wire [3:0] A, B,
                 output wire [3:0] Sum,
                 output wire       Cout);

  wire C1, C2, C3;

  full_adder U1 (.A(A[0]), .B(B[0]), .Cin(1'b0), .Sum(Sum[0]), .Cout(C1));
  full_adder U2 (.A(A[1]), .B(B[1]), .Cin(C1),   .Sum(Sum[1]), .Cout(C2));
  full_adder U3 (.A(A[2]), .B(B[2]), .Cin(C2),   .Sum(Sum[2]), .Cout(C3));
  full_adder U4 (.A(A[3]), .B(B[3]), .Cin(C3),   .Sum(Sum[3]), .Cout(Cout));

endmodule