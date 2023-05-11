module tinyCPU(
	input wire clk, rst,
	input wire[31:0] instr,
	output b
);
	reg[31:0] PC, Regs[0:31], IMemory[0:1023], DMemory[0:1023];
	
	wire RegDst,Branch, MemRead,MemtoReg, MemWrite, ALUSrc, RegWrite;
	wire[1:0] ALUOp;
	
	always @(*) begin
		Control ctrl(instr[31:26], RegDst, Branch, MemRead, MemtoReg, 
							ALUOp, MemWrite, ALUSrc, RegWrite);
		//alucontrol
		Register regfile(clk, instr[31:26], Regwrite, instr[])
	end
	
						
	

endmodule
