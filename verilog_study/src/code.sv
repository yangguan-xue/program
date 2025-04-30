module code(out,
            a,
            b,
            sel);
    input a,b,sel;
    output out;
    wire selnot,a1,b1;
    not U1(selnot,sel);
    and U2(a1,a,selnot);
    and U3(b1,b,sel);
    or U4(out,a1,b1);

endmodule