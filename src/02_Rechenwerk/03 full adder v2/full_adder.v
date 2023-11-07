// File: full_adder.v
// Desc: 1-Bit Voll-Addierer (verhaltensbasierte Beschreibung)

module full_adder (input  A, B, Cin,
                   output Sum, Cout);

  assign Sum  = (A ^ B ^ Cin);
  assign Cout = (A & B) | (A & Cin) | (B & Cin);

endmodule