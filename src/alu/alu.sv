/* 
 *
 *
 * @file  alu.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module alu #(parameter WIDTH = 3)
(
     input logic [WIDTH-1:0] bus_a_i, bus_b_i,
     input logic [1:0]       control_i,
    output logic [WIDTH-1:0] bus_s_o,
    output logic [3:0]       flags_o
);
    logic[WIDTH-1:0] addr_l, and_l, orr_l;
    logic flag_o, flag_v, flag_n, flag_c;
    adder_substractor #(WIDTH) adder_sub(.bus_a_i(bus_a_i), 
                                         .bus_b_i(bus_b_i), 
                                         .select_i(control_i[0]), 
                                         .bus_o(addr_l), 
                                         .flag_v_o(flag_v));
    and_gate #(WIDTH) and_op(bus_a_i,
                             bus_b_i,
                             and_l);
     or_gate #(WIDTH)  or_op(bus_a_i,
                             bus_b_i,
                             orr_l);
    mux_four #(WIDTH) opSelector(.bus_a_i(addr_l), 
                                 .bus_b_i(addr_l), 
                                 .bus_c_i(and_l), 
                                 .bus_d_i(orr_l),
                                 .select_i(control_i),
                                 .bus_o(bus_s_o));
    always_comb begin
        flag_o  = 1'b0;
        flag_c  = 1'b0;
        flag_n  = 1'b0; 
        flags_o[0] = flag_o;
        flags_o[1] = flag_v;
        flags_o[2] = flag_n;
        flags_o[3] = flag_c;
    end
endmodule
