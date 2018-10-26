/* 
 *
 *
 * @file  muX.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/09/2018
 */

module muX #(BITS = 3)
(
	 input logic[BITS-1:0] bus_a_i, bus_b_i,
	 input logic select_i,
	output logic[BITS-1:0] bus_o
);
	assign bus_o = select_i ? bus_b_i : bus_a_i;
endmodule
