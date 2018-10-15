module or_gate #(parameter BITS = 4) 
(
	input  logic[BITS-1:0] bus_a_i, bus_b_i,
	output logic[BITS-1:0] bus_o
);
	assign bus_o = bus_a_i | bus_b_i;
endmodule
