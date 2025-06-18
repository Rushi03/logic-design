module arr_class_ptr();

class cNumber;
    int i;
endclass

cNumber a;
cNumber q[$];

initial
    begin
        for (int i = 0; i < 3; i++)
            begin
                a = new();
                a.i = i;
                $display("Value of object i: %0d", a.i);
                q.push_back(a);
            end
    end

endmodule