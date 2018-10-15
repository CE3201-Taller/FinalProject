module not_gate #(parameter BITS = 4)
(
	 input logic[BITS-1:0] bus_i,
	output logic[BITS-1:0] bus_o
);
	assign bus_o = ~bus_i;
endmodule
