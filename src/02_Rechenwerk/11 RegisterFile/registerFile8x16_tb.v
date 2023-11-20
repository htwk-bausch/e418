// file: registerFile8x16_tb.v
// desc: Testbench

// iverilog -o registerFile8x16 registerFile8x16_tb.v registerFile8x16.v
// vvp registerFile8x16

`timescale 10ns/1ps
module registerFile8x16_tb;

  reg         clk;
  reg         rst;
  reg  [15:0] regIn;
  reg  [2:0]  regInAddr;
  reg         regInWE;
  reg  [2:0]  regOut1Addr;
  reg  [2:0]  regOut2Addr;
  wire [15:0] regOut1;
  wire [15:0] regOut2;

  // Create instance
  registerFile8x16 dut(.clk(clk), .rst(rst), .regIn(regIn), .regInAddr(regInAddr), .regInWE(regInWE), .regOut1Addr(regOut1Addr), .regOut2Addr(regOut2Addr), .regOut1(regOut1), .regOut2(regOut2));

  // write waveform to file
  initial begin
    $dumpfile ("registerFile8x16.vcd"); 
    $dumpvars; 
  end

  // Generate clk
  always #1 clk = !clk;

  // Test patterns
  initial begin

    clk     <= 0;
    rst     <= 1;
    regInWE <= 0;

    #1 rst <= 0;

    // show current memory content
    #2 regOut1Addr = 3'b000; regOut2Addr = 3'b000;
    #2 regOut1Addr = 3'b001; regOut2Addr = 3'b001;
    #2 regOut1Addr = 3'b010; regOut2Addr = 3'b010;
    #2 regOut1Addr = 3'b011; regOut2Addr = 3'b011;
    
    // insert new memory content
    #2 regInAddr = 3'b000; regIn = 16'hffff; regInWE = 1; #2 regInWE = 0;
    #2 regInAddr = 3'b001; regIn = 16'haaaa; regInWE = 1; #2 regInWE = 0;
    #2 regInAddr = 3'b010; regIn = 16'hbbbb; regInWE = 1; #2 regInWE = 0;
    #2 regInAddr = 3'b011; regIn = 16'h5555; regInWE = 1; #2 regInWE = 0;
    
    // check for new content
    #2 regOut1Addr = 3'b000; regOut2Addr = 3'b000;
    #2 regOut1Addr = 3'b001; regOut2Addr = 3'b001;
    #2 regOut1Addr = 3'b010; regOut2Addr = 3'b010;
    #2 regOut1Addr = 3'b011; regOut2Addr = 3'b011;
    
    #5 $finish;
    
  end

endmodule