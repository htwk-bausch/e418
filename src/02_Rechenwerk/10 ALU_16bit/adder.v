// file: adder.v
// desc: Full adder, 4-Bit Full Adder (4x1Bit FA), 16-Bit Full adder (= 4x4Bit FA)

module full_adder_16bit (
  input  [15:0] a,
  input  [15:0] b,
  input         cin,
  output [15:0] sum,
  output        cout);

  wire carry1, carry2, carry3;

  full_adder_4bit fa16_0 (.a(a[3:0]),   .b(b[3:0]),   .cin(cin),    .sum(sum[3:0]),   .cout(carry1));
  full_adder_4bit fa16_1 (.a(a[7:4]),   .b(b[7:4]),   .cin(carry1), .sum(sum[7:4]),   .cout(carry2));
  full_adder_4bit fa16_2 (.a(a[11:8]),  .b(b[11:8]),  .cin(carry2), .sum(sum[11:8]),  .cout(carry3));
  full_adder_4bit fa16_3 (.a(a[15:12]), .b(b[15:12]), .cin(carry3), .sum(sum[15:12]), .cout(cout));

endmodule

module full_adder_4bit (
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout);

  wire carry1, carry2, carry3;
  
  full_adder fa4_0 (.a(a[0]), .b(b[0]), .cin(cin),    .sum(sum[0]), .cout(carry1));
  full_adder fa4_1 (.a(a[1]), .b(b[1]), .cin(carry1), .sum(sum[1]), .cout(carry2));
  full_adder fa4_2 (.a(a[2]), .b(b[2]), .cin(carry2), .sum(sum[2]), .cout(carry3));
  full_adder fa4_3 (.a(a[3]), .b(b[3]), .cin(carry3), .sum(sum[3]), .cout(cout));

endmodule

module full_adder (
  input  a,
  input  b, 
  input  cin, 
  output sum,
  output cout);

  assign sum  = (a ^ b ^ cin);
  assign cout = (a & b) | (a & cin) | (b & cin);

endmodule