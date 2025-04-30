`timescale 1ns/1ps

module x_tb;
    reg A,B,C;
    wire F;

    x uut(
        .A(A),
        .B(B),
        .C(C),
        .F(F)
    );

    initial begin
        $monitor("Time = %0t | A = %0d,B = %0d,C = %0d,F = %0d",
        $time,A,B,C,F);
        
        A = 0;B = 0;C = 0;
    #10 A = 0;B = 0;C = 1;
    #10 A = 0;B = 1;C = 0;
    #10 A = 0;B = 1;C = 1;
    #10 A = 1;B = 0;C = 0;
    #10 A = 1;B = 0;C = 1;
    #10 A = 1;B = 1;C = 0;
    #10 A = 1;B = 1;C = 1;
    #10
    $finish;
    end
    
    initial begin
        $dumpfile("x.vcd");
        $dumpvars(0,x_tb);
    end
endmodule
