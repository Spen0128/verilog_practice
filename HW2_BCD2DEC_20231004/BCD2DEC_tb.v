module BCD2DEC_tb();

    reg [3:0] BCD_input;
	reg p, r;
    wire [9:0] decimal_output;

    BCD2DEC u1 (
        .BCD_input(BCD_input),
		.reset_n(r),
		.preset(p),
        .DEC_output(decimal_output)
    );

    initial begin
			r = 1'b1;
			p = 1'b0;
			BCD_input = 4'b0000;
		#10 BCD_input = 4'b0001;
		#10 BCD_input = 4'b0010;
		#10 BCD_input = 4'b0011;
        #10 BCD_input = 4'b0100;
		#10 BCD_input = 4'b0101;
		#10 BCD_input = 4'b0110;
		#10 BCD_input = 4'b0111;
		#10 BCD_input = 4'b1000;
		#10 BCD_input = 4'b1001;
		#10 BCD_input = 4'b1010;
		#10 BCD_input = 4'b1011;
		#10 BCD_input = 4'b1100;
		#10 BCD_input = 4'b1101;
		#10 BCD_input = 4'b1110;
		#10 BCD_input = 4'b1111;

		#10 r = 1'b0;
			BCD_input = 4'b0000;
		#10 BCD_input = 4'b0001;
		#10 BCD_input = 4'b0010;
		#10 BCD_input = 4'b0011;
        #10 BCD_input = 4'b0100;
		#10 BCD_input = 4'b0101;
		#10 BCD_input = 4'b0110;
		#10 BCD_input = 4'b0111;
		#10 BCD_input = 4'b1000;
		#10 BCD_input = 4'b1001;
		#10 BCD_input = 4'b1010;
		#10 BCD_input = 4'b1011;
		#10 BCD_input = 4'b1100;
		#10 BCD_input = 4'b1101;
		#10 BCD_input = 4'b1110;
		#10 BCD_input = 4'b1111;

		#10 r = 1'b0;
			p = 1'b1;
			BCD_input = 4'b0000;
		#10 BCD_input = 4'b0001;
		#10 BCD_input = 4'b0010;
		#10 BCD_input = 4'b0011;
        #10 BCD_input = 4'b0100;
		#10 BCD_input = 4'b0101;
		#10 BCD_input = 4'b0110;
		#10 BCD_input = 4'b0111;
		#10 BCD_input = 4'b1000;
		#10 BCD_input = 4'b1001;
		#10 BCD_input = 4'b1010;
		#10 BCD_input = 4'b1011;
		#10 BCD_input = 4'b1100;
		#10 BCD_input = 4'b1101;
		#10 BCD_input = 4'b1110;
		#10 BCD_input = 4'b1111;

		#10 r = 1'b1; p = 1'b1;
			BCD_input = 4'b0000;
		#10 BCD_input = 4'b0001;
		#10 BCD_input = 4'b0010;
		#10 BCD_input = 4'b0011;
        #10 BCD_input = 4'b0100;
		#10 BCD_input = 4'b0101;
		#10 BCD_input = 4'b0110;
		#10 BCD_input = 4'b0111;
		#10 BCD_input = 4'b1000;
		#10 BCD_input = 4'b1001;
		#10 BCD_input = 4'b1010;
		#10 BCD_input = 4'b1011;
		#10 BCD_input = 4'b1100;
		#10 BCD_input = 4'b1101;
		#10 BCD_input = 4'b1110;
		#10 BCD_input = 4'b1111;
        #10 $finish;
    end

endmodule
