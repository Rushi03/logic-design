module numerical();

logic l1;
logic[7:0] l2;
bit b;
byte by; //signed, range -128 to 127
int i;

typedef byte unsigned ubyte; //range 0 to 255
ubyte uby; 

initial
    begin
        $display("\n**** Initial variable values ****\n");
        $display("Initial logic value: %0b and size: %0d", l1, $size(l1));
        $display("Initial 8-bit logic value: %0b and size: %0d", l2, $size(l2));
        $display("Initial bit value: %0b and size: %0d", b, $size(b));
        $display("Initial byte value: %0b and size: %0d", by, $size(by));
        $display("Initial unsigned byte value: %0b and size: %0d", uby, $size(uby));
        $display("Initial int value: %0b and size: %0d", i, $size(i));

        // Set variables with decimal values
        l1 = 1;     // 1'd1
        l2 = 128;   // 8'd128
        b = 1;      // 1'd1
        by = 20;    // 8'd20
        uby = 156;  // 8'd156
        i = 256;    // 32'd256

        $display("\n**** Varibles assigned decimal values ****\n");
        $display("Logic value (decimal, binary, hex): %0d, %0b, %0h", l1, l1, l1);
        $display("8-bit logic value (decimal, binary, hex): %0d, %0b, %0h", l2, l2, l2);
        $display("Bit value (decimal, binary, hex): %0d, %0b, %0h", b, b, b);
        $display("Byte value (decimal, binary, hex): %0d, %0b, %0h", by, by, by);
        $display("Unsigned byte value (decimal, binary, hex): %0d, %0b, %0h", uby, uby, uby);
        $display("Int value (decimal, binary, hex): %0d, %0b, %0h", i, i, i);

        // Set variables with binary values
        l1 = 1'b1;
        l2 = 8'b11111110;
        b = 1'b1;
        by = 8'b101;
        uby = 8'b1100001;
        i = 32'b100000001;

        $display("\n**** Varibles assigned binary values ****\n");
        $display("Logic value (decimal, binary, hex): %0d, %0b, %0h", l1, l1, l1);
        $display("8-bit logic value (decimal, binary, hex): %0d, %0b, %0h", l2, l2, l2);
        $display("Bit value (decimal, binary, hex): %0d, %0b, %0h", b, b, b);
        $display("Byte value (decimal, binary, hex): %0d, %0b, %0h", by, by, by);
        $display("Unsigned byte value (decimal, binary, hex): %0d, %0b, %0h", uby, uby, uby);
        $display("Int value (decimal, binary, hex): %0d, %0b, %0h", i, i, i);

        // Set variables with hexadecimal values
        l1 = 1'h1;
        l2 = 8'hF2;
        b = 1'h1;
        by = 8'hC1;
        uby = 8'hFA;
        i = 32'hCAFE;

        $display("\n**** Varibles assigned hexadecimal values ****\n");
        $display("Logic value (decimal, binary, hex): %0d, %0b, %0h", l1, l1, l1);
        $display("8-bit logic value (decimal, binary, hex): %0d, %0b, %0h", l2, l2, l2);
        $display("Bit value (decimal, binary, hex): %0d, %0b, %0h", b, b, b);
        $display("Byte value (decimal, binary, hex): %0d, %0b, %0h", by, by, by);
        $display("Unsigned byte value (decimal, binary, hex): %0d, %0b, %0h", uby, uby, uby);
        $display("Int value (decimal, binary, hex): %0d, %0b, %0h", i, i, i);
    end

endmodule