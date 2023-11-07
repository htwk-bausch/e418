// File: full_adder_tb.v
// Desc: Testbench für 1-Bit Voll-Addierer

`timescale  1ns/1ps

module full_adder_tb;

  reg A, B, Cin;
  wire Sum, Cout;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, DUT);
  end

  initial begin
    
       A=0; B=0; Cin=0;
    #5 A=0; B=1; Cin=0;
    #5 A=1; B=0; Cin=0;
    #5 A=1; B=1; Cin=0;
    #5 A=0; B=0; Cin=1;
    #5 A=0; B=1; Cin=1;
    #5 A=1; B=0; Cin=1;
    #5 A=1; B=1; Cin=1;
    
    #10 $finish;

  end

  full_adder DUT (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

endmodule