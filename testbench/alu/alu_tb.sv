module alu_tb();

    logic[3:0] bus_a_i, bus_b_i, bus_o;
	 logic[2:0] alu_control_i;
	 logic flag_c, flag_v, flag_n, flag_z;
	 
	 alu #(4) uut(bus_a_i, bus_b_i, alu_control_i, bus_o, flag_c, flag_n, flag_v, flag_z);
	 
	 initial begin
	 alu_control_i = 0; 
	 bus_a_i = 2;
	 bus_b_i = 5;
	 #100

	 alu_control_i = 1; 
	 bus_a_i = 2;
	 bus_b_i = 5;
	 #100

	 
	 alu_control_i = 4; 
	 bus_a_i = 2;
	 bus_b_i = 5;
	 #100

	 bus_a_i = 2;
	 bus_b_i = 5;
	 
	 alu_control_i = 5; 
	 #100;	 
	 end
endmodule
