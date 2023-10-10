// This is a 4-line BCD -> 10-line decimal converter with two other condition input(Reset_n, Preset)

module BCD2DEC (input [3:0] BCD_input,input reset_n, preset, output reg [9:0] DEC_output);

	always @(*) begin
		// Consider the priority of reset_n and preset
		if (reset_n == 1'b0) DEC_output = 0;
		else if (preset == 1'b1) DEC_output = 10'b0000001111;
		else begin
			DEC_output = 10'b1111111111; // Default all outputs to 1

			// Check the BCD input and set the corresponding output to 0
			case (BCD_input)
				4'd0: DEC_output[0] = 0;
				4'd1: DEC_output[1] = 0;
				4'd2: DEC_output[2] = 0;
				4'd3: DEC_output[3] = 0;
				4'd4: DEC_output[4] = 0;
				4'd5: DEC_output[5] = 0;
				4'd6: DEC_output[6] = 0;
				4'd7: DEC_output[7] = 0;
				4'd8: DEC_output[8] = 0;
				4'd9: DEC_output[9] = 0;
			endcase
		end
	end
endmodule