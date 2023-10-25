// file: and_struct_tb.eda.v
// desc: Testbench für and_struct.v für ModelSim

`timescale 1ns/1ns

module and_struct_tb();

  reg x, y;
  wire f;

  and_struct DUT (x, y, f);

  initial begin

       x = 0; y = 0;
    #3 x = 0; y = 1;
    #3 x = 1; y = 0;
    #3 x = 1; y = 1;
  end

endmodule