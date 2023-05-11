module Control (
		//input clk,
		input[5:0] opcode,
		output wire RegDst,
		output wire Branch,
		output wire MemRead,
		output wire MemtoReg,
		output wire[1:0] ALUOp,
		output wire MemWrite,
		output wire ALUSrc,
		output wire RegWrite
);
	reg[8:0] controls;
	
	//单周期CPU在一个周期内可以完成一个指令
	always @(*) begin
		case(opcode) 
			//对R型指令，目的寄存器是rd，regdst为1
			//暂不支持R型指令
			//`R_Opcode: controls <= 11'b100000100010;
			`OPCODE_LW: controls <= 9'b001100011;
			`OPCODE_SW: controls <= 9'b000000110;
			`OPCODE_ADDI: controls <= 9'b000000001;
			`OPCODE_BEQ: controls <= 9'b010001000;
			//J为伪指令
			`OPCODE_J: controls <= 9'b000000001; 
			default: controls <= 9'd0;
		endcase
	end
	
	assign {RegDst, Branch, MemRead, MemtoReg, ALUOp[1:0]， MemWrite, ALUSrc, RegWrite} = controls;

endmodule