module alu #(parameter WIDTH = 32)                                  // Width can be 8, 16, 32
          (input logic [WIDTH-1:0] a,
           input logic [WIDTH-1:0] b,
           input logic [3:0] opcode,
           output logic [WIDTH-1:0] result,
           output logic zero,
           output logic negative,
           output logic carryout,
           output logic overflow);

logic signed [WIDTH-1:0] sA, sB;
logic [WIDTH:0] fullAddSub; // carry bit detection

always_comb 
    begin
        sA = a;
        sB = b;
        carryout = 0;
        overflow = 0;
        fullAddSub = 0;

        case(opcode)
            4'b0000: result = a & b;                                // AND
            4'b0001: result = a | b;                                // OR
            4'b0010: result = a ^ b ;                               // XOR
            4'b0011: result = ~(a | b);                             // NOR
            4'b0100: result = ~(a & b);                             // NAND
            4'b0101: result = ~a;                                   // NOT
            4'b0110: 
                begin                                               // ADD
                    fullAddSub = {1'b0, a} + {1'b0, b};
                    result = fullAddSub[WIDTH-1:0];
                    carryout = fullAddSub[WIDTH];
                    overflow = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
                end
            4'b0111: 
                begin                                               // SUB
                    fullAddSub = {1'b0, a} - {1'b0, b};
                    result = fullAddSub[WIDTH-1:0];
                    carryout = fullAddSub[WIDTH];
                    overflow = (a[WIDTH-1] != b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);
                end
            4'b1000: result = (sA < sB) ? 1 : 0;                    // SLT - set less than
            4'b1001: result = sA * sB;                              // MULT
            4'b1010: result = (b != 0) ? sA / sB : 0;               // DIV
            4'b1011: result = (b != 0) ? sA % sB : 0;               // MOD
            4'b1100: result = sA <<< 4;                             // SLA - shift left arithmetic
            4'b1101: result = sA >>> 4;                             // SRA - shift right arithmetic
            default: result = 0;
        endcase

        zero = (result == 0);
        negative = result[WIDTH-1];
    end

endmodule
