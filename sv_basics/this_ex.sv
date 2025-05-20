class cNumber;

int id;

function new(int id);
    this.id = id;       // this refers to class member, helps differentiate any naming conflicts
endfunction

endclass

module this_ex();

cNumber num;

initial
    begin
        num = new(10);
    end
    
endmodule