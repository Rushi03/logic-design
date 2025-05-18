module events();

event ev;

initial
    begin
        fork
            #10ns ->ev;         // event triggered first
            #20ns @(ev);        // wait for event after event triggered
        join
            $display("done");   // join does not happen, display does not happen
    end

initial
    begin
        fork
            #20ns ->ev;         // event triggered after wait
            #10ns @(ev);        // wait for trigger is before event triggered
        join
            $display("done");   // join happens, display happens
    end

initial
    begin
        fork
            #10ns ->ev;         // event triggered same time as wait
            #10ns @(ev);        // wait for trigger same time as event triggered, @ - wait for event after
        join
            $display("done");   // join happens, display happens
    end

initial
    begin
        fork
            #10ns ->ev;                 // event triggered first
            #20ns wait (ev.triggered);  // wait for event after event triggered
        join
            $display("done");           // join does not happen, display does not happen
    end

initial
    begin
        fork
            #20ns ->ev;                 // event triggered after wait
            #10ns wait (ev.triggered);  // wait for trigger is before event triggered
        join
            $display("done");           // join happens, display happens
    end

initial
    begin
        fork
            #10ns ->ev;                 // event triggered same time as wait
            #10ns wait (ev.triggered);  // wait for trigger same time as event triggered, wait - wait for event same time or after
        join
            $display("done");           // join happens, display happens
    end

endmodule