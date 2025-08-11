module mux_tb();

logic[3:0] in = 4'b1001; 
logic[1:0] select;
logic out;
int error = 0;

mux dut(in, select, out);

    initial
        begin
            $dumpfile("mux.vcd");
            $dumpvars(0, mux_tb);

            select = 0;
            #10ns;
            assert(out === in[select]) else error = 1;

            select = 1;
            #10ns;
            assert(out === in[select]) else error = 1;

            select = 2;
            #10ns;
            assert(out === in[select]) else error = 1;

            select = 3;
            #10ns;
            assert(out === in[select]) else error = 1;

            $finish;
        end

    always@(in, select, out, error)
        if(!error) $display("Time = %0d\t inputs: in = %b\t select = %b\t output: out = %b\t", $time, in, select, out);

        else
            begin
                $error("Test fails at time = %0d\t inputs: in = %b\t select = %b\t output: out = %b\t", $time, in, select, out);
                error = 0;
            end

endmodule
