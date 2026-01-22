module dff_async_reset(
    input logic d_in, 
    input logic clk, 
    input logic reset, 
    output logic q_out
);

    always_ff @(posedge clk or posedge reset)
        if (reset)
            q_out <= 1'b0;
        else
            q_out <= d_in;

endmodule
