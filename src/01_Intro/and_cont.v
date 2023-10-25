module and_cont (
  input  wire x, y,
  output wire f);
  
  assign f = ~x & ~y;
    
endmodule