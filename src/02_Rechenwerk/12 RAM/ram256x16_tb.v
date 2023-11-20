// dile: ram256x16_tb.v
// desc: Testbench

// iverilog -o ram256x16 ram256x16.v ram256x16_tb.v
// vvp ram256x16

module ram256x16_tb();

  reg         clk;
  reg   [7:0] addr;
  reg         ce;
  reg         oe;
  reg         we;

  wire [15:0] data;
  reg  [15:0] tb_data;
  
  ram256x16 DUT (.clk(clk), .addr(addr), .data(data), .ce(ce), .oe(oe), .we(we));

  // write waveform to file
  initial begin
    $dumpfile ("ram256x16.vcd"); 
    $dumpvars; 
  end

  // generate clk
  always #1 clk = !clk;

  assign data = !oe ? tb_data : 'hz;

  // test patterns
  initial begin

    {clk, oe, ce, we, tb_data, addr} <= 0;

    ce <= 1;
    
    // read memory locations
       addr = 7'h00; oe = 1; we = 0;
    #2 addr = 7'h01; oe = 1; we = 0;
    #2 addr = 7'h02; oe = 1; we = 0;

    #2 addr = 7'h00; tb_data = 16'h5555; oe = 0; we = 1;
    #2 addr = 7'h01; tb_data = 16'hbbbb; oe = 0; we = 1;
    #2 addr = 7'h02; tb_data = 16'hcccc; oe = 0; we = 1;

    // read memory locations
    #2 addr = 7'h00; oe = 1; we = 0;
    #2 addr = 7'h01; oe = 1; we = 0;
    #2 addr = 7'h02; oe = 1; we = 0;

    #5 $finish;

  end

endmodule