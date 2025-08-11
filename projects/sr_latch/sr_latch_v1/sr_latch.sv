module sr_latch(input logic set, 
                input logic reset,
                /* verilator lint_off UNOPTFLAT */ 
                output logic q, 
                output logic q_not);

    assign q = ~(reset | q_not);
    assign q_not = ~(set | q);

endmodule
