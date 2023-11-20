// file: rom256x16_tb.v
// desc: Testbench

// iverilog -o rom256x16 rom256x16.v rom256x16_tb.v
// vvp rom256x16

module rom256x16_tb();

  reg   [7:0] addr;
  wire [15:0] data;

  rom256x16 DUT (.addr(addr), .data(data));

  initial begin

    $monitor("Addr=%0h Data=%0h", addr, data);

       addr = 0;
    #5 addr = 1;
    #5 addr = 2;
    #5 addr = 3;
    #5 addr = 4;

  end

endmodule