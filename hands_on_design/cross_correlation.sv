/*
Alice wants to design a circuit which takes two serial inputs sig_x_i and sig_y_i such that the input sig_y_i has 
randomly delayed versions of 1s seen on the input sig_x_i. The circuit produces an output z_o which is asserted whenever 
there is an expectation of seeing a 1 on the sig_y_i input. Alice needs your help in designing the circuit.

All the flops should be positive edge triggered with asynchronous reset (if any).

Interface Specifications

- The interface guarantees that the number of 1s seen on sig_x_i will be seen on input sig_y_i within 32-clock cycles
*/

module cross_correlation(
    input logic clk,
    input logic reset,
    input logic sig_x_i,
    input logic sig_y_i,
    output logic z_o
);

    // Max 16 cycles sig_x_i without seeing sig_y_i
    logic[4:0] count_q;
    logic[4:0] nxt_count;

    always_ff @(posedge clk or posedge reset)
        if (reset)
            count_q <= 5'h0;
        else
            count_q <= nxt_count;
    
    // Increase counter for expected sig_y_i
    assign nxt_count = count_q + {4'b0, sig_x_i} - {4'b0, sig_y_i};
    
    // Use reduction OR for output
    assign z_o = |count_q[4:0];

endmodule