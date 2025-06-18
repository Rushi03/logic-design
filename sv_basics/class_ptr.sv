module class_ptr();

class cNumber;
    int i;
endclass

int a, b;
cNumber xa, xb;

initial
    begin
        a = 1;
        b = 1;

        xa = new();
        xb = new();

        xa.i = 1;
        $display("Value of object i for pointer xa: %0d", xa.i);       
        xb.i = xa.i;    // copying value
        $display("Value of object i for pointer xb: %0d", xb.i);
        xb = xa;        // copying pointer, unused memory will be released; automatic garbage collections
        $display("Value of object i for pointer xb: %0d", xb);
    end

endmodule