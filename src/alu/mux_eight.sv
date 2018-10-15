module mux_eight #(BITS = 2)
(
	 input logic [BITS-1:0] bus_a_i, bus_b_i, bus_c_i, bus_d_i, 
	 input logic [BITS-1:0] bus_e_i, bus_f_i, bus_g_i, bus_h_i,
	 input logic [2:0]      select_i,
	output logic [BITS-1:0] bus_o);
	
	logic[BITS-1:0] stage_1_1_out, stage_1_2_out;
	mux_four #(BITS) stage_1_1(bus_a_i, bus_b_i, bus_c_i, 
	                           bus_d_i, select_i[1:0], stage_1_1_out);
	mux_four #(BITS) stage_1_2(bus_e_i, bus_f_i, bus_g_i, 
	                           bus_h_i, select_i[1:0], stage_1_2_out);
	mux #(BITS)      stage_2(stage_1_1_out, stage_1_2_out, select_i[2], bus_o);
	
endmodule
