`timescale 1ns/1ps

module majority_voter_tb;
    reg a, b, c;
    wire y;

    majority_voter uut(
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $monitor("Time = %0t | a = %b, b = %b, c = %b, y = %b", $time, a, b, c, y);

        a = 0; b = 0; c = 0; #100;
        a = 0; b = 0; c = 1; #100;
        a = 0; b = 1; c = 0; #100;
        a = 0; b = 1; c = 1; #100;
        a = 1; b = 0; c = 0; #100;
        a = 1; b = 0; c = 1; #100;
        a = 1; b = 1; c = 0; #100;
        a = 1; b = 1; c = 1;

    end

initial
begin
    $dumpfile("majority_voter.vcd");
    $dumpvars(0, majority_voter_tb);
end
endmodule
