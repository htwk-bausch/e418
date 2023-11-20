// File: alu.v
// Desc: 1-Bit Rechenwerk mit Add/Sub/AND/OR

module alu (
  input        A,
  input        B,
  input  [2:0] ALUOp,
  output       Result,
  output       Cout);

  reg result_reg, cout_reg;

  assign Result = result_reg;
  assign Cout   = cout_reg;

  always @(*) begin
    case (ALUOp)
      3'b000: result_reg = A & B;
      3'b001: result_reg = A | B;
      3'b010: begin
                result_reg = (A ^ B ^ ALUOp[2]);
                cout_reg   = (A & B) | (A & ALUOp[2]) | (B & ALUOp[2]);
              end
      3'b110: begin
                result_reg = (A ^ ~B ^ ALUOp[2]);
                cout_reg   = (A & ~B) | (A & ALUOp[2]) | (~B & ALUOp[2]);
              end
    endcase
  end  

endmodule