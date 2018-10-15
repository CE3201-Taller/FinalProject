 /* 
  *
  * Dual Port - Random Access Memory.
  *
  * @file   ram.sv
  * @autor  Luis Arturo Mora Granados
  * @date   20/09/2018
  * @update 21/09/2018
  */

module ram #(parameter ADDR_WIDTH = 6, 
             parameter DATA_WIDTH = 32)
(
	 input logic                  clk_i, w_ena_i,
	 input logic [ADDR_WIDTH-1:0] w_addr_i, r_addr_i,
	 input logic [DATA_WIDTH-1:0] bus_data_i,
	output logic [DATA_WIDTH-1:0] bus_data_o
);
  logic [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0];
  always_ff @(posedge clk_i)
    if(w_ena_i) mem[w_addr_i] <= bus_data_i;
	
  assign bus_data_o = mem[r_addr_i];
endmodule