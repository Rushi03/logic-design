module NOT_tb();

// Using logic since it can be used for assign statements, initial blocks, and always blocks
logic a, y;
int error = 0;

NOT dut(a, y); // device under test i.e. the gate we want to test

    initial
        begin
            $dumpfile("not.vcd");
            $dumpvars(0, NOT_tb);

            a = 0;
            #10ns;  // time delay
            assert(y === 1) else error = 1;

            a = 1;
            #10ns;  // time delay
            assert(y === 0) else error = 1;

            $finish;
        end
    
    always@(a, y, error)
        if(!error) $display("Time = %0d\t inputs: a = %b\t output: y = %b", $time, a, y); // using %0d to take out extra spaces

        else
            begin
                $error("Test fail at time = %0d\t inputs: a = %b\t output: y = %b", $time, a, y); // using %0d to take out extra spaces
                error = 0;
            end

endmodule