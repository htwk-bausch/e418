// file: registerFiler8x16.v
// desc: Registersatz: 8 Register á 16-Bit

module registerFile8x16 (input         clk,
                         input         rst,           // rst = 1 => delete all values
                         input  [15:0] regIn,         // input value
                         input  [2:0]  regInAddr,     // input address (2^3 = 8)
                         input         regInWE,       // input write enable
                         input  [2:0]  regOut1Addr,   // output1 address (2^3 = 8)
                         input  [2:0]  regOut2Addr,   // output2 address (2^3 = 8)
                         output [15:0] regOut1,       // output1 value
                         output [15:0] regOut2);      // output2 value


  // memory: 16 Bit wide @ 8 locations (deep)
  reg [15:0] register[7:0];

  // register file storage
  always @(posedge clk, posedge rst) begin
    
    // if reset active, delete memory content
    if (rst) begin
      register[7] <= 7'b0;
      register[6] <= 7'b0;
      register[5] <= 7'b0;
      register[4] <= 7'b0;
      register[3] <= 7'b0;
      register[2] <= 7'b0;
      register[1] <= 7'b0;
      register[0] <= 7'b0;
    end
    // if inWriteEnable is active, write to register
    else begin
      if (regInWE) begin
        register[regInAddr] <= regIn;
      end
    end
  end

  // output registers
  assign regOut1 = register[regOut1Addr];
  assign regOut2 = register[regOut2Addr];

endmodule