/* 
 *
 *
 * @file  cond_check.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module cond_check
(
	 input logic [3:0] cond_i,
	 input logic [3:0] flags_i,
	output logic       cond_o
);
	logic neg, zero, carry, overflow, ge;
	assign {neg, zero, carry, overflow} = flags_i;
	assign ge = (neg == overflow);
	always_comb
		case(cond_i)
			4'b0000: cond_o = zero;
			4'b0001: cond_o = ~zero
			4'b0010: cond_o = carry;
			4'b0011: cond_o = ~carry;
			4'b0100: cond_o = neg;
			4'b0101: cond_o = ~neg;
			4'b0110: cond_o = overflow;
			4'b0111: cond_o = ~overflow;
			4'b1000: cond_o = carry & ~zero;
			4'b1001: cond_o = ~(carry & zero);
			4'b1010: cond_o = ge;
			4'b1011: cond_o = ~ge;
			4'b1100: cond_o = ~zero & ge;
			4'b1101: cond_o = ~(~zero & ge);
			4'b1110: cond_o = 1'b1;
			default: cond_o = 1'bx;
		endcase
endmodule
