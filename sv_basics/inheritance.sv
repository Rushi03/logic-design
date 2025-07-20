module inheritance();

class baseEx;
    rand int i;

    constraint cst {
        i > 0;
    }

    function void print();
        $display("i = %0d", i);
    endfunction
endclass

class inheritEx extends baseEx;
    function void print();
        super.print();      // calls base class function

        if (i < 0) $error("i less than 0");
    endfunction
endclass

inheritEx p1;

initial 
    begin
        p1 = new();
        p1.i = 1;
        p1.cst.constraint_mode (1);
        p1.randomize();
        p1.print();
    end

endmodule