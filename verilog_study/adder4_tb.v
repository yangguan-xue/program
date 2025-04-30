`timescale 1ns/1ps

module adder4_tb;
    reg [3:0] a, b;
    wire [4:0] sum;
    
    adder4 uut (.a(a), .b(b), .sum(sum));

    integer i,j;
    initial begin
        $monitor("Time = %0t | a = %0d, b = %0d, sum = %0d", 
                 $time, a, b, sum);

        // 遍历所有输入组合
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i;
                b = j;
                #10;
            end
        end
        $finish;
    end

    // 生成波形文件
    initial begin
        $dumpfile("adder4.vcd");
        $dumpvars(0, adder4_tb);
    end
endmodule





