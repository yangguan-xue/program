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