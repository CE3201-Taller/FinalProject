/* 
 *
 *
 * @file  regfile.sv
 * @autor Néstor Baltodano Durán
 * @date  14/10/2018
 */

module regfile
(
	 input logic        clk_i, write_enable_i,
	 input logic [3:0]  read_addr1_i, read_addr2_i, write_addr_i, 
	 input logic [31:0] write_data_i, r15_i,
	output logic [31:0] read_data1_o, read_data2_o
);
	logic [31:0] register_file [14:0];
	always_ff @(posedge clk_i)
		if (write_enable_i) register_file[write_addr_i] <= write_data_i;

	assign read_data1_o = (read_addr1_i == 4'b1111) ?
	                      r15_i : register_file[read_addr1_i];
	assign read_data2_o = (read_addr2_i == 4'b1111) ? 
	                      r15_i : register_file[read_addr2_i];
	
endmodule

	