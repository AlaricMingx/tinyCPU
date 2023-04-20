module Control (
		input clk,
		input wire[6:0] instr,
		output reg Branch,
		output reg MemRead,
		output reg MemtoReg,
		output reg ALUOp,
		output reg MemWrite,
		output reg ALUSrc,
		output reg RegWrite,
);

	always @(posedge clk) begin
		
	end
	
	
endmodule