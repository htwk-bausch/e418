// File: half_adder_tb.v
// Desc: Testbench für 1-Bit Halb-Addierer

`timescale  1ns/1ps
module half_adder_tb;

  reg A, B;
  wire Sum, Cout;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, DUT);
  end

  initial begin
    
       A=0; B=0;
    #5 A=0; B=1;
    #5 A=1; B=0;
    #5 A=1; B=1;
    #5 $finish;

  end

  half_adder DUT (.A(A), .B(B), .Sum(Sum), .Cout(Cout));

endmodule