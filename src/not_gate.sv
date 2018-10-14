module not_gate #(parameter bits = 4)
	(input logic[bits-1:0] bus_i,
	output logic[bits-1:0] bus_o);

	assign bus_o = ~bus_i;

endmodule
