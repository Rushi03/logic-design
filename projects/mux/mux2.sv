module MUX2(input logic[3:0] in0, 
            input logic[3:0] in1, 
            input logic[3:0] in2, 
            input logic[3:0] in3, 
            input logic[1:0] select, 
            output logic[3:0] out);

    assign out = (select == 0) ? in0 : (select == 1) ? in1 : (select == 2) ? in2 : in3;

    // assign y = ( condition1===true ) ? exp1 : exp2 ;
    // assign y = ( condition1===true ) ? exp1 : ( condition2===true ) ? exp2 : ( condition3===true ) ? exp3 ;

endmodule