module ALU (
		input clk,
		input wire[3:0] ALUop,
		input wire[31:0] a,
		input wire[31:0] b,
		output reg zero,
		output reg[31:0] result
);

	always @(posedge clk) begin
		case(ALUop)
			4'b0000 : result = a & b;
			4'b0001 : result = a | b;
			4'b0010 : result = a + b;
			4'b0110 : result = a - b;
			//0111  set on less than
			4'b0111 : result = (a <= b)?1:0;
			default : result = 0;
		endcase
		
		case(result)
			32'b0 : zero = 1;
			default : zero = 0;
		endcase
	end

endmodule