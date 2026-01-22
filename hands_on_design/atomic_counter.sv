/*
Design the 64-bit counter module and the appropriate interfacing mechanism to ensure single-copy atomic counter read operations. 
All the flops should be positive edge triggered with asynchronous resets (if any).

Interface Requirements

The counter value is read by a 32-bit wide bus but the output should be single-copy atomic. 
The interface is a simple request and acknowledge interface with the following strict requirements:

- Request can be a pulse or can get back to back multiple requests
- The acknowledge output must be given one cycle after the request is asserted
- The count_o signal must be 0 when the ack_o signal is not asserted
- The controller will always send two requests in order to read the full 64-bit counter
- The first request will always have the atomic_i input asserted
- The second request will not have the atomic_i input asserted
*/

module atomic_counter(
    input logic clk,
    input logic reset,
    input logic trig_i,
    input logic atomic_i,
    input logic req_i,
    output logic[31:0] counter_o,
    output logic ack_o
);

logic[63:0] counter;
logic[63:0] counter_q;
logic atomic_q;
logic req_q;
logic[31:0] counter_msb;

always_ff @(posedge clk or posedge reset)
    if (reset)
        counter_q <= 64'h0;
    else
        counter_q <= counter;

always_ff @(posedge clk or posedge reset)
    if (reset) begin
        atomic_q <= 1'b0;
        req_q <= 1'b0;
    end
    else begin
        atomic_q <= atomic_i;
        req_q <= req_i;
    end

assign counter = counter_q[63:0] + {{63{1'b0}}, trig_i};

always_ff @(posedge clk or posedge reset)
    if (reset)
        counter_msb <= 32'h0;
    else if (atomic_q)
        counter_msb <= counter_q[63:32];

assign ack_o = req_q;
assign counter_o = req_q ? (atomic_q ? counter_q[31:0] : counter_msb[31:0]) : 32'h0;


endmodule