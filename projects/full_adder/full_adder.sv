module FULL_ADDER(input logic a, input logic b, input logic c_in, output logic sum, output logic c_out);

    assign sum = (a ^ b) ^ c_in;                // Sum = A'B'C_in + A'BC_in' + AB'C_in' + ABC_in
    assign c_out = (a & b) | ((a ^ b) & c_in);  // Cout = AB + C_in(AB' + A'B)

endmodule