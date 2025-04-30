`timescale 1ns/1ns
module tb_code;
    reg a,b,s;
    wire out;

    code u1(.out(out),.a(a),.b(b),.sel(s));

    initial 
    begin
        a=0;b=1;s=0;
    #10 a=1;b=1;s=0;
    #10 a=1;b=0;s=0;
    #10 a=1;b=0;s=1;
    #10 a=1;b=1;s=1;
    #10 a=0;b=1;s=1;
    end

    initial
    $monitor($time,":a=%b b=%b s=%b out=%b",a,b,s,out);
    initial begin
        $dumpfile("./build/wave.vcd");
        $dumpvars(0,tb_code );
        #10000 $finish;
    end
endmodule