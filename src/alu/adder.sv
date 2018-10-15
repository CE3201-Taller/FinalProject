/* 
 *
 *
 * @file  adder.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module adder #(parameter BITS = 3)
(
    input logic[BITS-1:0] bus_a_i, bus_b_i,
    input logic carry_i,
    output logic[BITS-1:0] bus_o,
    output logic flag_overflow_o
);
    logic[BITS:0] carry_o;
    assign carry_o[0] = carry_i;
    assign flag_overflow_o = carry_o[BITS];
    genvar i;
    generate 
        for (i = 0; i < BITS; i = i+1) begin:forloop
            one_bit_full_adder addrr(bus_a_i[i], bus_b_i[i], carry_o[i], bus_o[i], carry_o[i+1]);
        end
    endgenerate	
endmodule
