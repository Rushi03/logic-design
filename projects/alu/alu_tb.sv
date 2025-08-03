module ALU_tb();

logic signed [15:0] a, b, result;
logic [3:0] opcode;
logic zero, negative, carryout, overflow;
int error = 0;

ALU dut(a, b, opcode, result, zero, negative, carryout, overflow);

    initial
        begin
            $dumpfile("alu.vcd");
            $dumpvars(0, ALU_tb);

            a = 1; b = 0; opcode = 4'b0000;
            $display("AND result: ");
            #10ns;
            assert(result === 0) else error = 1;

            a = 0; b = 1; opcode = 4'b0001;
            $display("OR result: ");
            #10ns;
            assert(result === 1) else error = 1;

            a = 1; b = 1; opcode = 4'b0010;
            $display("XOR result: ");
            #10ns;
            assert(result === 0) else error = 1;

            a = 1; b = 0; opcode = 4'b0011;
            $display("NOR result: ");
            #10ns;
            assert(result === -2) else error = 1;

            a = -54; b = -32; opcode = 4'b0100;
            $display("NAND result: ");
            #10ns;
            assert(result === 63) else error = 1;

            a = 24; b = 0; opcode = 4'b0101;
            $display("NOT result: ");
            #10ns;
            assert(result === -25) else error = 1;

            a = 32767; b = 1; opcode = 4'b0110;
            $display("ADD result: ");
            #10ns;
            assert(result === -2) else error = 1;

            a = 5; b = 4; opcode = 4'b0111;
            $display("SUB result: ");
            #10ns;
            assert(result === 1) else error = 1;

            a = 3; b = 10; opcode = 4'b1000;
            $display("SLT result: ");
            #10ns;
            assert(result === 1) else error = 1;

            a = 4; b = 2; opcode = 4'b1001;
            $display("MULT result: ");
            #10ns;
            assert(result === 8) else error = 1;

            a = 10; b = 5; opcode = 4'b1010;
            $display("DIV result: ");
            #10ns;
            assert(result === 2) else error = 1;

            a = 4; b = 3; opcode = 4'b1011;
            $display("MOD result: ");
            #10ns;
            assert(result === 1) else error = 1;

            a = -2; b = 0; opcode = 4'b1100;
            $display("SLA result: ");
            #10ns;
            assert(result === -32) else error = 1;

            a = 8; b = 0; opcode = 4'b1101;
            $display("SRA result: ");
            #10ns;
            assert(result === 0) else error = 1;

            a = 10; b = 10;
            $display("Default result: ");
            #10ns;
            assert(result === 0) else error = 1;
        end

        always@(a, b, result, error)
            if(!error) $display("Time = %0d\t A = %0d\t B = %0d\t Result = %0d\t Zero = %0d\t Negative = %0d\t Carryout = %0d\t Overflow = %0d\t", 
                                $time, a, b, result, zero, negative, carryout, overflow);
            
            else
                begin
                    $error("Time = %0d\t A = %0d\t B = %0d\t Result = %0d\t Zero = %0d\t Negative = %0d\t Carryout = %0d\t Overflow = %0d\t", 
                           $time, a, b, result, zero, negative, carryout, overflow);
                    error = 0;
                end

endmodule