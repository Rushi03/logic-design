/*
You are tasked to design a circuit which would detect a 3-bit palindrome sequence from incoming stream of bits.

Palindrome code is a sequence of characters which reads the same backward as forward. For example, the following are 
palindromes: 101, 010, 111, 000, etc.

All the flops should be positive edge triggered with asynchronous resets (if any).

Interface Requirements

- Output must be given every cycle
- Input will be a stream of bits presented to the circuit on every cycle
*/

module palindrome3b(
    input logic clk,
    input logic reset,
    input logic x_i,
    output logic palindrome_o
);

    logic[1:0] count_q;         // current count
    logic[1:0] nxt_count;       // next count
    logic[1:0] shft_reg_q;      // current register
    logic[1:0] nxt_shft_reg;    // next register

    always_ff @(posedge clk or posedge reset)
        if (reset) begin
            count_q <= 2'b00;
            shft_reg_q <= 2'b00;
        end else begin
            count_q <= nxt_count;
            shft_reg_q <= nxt_shft_reg;
        end

    assign nxt_count = count_q[1] ? count_q : count_q[0] + 2'b01;
    assign nxt_shft_reg = {shft_reg_q[0], x_i};
    assign palindrome_o = (x_i == shft_reg_q[1]) & count_q[1];

endmodule