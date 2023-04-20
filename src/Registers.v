module Registers (
		input clk,
		input wire[5:0] opcode,
		input Regwrite,
		input wire[4:0] ReadReg1,
		input wire[4:0] ReadReg2,
		input wire[4:0] WriteReg,
		input wire[31:0] WriteData,
		output reg[31:0] ReadData1,
		output reg[31:0] ReadData2
);
	reg[31:0] regfile[31:0];

	always @(posedge clk) begin
		ReadData1 = 0;
		ReadData2 = 0;
		
		case(opcode)
			//R-type
			6'd0: begin
			
				case(Regwrite)
					1'd1: begin
						regfile[WriteReg] = WriteData;
					end
					1'd0: begin
						ReadData1 = regfile[ReadReg1];
						ReadData2 = regfile[ReadReg2];
					end
				endcase
				
			end
				
			//I-type or J-type(no operation with J)
			default: begin
				//ALL I opcode > 0x03
				if(opcode > 6'd3) begin
					
					case(Regwrite)
						1'd1: 
							regfile[WriteReg] = WriteData;
						1'd0: 
							ReadData1 = regfile[ReadReg1];
					endcase
					
				end
			end
			
		endcase
	end


endmodule