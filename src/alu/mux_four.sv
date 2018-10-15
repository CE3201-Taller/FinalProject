module mux_four #(bits = 3)
	(input logic[bits-1:0] bus_a_i, bus_b_i, bus_c_i, bus_d_i,
	 input logic[1:0] select_i,
	output logic[bits-1:0] bus_o);

	logic[bits-1:0] stage_1_1_out, stage_1_2_out;
	simple_mux #(bits) stage_1_1(bus_a_i, bus_b_i, select_i[0], stage_1_1_out);
	simple_mux #(bits) stage_1_2(bus_c_i, bus_d_i, select_i[0], stage_1_2_out);
	simple_mux #(bits) stage_2(stage_1_1_out, stage_1_2_out, select_i[1], bus_o);

endmodule
