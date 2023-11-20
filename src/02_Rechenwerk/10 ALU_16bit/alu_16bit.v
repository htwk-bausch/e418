// file: alu_16bit.v
// desc: 16-Bit ALU with flag registers

module alu_16bit (
  input      [15:0] a,
  input      [15:0] b,
  input      [2:0]  ALUOp,
  output reg [15:0] result,
  output     [3:0]  sreg);

  wire [15:0] sum;
  wire        cout;
  reg  [15:0] b_intern;

  // 16bit adder from 4x4bit adders from 4x1bit adder
  // see adder.v for details
  full_adder_16bit fa16 (.a(a), .b(b_intern), .cin(ALUOp[2]), .sum(sum), .cout(cout));

  // sreg[0]: Zero flag
  // sreg[1]: Negative flag
  // sreg[2]: Carry flag
  // sreg[3]: oVerflow flag
  assign sreg[0] = &(~sum);    // ~sum[0] & sum[1] & .... & ~sum[15]
  assign sreg[1] = sum[15];
  assign sreg[2] = cout & ALUOp[1];
  assign sreg[3] = ALUOp[1] & (a[15] ^ sum[15]) & (a[15] ~^ b[15] ~^ ALUOp[2]);

  always @(*) begin
    case (ALUOp)
      3'b000: result = a & b;
      3'b001: result = a | b;
      3'b010: begin: ADD
                b_intern = b;
                result = sum;
              end
      3'b110: begin: SUB
                b_intern = ~b;
                result = sum;
              end
    endcase
  end

endmodule