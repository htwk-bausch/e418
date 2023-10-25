module and_proc (
  input  wire x, y,
  output reg  f);
  
  always @(x,y)
    if (x == 0 & y == 1)
      f = 1'b1;
    else
      f = 1'b0;
    
endmodule