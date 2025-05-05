module strings();

// Strings cannot be synthesized
string num = "1234";
string name = "Tony Stark";
int i;

initial
    begin
        $display("My name is %s", name);
        $display("My name concatentated %s", {name, " ", name});
        $display("The original number %s", num);
        $display("Multiple names together is %s", {3{name}});
        $display("My first name is %s", name.substr(0,4));
        $display("Name in upper case is %s", name.toupper());
        $display("Name in lower case is %s", name.tolower());
        $display("First character in name is %s", name.getc(0));

        i = name.len();
        $display("String length is %0d", i);
        i = num.atoi();
        $display("Number string converted to int is %0d", i);
        i = 5678;
        $display("Int is %0d", i);
        num.itoa(i);
        $display("New int converted to string is %s", num);
        num.bintoa(i);
        $display("New bin converted to string is %s", num);
        i = num.atobin();
        $display("String bin converted to bin is %0b", i);
        num.hextoa(i);
        $display("New hex converted to string is %s", num);
        i = num.atohex();
        $display("String hex converted to hex is %0h", i);
    end

endmodule