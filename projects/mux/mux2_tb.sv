// Cannot simultaneously run both testbench, comment one testbench while testing
module MUX2_tb();

logic[3:0] in0 = 4'b1100;
logic[3:0] in1 = 4'b1101;
logic[3:0] in2 = 4'b1110;
logic[3:0] in3 = 4'b1111;
logic[1:0] select;
logic[3:0] out;
int error = 0;


MUX2 dut(in0, in1, in2, in3, select, out);

    initial
        begin
            $dumpfile("mux2.vcd");
            $dumpvars(0, MUX2_tb);

            select = 0;
            #10ns;
            assert(out === in0) else error = 1;

            select = 1;
            #10ns;
            assert(out === in1) else error = 1;

            select = 2;
            #10ns;
            assert(out === in2) else error = 1;

            select = 3;
            #10ns;
            assert(out === in3) else error = 1;

            $finish;
        end

    always@(in0, in1, in2, in3, select, out, error)
        if(!error) $display("Time = %0d\t inputs: in0 = %b\t in1 = %b\t in2 = %b\t in3 = %b\t select = %b\t output: out = %b\t", 
                        $time, in0, in1, in2, in3, select, out);

        else
            begin
                $error("Test fails at time = %0d\t inputs: in0 = %b\t in1 = %b\t in2 = %b\t in3 = %b\t select = %b\t output: out = %b\t", 
                        $time, in0, in1, in2, in3, select, out);
                error = 0;
            end

endmodule