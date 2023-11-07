// File: cla_4bit.v
// Desc: 4-Bit Voll-Addierer für Carry-Look-Ahead-Logik

`timescale 1ns/1ps

module cla_4bit (input  wire [3:0] A, B,
                 output wire [3:0] Sum,
                 output wire       Cout);

  wire       c0, c1, c2, c3;
  wire [3:0] p, g;

  assign c0   = 1'b0;
  assign c1   = g[0] | (p[0] & c0);
  assign c2   = g[1] | (p[1] & c1);
  assign c3   = g[2] | (p[2] & c2);
  assign Cout = g[3] | (p[3] & c3);

  mod_full_adder U0 (.A(A[0]), .B(B[0]), .Cin(c0), .Sum(Sum[0]), .p(p[0]), .g(g[0]));
  mod_full_adder U1 (.A(A[1]), .B(B[1]), .Cin(c1), .Sum(Sum[1]), .p(p[1]), .g(g[1]));
  mod_full_adder U2 (.A(A[2]), .B(B[2]), .Cin(c2), .Sum(Sum[2]), .p(p[2]), .g(g[2]));
  mod_full_adder U3 (.A(A[3]), .B(B[3]), .Cin(c3), .Sum(Sum[3]), .p(p[3]), .g(g[3]));

endmodule