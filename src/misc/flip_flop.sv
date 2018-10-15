/* 
 *
 *
 * @file  flip_flop.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/09/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module flip_flop #(parameter WIDTH = 8)
(
	 input logic             clk_i, rst_i, ena_i,
	 input logic [WIDTH-1:0] d_i,
    output logic [WIDTH-1:0] q_o
);
	always_ff @(posedge clk_i, posedge rst_i)
		if     (rst_i) q_o <= 0;
		else if(ena_i) q_o <= d_i;
endmodule
