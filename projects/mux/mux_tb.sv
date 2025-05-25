module MUX_tb();

logic[3:0] in = 4'b1001; 
logic[1:0] select;
logic out;
int error = 0;

MUX dut(in, select, out);

    initial
        begin
            $dumpfile("mux.vcd");
            $dumpvars(0, MUX_tb);

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
        end

    always@(in, select, out, error)
        if(!error) $display("Time = %0d\t inputs: in = %b\t select = %b\t output: out = %b\t", $time, in, select, out); // using %0d to take out extra spaces

        else
            begin
                $error("Test fails at time = %0d\t inputs: in = %b\t select = %b\t output: out = %b\t", $time, in, select, out); // using %0d to take out extra spaces
                error = 0;
            end

endmodule

// Cannot simultaneously run both testbench, comment one testbench while testing
module MUX2_tb();

logic[3:0] in0 = 4'b1100;
logic[3:0] in1 = 4'b1101;
logic[3:0] in2 = 4'b1110;
logic[3:0] in3 = 4'b1111;
logic[1:0] select2;
logic[3:0] out2;
int error2 = 0;


MUX2 dut(in0, in1, in2, in3, select2, out2);

    initial
        begin
            $dumpfile("mux2.vcd");
            $dumpvars(0, MUX2_tb);

            select2 = 0;
            #10ns;
            assert(out2 === in0) else error2 = 1;

            select2 = 1;
            #10ns;
            assert(out2 === in1) else error2 = 1;

            select2 = 2;
            #10ns;
            assert(out2 === in2) else error2 = 1;

            select2 = 3;
            #10ns;
            assert(out2 === in3) else error2 = 1;
        end

    always@(in0, in1, in2, in3, select2, out2, error2)
        if(!error2) $display("Time = %0d\t inputs: in0 = %b\t in1 = %b\t in2 = %b\t in3 = %b\t select2 = %b\t output: out2 = %b\t", 
                        $time, in0, in1, in2, in3, select2, out2); // using %0d to take out extra spaces

        else
            begin
                $error("Test fails at time = %0d\t inputs: in0 = %b\t in1 = %b\t in2 = %b\t in3 = %b\t select2 = %b\t output: out2 = %b\t", 
                        $time, in0, in1, in2, in3, select2, out2); // using %0d to take out extra spaces
                error2 = 0;
            end

endmodule