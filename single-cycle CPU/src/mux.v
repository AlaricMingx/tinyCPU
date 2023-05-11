module mux (
		input wire control,
		input wire in0,
		input wire in1,
		output reg out
);

	always @(*) begin
		out <= (control == 0)?in0:in1;
	end

endmodule