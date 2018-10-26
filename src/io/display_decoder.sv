/* 
 * @file  display_decoder.sv
 * @autor Victor Montero
 * @date  24/10/2018
 *
 */
 

module display_decoder
(
	 input logic [7:0] data_i,
	output logic [6:0]  display_1_o, display_2_o, display_3_o
);

	logic [3:0] u,d,c;
	bin_to_bcd8 btb(.A_i(data_i),
						 .unit_o(u),
						 .tens_o(d),
						 .hundreds_o(c));
	
	bcd4_to_7seg bt7_1(u,display_1_o);
	bcd4_to_7seg bt7_2(d,display_2_o);
	bcd4_to_7seg bt7_3(c,display_3_o);
							  


endmodule
