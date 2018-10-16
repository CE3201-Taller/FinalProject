/* 
 *
 *
 * @file  adder_substractor.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/09/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module adder_substractor #(parameter BITS = 3)
(
     input logic [BITS-1:0] bus_a_i, bus_b_i,
     input logic            select_i,
    output logic [BITS-1:0] bus_o,
    output logic            flag_v_o
);
    
    logic[BITS-1:0] bus_tmp, selected;
    xor_gate #(BITS) oper(.bus_a_i(bus_b_i),
                          .bus_b_i(selected), 
                          .bus_s_o(bus_tmp));
                          
    adder    #(BITS) addr(.bus_a_i(bus_a_i),
                          .bus_b_i(bus_tmp),
                          .carry_i(select_i),
                          .bus_o(bus_o),
                          .flag_v_o(flag_v_o));
    assign selected = ~(~select_i);
endmodule
