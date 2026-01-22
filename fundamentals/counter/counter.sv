// 4-bit counter
module counter(
    input logic clk,
    input logic reset;
    output logic[3:0] count_out;
);

logic[3:0] count_q;
logic[3:0] nxt_count;

// Sequential portion of counter to save count value
always_ff @(posedge clk or posedge reset)
    if (reset)
        count_q = 4'b0000; // 4'h0
    else
        count_q <= nxt_count;

// Combinational portion incrementing counter and assigning output
assign nxt_count = count_q[3:0] + 4'b0001; // 4'h1

assign count_out = count_q;

endmodule