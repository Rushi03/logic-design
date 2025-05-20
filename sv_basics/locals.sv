class cCar;

local int gears = 0;        // private, not accessible by caller

function void shiftUp();    // public, accessible by caller
    if (gears < 6)
        begin
            gears = gears + 1;
        end
endfunction

function void shiftDown();  // public, accessible by caller
    if (gears > 0)
        begin
            gears = gears - 1;
        end
endfunction

endclass

module local_ex();

cCar toyota;

initial
    begin
        toyota = new();
        toyota.shiftUp();
        toyota.shiftUp();
        toyota.shiftDown();
    end

endmodule