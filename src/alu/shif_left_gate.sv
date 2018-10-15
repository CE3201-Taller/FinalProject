/* 
 *
 *
 * @file  shift_left_gate.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/09/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module shift_left_gate #(BITS = 3)
(
     input logic[BITS-1:0] bus_i,
     input logic[BITS-1:0] shift_i,
    output logic[BITS-1:0] bus_o
);
    assign bus_o = bus_i << shift_i;
endmodule
