/* 
 * @file  add3.sv
 * @autor Victor Montero
 * @date  24/10/2018
 *
 */
 
 
 module add3
 (
		input logic [3:0] in_i,
	  output logic [3:0] out_o
 );
 
 
	always_comb begin
		case(in_i)
			4'b0000: out_o = 4'b0000;
			4'b0001: out_o = 4'b0001;
			4'b0010: out_o = 4'b0010;
			4'b0011: out_o = 4'b0011;
			4'b0100: out_o = 4'b0100;
			4'b0101: out_o = 4'b1000;
			4'b0110: out_o = 4'b1001;
			4'b0111: out_o = 4'b1010;
			4'b1000: out_o = 4'b1011;
			4'b1001: out_o = 4'b1100;
			default: out_o = 4'b0000; 
		endcase
	end
endmodule
 
 