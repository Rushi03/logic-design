module randomization();

byte by;

initial
    begin
        repeat (3)
            begin
                by = $random;
                $display("Random value of byte by between variable range -128 to 127: %0d", by);
                by = $urandom_range(20, 1); // (max value, min value)
                $display("Random value of byte by between given range 1 to 20: %0d", by);
            end
    end

endmodule