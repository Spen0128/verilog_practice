/*This is an 1-bit full adder*/

module full_adder_4(input [3:0] in_1, in_2, output [3:0] s, output cout);

    wire c0, c1, c2;

    full_adder FA0(in_1[0], in_2[0], 1'b0, s[0], c0);
    full_adder FA1(in_1[1], in_2[1], c0, s[1], c1);
    full_adder FA2(in_1[2], in_2[2], c1, s[2], c2);
    full_adder FA3(in_1[3], in_2[3], c2, s[3], cout);

endmodule


module full_adder(input A, B, Cin, output S, Cout);

    assign {Cout, S} = A + B + Cin;

endmodule