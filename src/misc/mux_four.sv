/* 
 *
 *
 * @file  mux_four.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/09/2018
 */

module mux_four #(BITS = 3)
(
     input logic [BITS-1:0] bus_a_i, bus_b_i, bus_c_i, bus_d_i,
     input logic [1:0]      select_i,
    output logic [BITS-1:0] bus_o
);

    logic[BITS-1:0] stage_1_1_out, stage_1_2_out;
    mux2 #(BITS) stage_1_1(bus_a_i, bus_b_i, select_i[0], stage_1_1_out);
    mux2 #(BITS) stage_1_2(bus_c_i, bus_d_i, select_i[0], stage_1_2_out);
    mux2 #(BITS) stage_2_0(stage_1_1_out, stage_1_2_out, select_i[1], bus_o);

endmodule
