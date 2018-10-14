module shift_left_gate #(bits = 3)
	(input logic[bits-1:0] bus_i,
	input logic[bits:0] shift_i,
	output logic[bits-1:0] bus_o);

	assign bus_o = bus_i << shift_i;

endmodule
