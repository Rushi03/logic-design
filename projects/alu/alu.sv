module ALU(input logic [31:0] a,
           input logic [31:0] b,
           input logic [3:0] opcode,
           output logic [31:0] result,
           output logic zero,
           output logic negative,
           output logic carryout,
           output logic overflow);

logic signed [31:0] sA, sB;
logic [32:0] fullAddSub; // carry bit detection

always_comb 
    begin
        sA = a;
        sB = b;
        carryout = 0;
        overflow = 0;
        fullAddSub = 33'd0;

        case(opcode)
            4'b0000: result = a & b;                                // AND
            4'b0001: result = a | b;                                // OR
            4'b0010: result = a ^ b ;                               // XOR
            4'b0011: result = ~(a | b);                             // NOR
            4'b0100: result = ~(a & b);                             // NAND
            4'b0101: result = ~a;                                   // NOT
            4'b0110: 
                begin                                               // ADD
                    fullAddSub = {1'b0, a} + {1'b0, a};
                    result = fullAddSub[31:0];
                    carryout = fullAddSub[32];
                    overflow = (a[31] == b[31]) && (result[31] != a[31]);
                end
            4'b0111: 
                begin                                               // SUB
                    fullAddSub = {1'b0, a} - {1'b0, b};
                    result = fullAddSub[31:0];
                    carryout = fullAddSub[32];
                    overflow = (a[31] != b[31]) && (result[31] != a[31]);
                end
            4'b1000: result = (sA < sB) ? 32'd1 : 32'd0;            // SLT - set less than
            4'b1001: result = sA * sB;                              // MULT
            4'b1010: result = (b != 0) ? sA / sB : 32'd0;           // DIV
            4'b1011: result = (b != 0) ? sA % sB : 32'd0;           // MOD
            4'b1100: result = sA <<< 4;                             // SLA - shift left arithmetic
            4'b1101: result = sA >>> 4;                             // SRA - shift right arithmetic
            default: result = 32'd0;
        endcase

        zero = (result == 32'd0);
        negative = result[31];
    end

endmodule