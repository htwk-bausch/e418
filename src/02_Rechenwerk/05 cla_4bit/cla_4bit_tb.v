// File: cla_4bit_tb.v
// Desc: Testbench für 4-Bit Voll-Addierer (Carry-Look-Ahead)

`timescale 1ns/1ps

module cla_4bit_tb();

  reg  [3:0] A, B;
  wire [3:0] Sum;
  wire       Cout;

  integer i, j;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, DUT);
  end

  always begin

    for (i=0; i<16; i=i+1)
      for (j=0; j<16; j=j+1)
        begin
          A = i; B = j; #30;
        end

    #15 $finish;
  end

  cla_4bit DUT (.A(A), .B(B), .Sum(Sum), .Cout(Cout));

endmodule