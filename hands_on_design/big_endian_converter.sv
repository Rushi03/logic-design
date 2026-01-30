/*
You are tasked to integrate a CPU sub-system with a networking chip. While going through the specifications, 
you realise that the CPU sub-system is a little endian system where as the networking chip needs data in big-endian 
format. As a result, you decide to design a parameterizable module to convert little endian format into big-endian.

Implement the little to big endian converter as per the given interface definitions. All the flops (if any) should be 
positive edge triggered with asynchronous resets. The data width parameter can be assumed to represent a byte-aligned signal.

Interface Definition

`le_data_i` : Input signal to the converter. Will be byte-aligned be_data_o : Output signal in the big endian format

Interface Requirements

- The output should be available in the same cycle
- The module should produce the output on every cycle
*/

module big_endian_converter #(
    parameter DATA_W = 32
)(
    input logic clk,
    input logic reset,
    input logic[DATA_W-1:0] le_data_i,
    output logic[DATA_W-1:0] be_data_o
);

    // Starting index +: 8
    // Starting index -: 8
    for (genvar i=0; i<DATA_W/8; i=i+1) begin
        assign be_data_o[(DATA_W-1)-8*i -: 8] = le_data_i[8*i +: 8];
    end
    
endmodule