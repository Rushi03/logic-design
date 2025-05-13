// Using logic since it can be used for assign statements, initial blocks, and always blocks
module NOT(input logic a, output logic y);

    assign y = ~a; // Y = A'

endmodule