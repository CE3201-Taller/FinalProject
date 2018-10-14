module one_bit_full_adder
	(input logic bit_a_i, bit_b_i, carry_i,
	output logic sum_o, carry_o);
	
	logic sumA, carryA, carryB;
	one_bit_half_adder getSumA(bit_a_i, bit_b_i, sumA, carryA);
	one_bit_half_adder getSumB(carry_i, sumA, sum_o, carryB);
	or_gate #(1) getCarry(carryA, carryB, carry_o);
	
endmodule
