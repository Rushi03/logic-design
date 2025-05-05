module structs();

// Packed struct variables are on bi variable
typedef struct packed {bit b; int i; byte byt;} struct0;
struct0 sp0, sp1;

// Unpacked struct variables are separate
typedef struct {bit b; int i; byte byt;} struct1;
struct1 s2, s3;

initial 
    begin
        sp0.b = 1;
        $display("Bit value: %0d", sp0.b);
        sp0.i = 8;
        $display("Int value: %0d", sp0.i);
        sp0.byt = 7;
        $display("Byte value: %0d", sp0.byt);
        sp1 = sp0;
        $display("Bit value: %0d, Int value: %0d, Byte value: %0d", sp1.b, sp1.i, sp1.byt);
        $display("%0p", sp1);
        $display("%0b", sp1);   // Only a packed struct can be displayed as binary/one variable

        s2.b = 1;
        $display("Bit value: %0d", s2.b);
        s2.i = 10;
        $display("Int value: %0d", s2.i);
        s2.byt = 15;
        $display("Byte value: %0d", s2.byt);
        s3 = s2;
        $display("Bit value: %0d, Int value: %0d, Byte value: %0d", s3.b, s3.i, s3.byt);
        $display("%0p", s3);
    end

endmodule