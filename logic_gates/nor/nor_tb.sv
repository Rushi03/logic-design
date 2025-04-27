module NOR_tb();

// Using logic since it can be used for assign statements, initial blocks, and always blocks
logic a, b, y;
int error = 0;

NOR dut(a, b, y); // device under test i.e. the gate we want to test

    initial
        begin
            $dumpfile("nor.vcd");
            $dumpvars(0, NOR_tb);

            a = 0; b = 0;
            #10ns;  // time delay
            assert(y === 1) else error = 1;

            b = 1;  // a = 1 
            #10ns;  // time delay
            assert(y === 0) else error = 1;

            a = 1; b = 0;
            #10ns;  // time delay
            assert(y === 0) else error = 1;

            b = 1;  // a = 1 
            #10ns;  // time delay
            assert(y === 0) else error = 1;
        end
    
    always@(a, b, y, error)
        if(!error) $display("Time = %0d\t inputs: a = %b\t b = %b\t output: y = %b", $time, a, b, y); // using %0d to take out extra spaces

        else
            begin
                $error("Test fail at time = %0d\t inputs: a = %b\t b = %b\t output: y = %b", $time, a, b, y); // using %0d to take out extra spaces
                error = 0;
            end

endmodule