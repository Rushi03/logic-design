class cBoxes;

int i = 1;
static int count = 0;

function new();
    count++;
endfunction

endclass

module static_ex();

cBoxes num1;
cBoxes num2;
cBoxes num3;

initial
    begin
        num1 = new();
        $display("num1 count: %0d", num1.count);

        num2 = new();
        $display("num2 count: %0d", num2.count);
        $display("num1 count: %0d\t num2 count: %0d\t", num1.count, num2.count);
        num3 = new();
        $display("num3 count: %0d", num3.count);
        $display("num1 count: %0d\t num2 count: %0d\t num3 count: %0d\t", num1.count, num2.count, num3.count);
    end

endmodule