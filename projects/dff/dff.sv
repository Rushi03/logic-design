module dff_async_reset(input logic d, input logic clk, input logic reset_n, output logic q);

always_ff@(posedge clk or negedge reset_n)
    if (!reset_n)
        q <= 1'b0;
    else
        q <= d;

endmodule