module adder_substractor #(parameter bits = 3)
	(input logic[bits-1:0] bus_a_i, bus_b_i,
	 input logic select_i,
	output logic[bits-1:0] sum_o,
	output logic flag_v_o);
	 
	 logic[bits-1:0] bus_tmp;
	 xor_gate #(bits) detectOp(bus_b_i, select_i, bus_tmp);
	 adder #(bits) adderSubstractor(bus_a_i, bus_tmp, select_i, sum_o, flag_v_o);
	 
endmodule
