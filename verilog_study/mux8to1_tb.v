`timescale 1ns/1ps

module mux8to1_tb;
    reg [7:0] data_in;
    reg [2:0] sel;
    wire data_out;

    mux8to1 uut (.data_in(data_in),.sel(sel),.data_out(data_out));

    integer count = 0;
    initial begin
        $monitor("Time = %0t | data_in = %0d,sel = %0d,data_out = %0d",
                $time,data_in,sel,data_out);
    data_in = 8'b10011101;
    for(sel = 3'b000;sel <= 3'b111 && count < 8;sel = sel +1)begin
        #10;
        count = count +1;
        end
    $finish;
    end

    initial begin
        $dumpfile("mux8to1.vcd");
        $dumpvars(0,mux8to1_tb);
    end
endmodule