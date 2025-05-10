module HALF_ADDER_tb();

logic a, b, sum, carry;
int error = 0;

HALF_ADDER dut (a, b, sum, carry);

    initial 
        begin
            $dumpfile("half_adder.vcd");
            $dumpvars(0, HALF_ADDER_tb);

            a = 0; b = 0;
            #10ns;
            assert(sum === 0) else error = 1;
            assert(carry === 0) else error = 1;

            b = 1;
            #10ns;
            assert(sum === 1) else error = 1;
            assert(carry === 0) else error = 1;

            a = 1; b = 0;
            #10ns;
            assert(sum === 1) else error = 1;
            assert(carry === 0) else error = 1;

            b = 1;
            #10ns;
            assert(sum === 0) else error = 1;
            assert(carry === 1) else error = 1;
        end
            
    always@(a, b, carry, sum, error)
        if(!error) $display("Time = %0d\t inputs: a = %b\t b = %b\t output: sum = %b carry: %b", $time, a, b, sum, carry); // using %0d to take out extra spaces

        else
            begin
                $error("Test fails at time = %0d\t inputs: a = %b\t b = %b\t output: sum = %b carry: %b", $time, a, b, sum, carry); // using %0d to take out extra spaces
                error = 0;
            end

endmodule