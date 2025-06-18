module class_randomization();

class randNum;
rand bit b1;
rand bit b2;
rand byte by1;
rand byte by2;
rand byte by3;
rand byte by4;

randc bit b3;       // all values used once without repitition
randc byte by5;     // all values used once without repitition

constraint cst {
    by1 > 0;
    by1 < 50;        // incorrect to write 0 < by1 < 3
    by1 != 10;
    // by1 == 25;
}

constraint cst0 {
    by2 inside {0, 1, 2, 3};
    by2 inside {[0:3]};
    by2 dist {0:=4, [1:3]:=2};  //all weight = 10
    by2 dist {0:/4, [1:3]:/2};  //all weight = 6
    // by2 == 1 -> possible nullification of distribution
}

constraint cst1 { 
    if (b2 == 0) {by3 == 0;}
    else {by3 inside {1, 2, 3};}
    solve by3 before b2;
}

constraint cst2 {
    by4 >= 0;
}

constraint cst3 {
    by4 <= 3;
}
endclass

randNum rn;

initial
    begin
        rn = new();

        repeat (6)
            begin
                rn.randomize();
                $display("Random number using class randomize rand for object bit b1: %0d", rn.b1);
                $display("Random number using class randomize rand for object byte by1: %0d", rn.by1);
                $display("Random number using class randomize rand with constraint for object byte by2: %0d", rn.by2);
                $display("Random number using class randomize rand with constraint for object bit b2: %0d", rn.b2);
                $display("Random number using class randomize rand with constraint for object byte by3: %0d", rn.by3);
                $display("Random number using class randomize rand with constraint for object byte by4: %0d", rn.by4);
                $display("Random number using class randomize randc for object bit b3: %0d", rn.b3);
                $display("Random number using class randomize randc for object byte by5: %0d", rn.by5);
            end
    end

endmodule        