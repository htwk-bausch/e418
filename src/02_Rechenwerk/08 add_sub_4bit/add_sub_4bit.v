// File: add_sub_4bit.v
// Desc: 4-Bit Voll-Addierer mit Subtraktionsfunktion

module add_sub_4bit (
  input  [3:0] A,
  input  [3:0] B,
  input        Cin,
  input        Binv,
  output [3:0] Sum,
  output       Cout
);

  wire carry0, carry1, carry2;

  add_sub as0 (.A(A[0]), .B(B[0]), .Cin(Cin),    .Binv(Binv), .Sum(Sum[0]), .Cout(carry0));
  add_sub as1 (.A(A[1]), .B(B[1]), .Cin(carry0), .Binv(Binv), .Sum(Sum[1]), .Cout(carry1));
  add_sub as2 (.A(A[2]), .B(B[2]), .Cin(carry1), .Binv(Binv), .Sum(Sum[2]), .Cout(carry2));
  add_sub as3 (.A(A[3]), .B(B[3]), .Cin(carry2), .Binv(Binv), .Sum(Sum[3]), .Cout(Cout));

endmodule