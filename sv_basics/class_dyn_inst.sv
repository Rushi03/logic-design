class noConstr;     // no constructor

byte b;             // allocates 1 byte of memory

endclass

class newConstr;    // new constructor

byte b;

function new();
    b = 1;
endfunction

endclass

class newNConstr;   // new constructor

byte b;             // allocates 1 byte of memory

function new(byte newB);
    b = newB;
endfunction

endclass

class ca;

byte b = 10;

endclass

class cb;  

byte b = 20;

endclass

module class_dynamic_inst(input bit sel, output byte result);

noConstr ex1;
newConstr ex2;
newNConstr ex3;
ca ex4;
cb ex5;

initial
    begin
        ex1 = new();  // member b (byte) initial value 0, ex1.b = 0
        $display("Initial value of ex1: %0d", ex1.b);
        ex1.b = 32;
        $display("Value of ex1: %0d", ex1.b);
        ex1 = null;  // release allocation of memory
    end

initial
    begin
        ex2 = new();  // member b (byte) initial value 1, ex1.b = 1
        $display("Initial value of ex1: %0d", ex2.b);
        ex2.b = 27;
        $display("Value of ex1: %0d", ex2.b);
        ex2 = null;
    end

initial
    begin
        ex3 = new(5);  // member b (byte) initial value = parameter, ex1.b = parameter
        $display("Initial value of ex1: %0d", ex3.b);
        ex3.b = 12;
        $display("Value of ex1: %0d", ex3.b);
        ex3 = null;
    end

initial
    begin
        if(sel == 1'b0) 
            begin
                ex4 = new();        // dynamically choose which handle to initialize, only 1 byte of memory is consumed
                result = ex4.b;
            end
        else 
            begin
                ex5 = new();
                result = ex5.b;
            end
    end

endmodule