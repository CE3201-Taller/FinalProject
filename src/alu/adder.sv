module adder #(parameter bits = 3)
	(input logic[bits-1:0] bus_a_i, bus_b_i,
	 input logic carry_i,
	output logic[bits-1:0] bus_o,
	output logic flag_overflow_o);
	
	logic[bits:0] carry_o;
	assign carry_o[0] = carry_i;
	assign flag_overflow_o = carry_o[bits];
	genvar i;
	generate 
		for (i = 0; i < bits; i = i+1) begin:forloop
			one_bit_full_adder addrr(bus_a_i[i], bus_b_i[i], carry_o[i], bus_o[i], carry_o[i+1]);
		end
	endgenerate
	
endmodule
