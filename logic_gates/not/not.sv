// Using logic since it can be used for assign statements, initial blocks, and always blocks
/* verilator lint_off DECLFILENAME */
module NOT(input logic a, output logic y);

    assign y = ~a; // Y = A'

endmodule
