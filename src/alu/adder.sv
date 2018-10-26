/* 
 *
 *
 * @file  adder.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module adder #(parameter WIDTH = 3)
(
     input logic[WIDTH-1:0] bus_a_i, bus_b_i,
     input logic           carry_i,
    output logic[WIDTH-1:0] bus_o,
    output logic           flag_v_o
);
    logic[WIDTH:0] carry_o;
    assign carry_o[0] = carry_i;
    assign flag_v_o = carry_o[WIDTH];
    genvar i;
    generate 
        for (i = 0; i < WIDTH; i = i+1) begin:forloop
            one_bit_full_adder addrr(bus_a_i[i], bus_b_i[i], carry_o[i], bus_o[i], carry_o[i+1]);
        end
    endgenerate
endmodule
