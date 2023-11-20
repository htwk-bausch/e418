// file: rom256x16.v
// desc: Programmspeicher mit 256 Datenworten á 16 Bit

module rom256x16 (input   [7:0] addr,       // address
                  output [15:0] data);      // data output (instruction)

  // memory: 16 Bit wide @ 8 locations (deep)
  reg [15:0] rom[255:0];

  initial begin
    $readmemh("rom_image.mem", rom);
  end

  // register file storage
  assign data = rom[addr];

endmodule