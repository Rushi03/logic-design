module threads_and_forks();

initial
    begin
        fork
            #10ns $display("A");    // ends at 10ns
            #20ns $display("B1");   // ends at 20ns
            #10ns $display("B2");   // ends at 10ns
        join
            $display("C");          // starts at 20ns
    end

initial
    begin
        fork
            #10ns $display("A");        // ends at 10ns
            begin
                #20ns $display("B1");   // ends at 20ns
                #10ns $display("B2");   // ends at 30ns
            end
        join
            $display("C");              // starts at 30ns
    end

initial
    begin
        fork
            #10ns $display("A");    // ends at 10ns
            #20ns $display("B");    // ends at 20ns
        join_any
            $display("C");          // starts at 10ns
    end

initial
    begin
        fork
            #10ns $display("A");    // ends at 10ns
            #20ns $display("B1");   // ends at 20ns
            #10ns $display("B2");   // ends at 10ns
        join_none
            $display("C");          // starts at 0ns
    end

task automatic runThread(int arg);
    fork
        #10ns $display("Thread %0d", arg);
    join_none
endtask

initial
    begin
        runThread(0);   // Thread 0 from 0 - 10ns
        runThread(1);   // Thread 1 from 0 - 10ns
        runThread(2);   // Thread 2 from 0 - 10ns
    end

endmodule