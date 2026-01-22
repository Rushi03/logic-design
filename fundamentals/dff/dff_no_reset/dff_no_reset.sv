module dff_no_reset(
    input logic clk,
    input logic d_in,
    output logic q_out
);

always_ff @(posedge clk)
    q_out <= d_in;

endmodule