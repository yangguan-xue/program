module majority_voter(
    input wire a,
    input wire b,
    input wire c,
    output wire y
);
    assign y = (a & b)|(a & c)|(b & c);
endmodule



module adder4(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire [4:0] sum
);
    



















