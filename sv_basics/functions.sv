module functions();

int result, z;

function int calculate (int a = 8, b); // parameter b follows a in type; default type is logic if not provided
    return a + b;
endfunction

function void increment_hw();
    int a;      // hardware signal, exists from beginning until end
    a = a + 1;
    $display("Result of increment_hw(): %0d", a);
endfunction

function automatic void increment_sw();
    int a;      // software variable, created when function called and destryoyed after function completes
    a = a + 1;
    $display("Result of increment_sw(): %0d", a);
endfunction

initial 
    begin
        result = calculate(2, 3);
        $display("Result of calculate(2, 3): %0d", result);
        result = calculate(.a(5), .b(0));
        $display("Result of calculate(.a(5), .b(0)): %0d", result);
        z = calculate(1, 2);
        $display("Result of calculate(1, 2): %0d", z);
        z = calculate(.b(3));
        $display("Result of calculate(.b(3)): %0d", z);

        increment_hw();
        increment_hw();

        increment_sw();
        increment_sw();
    end

endmodule