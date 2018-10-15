module alu #(parameter bits = 3)
	(input logic[bits-1:0] bus_a_i, bus_b_i,
	 input logic[2:0] control_i,
	output logic[bits-1:0] bus_s_o,
	output logic flag_c_o, flag_n_o, flag_v_o, flag_z_o);
	
	logic[bits-1:0] addrL, notL, andL, orL, xorL, shiftRL, shiftLL;
	or_gate  #(bits) opOr (bus_a_i, bus_b_i, orL);
	and_gate #(bits) opAnd(bus_a_i, bus_b_i, andL);
	not_gate #(bits) opNot(bus_a_i, notL);
	xor_gate #(bits) opXor(bus_a_i, bus_b_i, xorL);
	adder_substractor #(bits) opSum(bus_a_i, bus_b_i, control_i[0], addrL, flag_v_o);
	shift_left_gate   #(bits) opShiftL(bus_a_i, bus_b_i, shiftLL);
	shift_right_gate  #(bits) opShiftR(bus_a_i, bus_b_i, shiftRL);
	mux_eight #(bits) opSelector(addrL, addrL, shiftLL, shiftRL, orL,   andL , xorL,    notL, control_i, bus_s_o);
endmodule
