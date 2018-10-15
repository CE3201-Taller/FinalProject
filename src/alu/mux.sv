module mux #(bits = 3)
	(input logic[bits-1:0] bus_a_i, bus_b_i,
	 input logic select_i,
	output logic[bits-1:0] bus_o);

	assign bus_o = select_i ? bus_b_i : bus_a_i;

endmodule
