module arrays();

byte byt[1:0];
bit b[2:0];                 // little endian - [2], [1], [0]
bit b_be[0:2];              //big endian - [0], [1], [2]
bit b_cs[5];                // size of array, C style big endian format - [0], [1], [2], [3], [4]
bit[2:0] b_packed;          // only single bit vectors can be packed - bit, wire, reg, logic
bit b_mu[1:0][7:0];         // mulitdimensional unpacked array
bit[7:0] b_mixed[1:0];      // mixed multidimensional array
bit[1:0][7:0] b_mp;         // multidimensional packed array 

initial 
    begin
        byt[0] = 8'b0;
        $display("Byt array assign index0 %0p", byt);
        byt[1] = 8'b1;
        $display("Byt array assign index1 %0p", byt);
        byt = '{8'b3, 8'b4};         // assign all indeces at once
        $display("Byt array assign all indeces at once %0p", byt);

        b_be = '{1'b0, 1'b1, 1'b1};
        $display("Bit array assign all indeces at once %0p", b_be);
        b = b_be;                   // assignment can be down for same size arrays - b[2] = b_be[0], b[1] = b_be[1], b[0] = b_be[2]
        $display("Bit array assign b with b_be at once %0p", b);
        b[2:1] = b_be[1:2];         // assignment with slices of array
        $display("Bit array assign b_packed with b_be with slices %0p", b);

        // basic for loop
        for (int i = 0; i < $size(byt); i++)
            begin
                byt[i] = i;
            end
        $display("Byt array assign all indeces with for loop %0p", byt);

        // Perl version for loop
        foreach (byt[i]) 
            begin
                byt[i] = i;
            end
        $display("Byt array assign all indeces with foreach loop %0p", byt);

        // basic for loop for multidimensional array
        for (int i = 0; i < 2; i++)
            begin
                for (int j = 0; j < 8; j++)
                    begin
                        b_mu[i][j] = 3 * i + j;
                    end
            end
        $display("Bit multidimensional array assign all indeces with for loop %0p", b_mu);

        // Perl version for loop for multidimensional array
        foreach (b_mu[i, j])
            begin
                b_mu[i][j] = 4 * i + j;
            end
        $display("Bit multidimensional array assign all indeces with foreach loop %0p", b_mu);
    end

endmodule