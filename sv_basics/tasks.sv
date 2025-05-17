module tasks();

int a, b, y;

// Tasks have timing control capability
task calculate (int a, int b);
    #10ns;
    y = a + b;
endtask

initial
    begin
        calculate(2, 3);
        $display("Time after calculating first task: %t\t", $time);
        calculate(4, 5);
        $display("Time after calculating second task: %t\t", $time);
        calculate(5, 2);
        $display("Time after calculating last task: %t\t", $time);
    end

endmodule