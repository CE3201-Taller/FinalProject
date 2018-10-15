/* 
 *
 *
 * @file  adder_substractor.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/09/2018
 */

module adder_substractor #(parameter BITS = 3)
(
     input logic[BITS-1:0] bus_a_i, bus_b_i,
     input logic select_i,
    output logic[BITS-1:0] sum_o,
    output logic flag_v_o
);
    
    logic[BITS-1:0] bus_tmp;
    xor_gate #(BITS) detectOp(bus_b_i, select_i, bus_tmp);
    adder #(BITS) adderSubstractor(bus_a_i, bus_tmp, select_i, sum_o, flag_v_o); 
endmodule
