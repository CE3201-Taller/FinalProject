module flip_flop #
(
	parameter WIDTH = 8
)
(
	 input logic             clk_i, rst_i, ena_i,
	 input logic [WIDTH-1:0] d_o,
    output logic [WIDTH-1:0] q_o
)
	always_ff @(posedge clk_i, posedge rst_i)
		if     (rst_i) q_o <= 0;
		else if(ena_i) q_o <= d_o;
endmodule
