// Initializing Block RAM (Single-Port Block RAM)
// File: rams_sp_rom 
module rams_sp_rom (clk, we, addr, di, dout);
input clk;
input we;
input [5:0] addr;
input [19:0] di;
output [19:0] dout;

reg [19:0] ram [63:0];
reg [19:0] dout;

initial begin
  $readmemb("rom_memory_content.data", ram)
end
 
always @(posedge clk)
begin
  if (we)
    ram[addr] <= di;
  dout <= ram[addr];
end 

endmodule
