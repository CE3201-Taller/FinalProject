module or_gate #(parameter bits = 4) 
	(input logic[bits-1:0] bus_a_i, bus_b_i,
	output logic[bits-1:0] bus_o);

	assign bus_o = bus_a_i | bus_b_i;

endmodule
