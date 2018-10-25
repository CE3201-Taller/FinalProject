/* 
 * @file  multiplier.sv
 * @autor Victor Montero
 * @date  24/10/2018
 *
 */
 
 module multiplier #(parameter BITS = 4)
(
     input logic [BITS-1:0] bus_a_i, bus_b_i,
    output logic [((2*BITS)-1):0] bus_o
);
	
	assign bus_o = bus_a_i*bus_b_i;

endmodule
