module mux(input logic[3:0] in, input logic[1:0] select, output logic out);

    assign out = in[select];

endmodule
