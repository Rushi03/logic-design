/*
Study the following waveform and generate the output clock `clk_v1` and `clk_v2` using the input clock `clk_in`

All the flops should be positive edge triggered with asynchronous resets (if any).
*/

module clk_generator(
    input logic clk_in,
    input logic reset,
    output logic clk_v1,
    output logic clk_v2
);

    logic d;
    logic q;

    always_ff @(posedge clk_in or posedge reset)
        if (reset)
            q <= 1'b0;
        else
            q <= d;

    // clk_in / 2
    assign d = ~q;
    // rising and falling edges match clk_in, no delay
    assign clk_v1 = clk_in & q;
    assign clk_v2 = clk_in ^ clk_v1;


endmodule