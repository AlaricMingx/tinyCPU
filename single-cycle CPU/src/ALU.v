module ALU (
		input clk,
		input wire[1:0] ALUop,
		input wire[`WORD_SIZE - 1:0] a,
		input wire[`WORD_SIZE - 1:0] b,
		output reg zero,
		output reg[`WORD_SIZE - 1:0] result
);

	always @(posedge clk) begin
		case(ALUop)
			2'b00 : result <= a + b;
			2'b01 : result <= a - b;
			2'b10 : result <= 0;//由func7与func3决定
			default : result <= 0;
		endcase
		
		case(result)
			32'b0 : zero <= 1;
			default : zero <= 0;
		endcase
	end

endmodule

module Add