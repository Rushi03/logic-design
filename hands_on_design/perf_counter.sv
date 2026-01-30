/*
You are working on the next generation Processor unit and are responsible for designing the CPU performance 
monitor extension. The performance monitors usually contains a fixed number of counters which can be programmed 
to be triggered on an event from different CPU units.

Design the base counter module which can be instantiated depending on the implemented number of such counter in 
the CPU. The counter should be triggered on a single-bit event received from the CPU pipeline. The counter output 
should only be accessible to software reads and thus has a software read request as an input. The specifications for 
the counter mandate that after the read is complete the counter should reset the value to 0. Both software read and 
the counter triggered event are completely independent of each other and doesn't have any protocol requirements.

The width of the counter is parameterizable.

All the flops should be positive edge triggered with asynchronous resets (if any).
*/

module perf_counter #(
    parameter CNT_W = 4
)(
    input logic clk,
    input logic reset,
    input logic cpu_trig_i,
    input logic sw_req_i,
    output logic[CNT_W-1:0] p_count_o
);

    logic[CNT_W-1:0] p_count_q;
    logic[CNT_W-1:0] nxt_p_count;

    always_ff @(posedge clk or posedge reset)
        if (reset)
            p_count_q <= {CNT_W{1'b0}};
        else
            p_count_q <= nxt_p_count[CNT_W-1:0];

    assign nxt_p_count = (sw_req_i) ? {CNT_W-1{1'b0}, cpu_trig_i} : (p_count_q + {{CNT_W-1{1'b0}}, cpu_trig_i});
    assign p_count_o = {CNT_W{sw_req_i}} & p_count_q;

endmodule