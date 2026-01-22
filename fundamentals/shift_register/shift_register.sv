module shift_register #(
    parameter = 4
)(
    input logic clk,
    input logic reset,
    input logic x_i,
    output logic left_shift_o,
    output logic right_shift_o
);

    logic[N-1:0] left_shift_q;
    logic[N-1:0] nxt_left_shift;

    logic[N-1:0] right_shift_q;
    logic[N-1:0] nxt_right_shift;

    always_ff @(posedge clk or posedge reset)
        if (reset)
            left_shift_q <= {N{1'b0}};
        else
            left_shift_q <= nxt_left_shift;

    assign nxt_left_shift = {left_shift_q[N-2:0], x_i};
    assign left_shift_o = left_shift_q;

    always_ff @(posedge clk or posedge reset)
        if (reset)
            right_shift_q <= {N{1'b0}};
        else
            right_shift_q <= nxt_right_shift;

    assign nxt_right_shift = {x_i, right_shift_q[N-1:1]}
    assign right_shift_o = right_shift_q;

endmodule