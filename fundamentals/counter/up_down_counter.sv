module up_down_counter(
    input logic clk,
    input logic reset,
    input logic up_in;
    output logic[3:0] count_o
);

    logic[3:0] count_q;
    logic[3:0] nxt_count;

    // Sequential portion of counter
    always_ff @(posedge clk or posedge reset)
        if (reset)
            count_q <= 4'b0000; // 4'h0
        else
            count_q <= nxt_count;

    // Combinational portion of counter
    assign nxt_count = up_in ? count_q[3:0] + 4'b0001 : count_q[3:0] - 4'b0001; // 4'h1

    assign count_o = count_q;

endmodule