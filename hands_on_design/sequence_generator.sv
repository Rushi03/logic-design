/*
Design the following sequence generator module:

0 → 1 → 1 → 1 → 2 → 2 → 3 → 4 → 5 → 7 → 9 → 12 → 16 → 21 → 28 → 37 → ...

Assume the sequence goes on forever until the circuit is reset. All the flops should be positive edge 
triggered with asynchronous resets (if any).

Interface Requirements

- The generator should produce output every cycle
- You can assume that the sequence generator would never overflow
*/

module seq_generator(
    input logic clk,
    input logic reset,
    output logic[31:0] seq_o
);

logic[31:0] seq_t1;
logic[31:0] seq_t2;
logic[31:0] seq_t3;
logic[31:0] nxt_seq;

always_ff @(posedge clk or posedge reset)
    if (reset) begin
        seq_t1 <= 32'h1;
        seq_t2 <= 32'h1;
        seq_t3 <= 32'h0;
    end else begin
        seq_t1 <= nxt_seq[31:0];
        seq_t2 <= seq_t1[31:0];
        seq_t3 <= seq_t2[31:0];
    end

assign nxt_seq = seq_t2[31:0] + seq_t3[31:0];
assign seq_o = seq_t3;

endmodule