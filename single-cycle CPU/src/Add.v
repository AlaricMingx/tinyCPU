module Add (
		input wire in0,
		input wire in1,
		output reg sum
);

	always @(*) begin
		sum <= in0 + in1;
	end

endmodule