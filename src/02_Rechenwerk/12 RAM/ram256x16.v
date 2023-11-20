// file: ram256x16.v
// desc: Speicher mit 256 Zeilen á 16-Bit

module ram256x16 (input         clk,      // clock
                  input   [7:0] addr,     // address bus (2^8=256)
                  inout  [15:0] data,     // data bus (input/output)
                  input         ce,       // chip enable
                  input         oe,       // output enable
                  input         we);      // write enable
                  


  // memory: 16 bit wide @ 255 locations
  reg [15:0] mem[255:0];
  reg [15:0] tmp;

  // store data
  always @(posedge clk) begin
    // write to memory if ChipEnable and WriteEnable
    if (ce & we) begin
      mem[addr] <= data;
    end
  end
  
  // copy data to tmp register
  always @(posedge clk) begin
    if (ce & oe) begin
      tmp <= mem[addr]; 
    end
  end

  // assign tmp value to data, if ChipEnable=1 & OutputEnable=1
  // otherwise set data lines to highZ
  assign data = ce & oe & !we ? tmp : 'hz;

endmodule