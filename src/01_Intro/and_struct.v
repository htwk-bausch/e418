module and_struct (
  input  wire x, y,
  output wire f);
  
  wire a;

  not(a, x);
  and(f, a, y);
    
endmodule