module alu_tb();

    logic[3:0] bus_a_i, bus_b_i, bus_o;
    logic[2:0] alu_control_i;
    logic[3:0] alu_flags_o;
    alu #(4) uut(bus_a_i, bus_b_i, alu_control_i, bus_o, alu_flags_o); 
    initial begin
        #0
        alu_control_i = 2'd0; 
        bus_a_i = 2;
        bus_b_i = 5;
        
        #5
        alu_control_i = 2'd1; 
        bus_a_i = 8;
        bus_b_i = 8;

        #10
        alu_control_i = 2'd2; 
        bus_a_i = 2;
        bus_b_i = 5;
        
        #15
        alu_control_i = 2'd3; 
        bus_a_i = 2;
        bus_b_i = 5;
	 end
endmodule
