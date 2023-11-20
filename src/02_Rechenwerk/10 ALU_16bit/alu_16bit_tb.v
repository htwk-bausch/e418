// file: alu_16bit_tb.v
// desc: Testbench

// Compile: iverilog -o alu_16bit adder.v alu_16bit.v alu_16bit_tb.v
// Simulate: vvp alu_16bit

module alu_16bit_tb;

  reg  [15:0] a;
  reg  [15:0] b;
  reg  [2:0]  ALUOp;
  wire [15:0] result;
  wire [3:0]  sreg;

  alu_16bit alu16 (.a(a), .b(b), .ALUOp(ALUOp), .result(result), .sreg(sreg));

  initial begin

    $monitor("ALUOp=%3b: A=%5d B=%5d Result=%5d SReg=%4b", ALUOp, a, b, result, sreg);

    // LOGIC AND
       ALUOp=3'b000; a=16'b111; b=16'b001;
    
    // LOGIC OR
    #5 ALUOp=3'b001; a=16'b101; b=16'b010;

    // ARITHMETIC ADDITION
    #5 ALUOp=3'b010; a=16;    b=1; 

    #5 ALUOp=3'b010; a=65535; b=0;
    #5 ALUOp=3'b010; a=65535; b=1;
    #5 ALUOp=3'b010; a=65535; b=2; 

    // ARITHMETIC SUBTRACTION
    #5 ALUOp=3'b110; a=15; b=8; 
    #5 ALUOp=3'b110; a=15; b=15;    // result should be 0, zero-flag
    #5 ALUOp=3'b110; a=15; b=16;    // negative flag? 
  end

endmodule