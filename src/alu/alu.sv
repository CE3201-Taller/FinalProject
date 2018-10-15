/* 
 *
 *
 * @file  alu.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module alu #(parameter BITS = 3)
(
     input logic [BITS-1:0] bus_a_i, bus_b_i,
     input logic [2:0]      control_i,
    output logic [BITS-1:0] bus_s_o,
    output logic [3:0]      flags_o
);
    logic[BITS-1:0] or_l, and_l, not_l, xor_l, addr_l, shift_rl, shift_ll;
    logic flag_o, flag_v, flag_n, flag_c;
    or_gate  #(BITS) opOr (bus_a_i, bus_b_i, or_l);
    and_gate #(BITS) opAnd(bus_a_i, bus_b_i, and_l);
    not_gate #(BITS) opNot(bus_a_i, not_l);
    xor_gate #(BITS) opXor(bus_a_i, bus_b_i, xor_l);
    adder_substractor #(BITS) opSum(.bus_a_i(bus_a_i), 
                                    .bus_b_i(bus_b_i), 
                                    .select_i(control_i[0]), 
                                    .bus_o(addr_l), 
                                    .flag_v_o(flag_v));
    shift_left_gate   #(BITS) opShiftL(bus_a_i, bus_b_i, shift_ll);
    shift_right_gate  #(BITS) opShiftR(bus_a_i, bus_b_i, shift_rl);
    mux_eight #(BITS) opSelector(xor_l, xor_l, shift_ll, shift_rl, or_l, and_l, 
                                 xor_l, not_l, control_i, bus_s_o);
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
