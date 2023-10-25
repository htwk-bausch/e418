`timescale 1ns/1ns

module and_struct_tb();

  reg x, y;
  wire f;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, DUT);
  end

  initial begin 
       x = 0; y = 0;
    #3 x = 0; y = 1;
    #3 x = 1; y = 0;
    #3 x = 1; y = 1;
    #3 $finish;
  end

  and_struct DUT (x, y, f);

endmodule