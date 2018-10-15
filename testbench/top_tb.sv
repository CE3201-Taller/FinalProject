/* 
 * @file  top_tb.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 * Based on code found in Harris, D., & Harris, S. Digital design and computer architecture. Elsevier. 2012.
 */
 
 
 module top_tb();

    logic clk, rst;
    logic [31:0] write_data, data_address;
    logic mem_write;
    
    top dut(.clk_i(clk),
            .rst_i(rst),
            .write_data_o(write_data),
            .data_address_o(data_address),
            .mem_write_o(mem_write));
    initial begin
        #0  rst <= 1;
        #22 rst <= 0;
    end
    always begin
        #5 clk <= 1;
        #5 clk <= 0;
    end
    always @(negedge clk) begin
        if (mem_write) begin
            if (data_address === 100 & write_data === 7) begin
                $display("Simulation succeded");
                $stop;
            end
            else if (data_address !== 96) begin
                $display("Simulation failed");
                $stop;
            end
        end
    end
endmodule

	