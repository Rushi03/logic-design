module FULL_ADDER_tb();

logic a, b, c_in, sum, c_out;
int error = 0;

FULL_ADDER dut (a, b, c_in, sum, c_out);

    initial
        begin
            $dumpfile("full_adder.vcd");
            $dumpvars(0, FULL_ADDER_tb);

            a = 0; b = 0; c_in = 0;
            #10ns;
            assert(sum === 0) else error = 1;
            assert(c_out === 0) else error = 1;

            c_in = 1;
            #10ns;
            assert(sum === 1) else error = 1;
            assert(c_out === 0) else error = 1;

            b = 1; c_in = 0;
            #10ns;
            assert(sum === 1) else error = 1;
            assert(c_out === 0) else error = 1;

            c_in = 1;
            #10ns;
            assert(sum === 0) else error = 1;
            assert(c_out === 1) else error = 1;

            a = 1; b = 0; c_in = 0;
            #10ns;
            assert(sum === 1) else error = 1;
            assert(c_out === 0) else error = 1;

            c_in = 1;
            #10ns;
            assert(sum === 0) else error = 1;
            assert(c_out === 1) else error = 1;

            b = 1; c_in = 0;
            #10ns;
            assert(sum === 0) else error = 1;
            assert(c_out === 1) else error = 1;

            c_in = 1;
            #10ns;
            assert(sum === 1) else error = 1;
            assert(c_out === 1) else error = 1;

            $finish;
        end
    
    always@(a, b, c_in, sum, c_out)
        if(!error) $display("Time = %0d\t inputs: a = %b\t b = %b\t c_in = %b\t output: sum = %b\t c_out = %b", $time, a, b, c_in, sum, c_out); // using %0d to take out extra spaces

        else
            begin
                $error("Test fails at time = %0d\t inputs: a = %b\t b = %b\t c_in = %b\t output: sum = %b\t c_out = %b", $time, a, b, c_in, sum, c_out); // using %0d to take out extra spaces
                error = 0;
            end

endmodule