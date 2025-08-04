module SR_Latch_tb();

logic set, reset, q, q_not;
int error = 0;

SR_Latch dut (set, reset, q, q_not);

    initial
        begin
            $dumpfile("sr_latch.vcd");
            $dumpvars(0, SR_Latch_tb);

            set = 0; reset = 0; 
            #10ns;
            $error("Latch state, undefined conditions (preset, clear state). Set = 0, Reset = 0 is not valid.");

            set = 0; reset = 1;
            #10ns;
            assert(q === 0) else error = 1;
            assert(q_not === 1) else error = 1;

            set = 1; reset = 0;
            #10ns;
            assert(q === 1) else error = 1;
            assert(q_not === 0) else error = 1;

            set = 1; reset = 1;
            #10ns;
            assert(q === 1) else error = 1;
            assert(q_not === 1) else error = 1;

            $finish;
        end

    always@(set, reset, q, q_not, error)
        if(!error) $display("Time = %0d\t inputs: set = %b\t reset = %b\t output: q = %b\t q_not = %b\t", $time, set, reset, q, q_not);

        else
            begin
                $error("Test fails at time = %0d\t inputs: set = %b\t reset = %b\t output: q = %b\t q_not = %b\t", $time, set, reset, q, q_not);
                error = 0;
            end
endmodule