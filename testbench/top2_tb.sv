 /* 
 * @file  top2_tb.sv
 * @autor Arturo Mora
 * @date  26/10/2018
 */
 
 module top2_tb();
	logic        clk, rst;
	logic [8:0]  data_i;
	logic        mode_i;
	logic        funct_1_i, funct_2_i, exec_i;
	logic [6:0]  display_1_o, display_2_o, display_3_o;

	top uut(clk, rst, data_i, mode_i, funct_1_i, funct_2_i, exec_i, display_1_o, display_2_o, display_3_o);
	
	initial begin
        #0  
		  rst       <= 1;
		  funct_1_i <= 0;
		  funct_2_i <= 0;
		  exec_i    <= 0;
		  mode_i    <= 0;
        #10
		  rst    <= 0;
		  data_i <= 9'd200;
		  funct_1_i <= 1;
		  #20
		  funct_1_i <= 0;
		  #30
		  data_i <= 9'd150;
		  exec_i    <= 1;
		  #40
		  exec_i    <= 0;
		  
    end
    always begin
        #5 clk <= 1;
        #5 clk <= 0;
    end
endmodule
