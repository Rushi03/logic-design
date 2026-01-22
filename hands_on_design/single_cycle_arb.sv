/*
You are leading a complex SoC which interacts with a lot of peripherals. As a result there is a need for an arbitration scheme to be 
used across the SoC. You decide to design a parameterized fixed priority arbitration scheme which grants a winner every cycle.

Design the parameterized single cycle arbiter module with fixed priority arbitration scheme. All the flops (if any) should be positive 
edge triggered with asynchronous resets.

Interface Requirements

- Arbiter should grant a single winner (if any) every cycle
- The arbiter should use a fixed priority arbitration scheme
- Port[0] has the highest priority and priority decreases with incrementing port numbers
*/

module single_cycle_arbiter #(
    parameter N = 32
)(
    input logic clk,
    input logic reset,
    input logic[N-1:0] req_i,
    output logic[N-1:0] gnt_o
);

// Highest priority is port[0]
// Port priority decreases as port increases
logic[N-1:0] priority_req;

// Highest prioirty
assign priority_req[0] = 1'b0;

// Assign priority to ports
for (genvar i=0; i<N-1; i=i+1) begin
    assign priority_req[i+1] = priority_req[i] | req_i[i];
end

// Granted port
assign gnt_o = req_i & ~priority_req;
 
endmodule