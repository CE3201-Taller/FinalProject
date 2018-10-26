/* 
 * @file  bcd4_to_7seg.sv
 * @autor Victor Montero
 * @date  24/10/2018
 *
 */
 
 
module bcd4_to_7seg
(
		input logic [3:0] number_i,
	  output logic [6:0] display_o
 );
 
	always_comb begin
		case(number_i)
			4'b0000: display_o = 7'b1000000;
			4'b0001: display_o = 7'b1111001;
			4'b0010: display_o = 7'b0100100;
			4'b0011: display_o = 7'b0110000;
			4'b0100: display_o = 7'b0011001;
			4'b0101: display_o = 7'b0010010;
			4'b0110: display_o = 7'b0000010;
			4'b0111: display_o = 7'b1111000;
			4'b1000: display_o = 7'b0000000;
			4'b1001: display_o = 7'b0010000;
			default: display_o = 7'b1111111;
		endcase
	end
endmodule