module HALF_ADDER(input logic a, input logic b, output logic sum, output logic carry);
    
    assign sum = (a ^ b);       // Sum = AB' + A'B
    assign carry = (a & b);     // Carry = AB

endmodule