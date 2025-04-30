module majority_voter(
    input wire a,
    input wire b,
    input wire c,
    output wire y
);
    assign y = (a & b)|(a & c)|(b & c);
endmodule



module adder4(
    input [3:0] a,
    input [3:0] b,
    output [4:0] sum
);
    wire [3:0] carry;
    
    assign sum[0] = a[0] ^ b[0];
    assign carry[0] = a[0] & b[0];
    
    assign sum[1] = a[1] ^ b[1] ^ carry[0];
    assign carry[1] = (a[1] & b[1]) | (b[1] & carry[0]) | (a[1] & carry[0]);
    
    assign sum[2] = a[2] ^ b[2] ^ carry[1];
    assign carry[2] = (a[2] & b[2]) | (b[2] & carry[1]) | (a[2] & carry[1]);
    
    assign sum[3] = a[3] ^ b[3] ^ carry[2];
    assign sum[4] = (a[3] & b[3]) | (b[3] & carry[2]) | (a[3] & carry[2]); // 进位作为sum的最高位
endmodule




module mux8to1(
    input [7:0] data_in,
    input [2:0] sel,
    output wire data_out
);
    assign data_out = (sel == 3'b000) ? data_in[0] :
                 (sel == 3'b001) ? data_in[1] :
                 (sel == 3'b010) ? data_in[2] :
                 (sel == 3'b011) ? data_in[3] :
                 (sel == 3'b100) ? data_in[4] :
                 (sel == 3'b101) ? data_in[5] :
                 (sel == 3'b110) ? data_in[6] :
                 (sel == 3'b111) ? data_in[7] : 1'b0;
endmodule


module x(
    input wire A,B,C,
    output wire F
);
    assign F = A & C;
endmodule

/*
A	B	C	F
0	0	0	0
0	0	1	0
0	1	0	0
0	1	1	0
1	0	0	0
1	0	1	1
1	1	0	0
1	1	1	1
*/
























