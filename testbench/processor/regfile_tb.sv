/* 
 * @file  regfile_tb.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 */
 
module regfile_tb();
	
	
	
 	logic clk_i, write_enable_i;
	logic [3:0]  read_addr_1_i, read_addr_2_i, write_addr_i;
	logic [31:0] write_data_i, r_15_i;
	logic [31:0] read_data_1_o, read_data_2_o;
	
	regfile dut(clk_i, write_enable_i,	
					read_addr_1_i, read_addr_2_i, write_addr_i, 
					write_data_i, r_15_i,
					read_data_1_o, read_data_2_o);
	
	initial begin 
		clk_i=1;
		write_enable_i=1;
		read_addr_1_i=4'b0111;
		read_addr_2_i=4'b0101;
		write_addr_i=4'b1011;
		write_data_i=32'b11100000000010100110000100000111;//random data		
		r_15_i=32'b01010100000000000001000101000111;//random data
		#20
		write_addr_i=4'b1111;
		#20
		read_addr_2_i=4'b1111;
		#20
		read_addr_1_i=4'b1111;
	end
	
	
	always #20 clk_i = ~clk_i;
	
endmodule
