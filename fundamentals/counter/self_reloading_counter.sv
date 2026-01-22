module self_reloading_counter(
    input logic clk,
    input logic reset,
    input logic load_i,
    input logic load_val_i,
    output logic count_o
);

    logic[3:0] nxt_count;
    logic[3:0] count_q;
    logic[3:0] load_val_q;

    always_ff @(posedge clk or posedege reset)
        if (reset)
            count_q <= 4'h0;
        else
            count_q <= nxt_count;

    assign nxt_count = load_i ? load_val_i : (count_q == 4'hF) ? load_val_q : count_q[3:0] + 4'h1;

    always_ff @(posedge clk or posedge reset)
        if (reset)
            load_val_q <= 4'h0;
        else if (load_i)
            load_val_q <= load_val_i;

    assign count_o = count_q;

endmodule