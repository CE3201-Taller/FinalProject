module one_bit_half_adder
	(input logic bit_a_i, bit_b_i,
	output logic sum_o, carry_o);
	
	xor_gate #(1) getSum (bit_a_i, bit_b_i, sum_o);
	and_gate #(1) getCarry (bit_a_i, bit_b_i, carry_o);
	
endmodule
