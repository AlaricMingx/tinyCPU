module Mem (
		input clk,
		input MemRead,
		input MemWrite,
		input wire[5:0] opcode,
		input wire[`WORD_SIZE - 1:0] Address,
		input wire[`WORD_SIZE - 1:0] WriteData,
		output reg[`WORD_SIZE - 1:0] ReadData
);

	reg[`WORD_SIZE - 1:0] mem[`WORD_SIZE - 1:0];

	always @(posedge clk) begin
		ReadData = 0;
		case({MemWrite, MemRead})
			//lw
			2'b01: ReadData = mem[Address];
			//sw
			2'b10: mem[Address] = WriteData;
			
			//2'b00:
			//default:
			
		endcase 
	end

endmodule
