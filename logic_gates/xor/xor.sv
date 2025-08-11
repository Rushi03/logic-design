// Using logic since it can be used for assign statements, initial blocks, and always blocks
/* verilator lint_off DECLFILENAME */
module XOR(input logic a, input logic b, output logic y);

    assign y = a ^ b; // Y = AB' + A'B

endmodule
