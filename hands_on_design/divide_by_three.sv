/*
While going through your Grandma's old store, you come across an interesting machine which takes an input x and 
gives an output whenever the number formed within the machine is divisible by 3. Being intrigued with the machine, you start tinkering 
with it and realise that the machine serially takes the input x and concatenates it to the least significant bit (LSB) position of the 
currently seen inputs to form the new number.

Excited with your findings, you decide to model this on your FPGA board. Design the machine as per the mentioned specifications. 
All the flops should be positive edge triggered with asynchronous reset (if any).

Interface Requirements

- The machine receives input every cycle
- The machine should produce output on the same cycle when the input is seen
- Assume that the machine gives a HIGH output when the current number is 0
- The new input bit x_i is inserted on the LSB side of the current number
*/

module divide_by_three(
    input logic clk,
    input logic reset,
    input logic x_i,
    output logic div_o
);

// FSM REM_0 - 0: {a, 0} = 2a, 1: {a, 1} = 2(a)+1 = 2a+1
// FSM REM_1 - 0: {2a+1, 0} = 2(2a+1) = 4a+2, 1: {2a+1, 1} = 2(2a+1)+1 = 4a+3
// FSM REM_2 - 0: {4a+2, 0} = 2(4a+2) = 8a+4, 1: {4a+2, 1} = 2(4a+2)+1 = 8a+5

    // Remainder 0 - 0, Remainder 1 - 1, Remainder 2 - 2
    type def {REM_0, REM_1, REM_2} state_t;

    state_t state_q;
    state_t nxt_state;

    always_ff @(posedge clk or posedge reset)
        if (reset)
            state_q <= REM_0;
        else    
            state_q <= nxt_state;

    always_comb begin
        case (state_q)
            div_o = 1'b0; 
            REM_0:
                if (x_i) begin
                    nxt_state = REM_1; // x_i = 1; 2(0)+1 % 3 = 1
                end else begin
                    nxt_state = REM_0; // x_i = 0; 2(0) % 3 = 0
                    div_o = 1'b1;
                end
            REM_1:
                if (x_i) begin
                    nxt_state = REM_0; // x_i = 1; 4(0)+3 % 3 = 0
                    div_o = 1'b1;
                end else begin
                    nxt_state = REM_2; // x_i = 0; 4(0)+4 % 3 = 1
                end
            REM_2:
                if (x_i) begin
                    nxt_state = REM_2; // x_i = 1; 8(0)+5 % 3 = 2
                end else begin
                    nxt_state = REM_1; // x_i = 0; 8(0)+4 % 3 = 1
                end
            default: nxt_state <= REM_0;
        endcase
    end

endmodule