module dff_tb();

logic d, clk, reset_n, q;
int error = 0;

dff_async_reset dut (d, clk, reset_n, q);

always #5ns clk = ~clk;

    initial 
        begin
            $dumpfile("dff.vcd");
            $dumpvars(0, dff_tb);

            clk = 0; d = 0; reset_n = 0;
            
            d = 0; reset_n = 0;
            #10ns;
            assert(q === 0) else error = 1;

            d = 1;
            #10ns;
            assert(q === 0) else error = 1;

            d = 0; reset_n = 1;
            #10ns;
            assert(q == 0) else error = 1;

            d = 1;
            #10ns;
            assert(q === 1) else error = 1;

            reset_n = 0;
            #10ns;
            assert(q === 0) else error = 1;

            $finish;
        end
    
    always@(d, reset_n, q, error)
        if(!error) $display("Time =  %0d, d = %0d, reset_n = %0d, clk = %0d, q = %0d", $time, d, reset_n, clk, q);

        else
            begin
                $error("Time =  %0d, d = %0d, reset_n = %0d, clk = %0d, q = %0d", $time, d, reset_n, clk, q);
                error = 0;
            end

endmodule