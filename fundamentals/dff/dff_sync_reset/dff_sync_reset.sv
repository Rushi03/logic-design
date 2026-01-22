module dff_sync_reset(
    input logic clk,
    input logic d_in,
    input logic reset,
    output logic q_out
);

    always_ff @(posedge clk)
        if (reset)
            q_out <= 1'b0;
        else
            q_out <= d_in;

endmodule