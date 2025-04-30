`timescale 1ns/1ps

module led_test_tb;
    reg signal_a;
    reg signal_b;
    reg signal_c;
    
    wire led;
    led_test led_test_0(
        .a(signal_a),
        .b(signal_b),
        .key_in(signal_c),
        .led_out(led)
    );
    initial begin
        signal_a=0;signal_b=0;signal_c=0;
        #100;
        signal_a=0;signal_b=0;signal_c=1;
        #100;
        signal_a=0;signal_b=1;signal_c=0;
        #100;
        signal_a=0;signal_b=1;signal_c=1;
        #100;
        signal_a=1;signal_b=0;signal_c=0;
        #100;
        signal_a=1;signal_b=0;signal_c=1;
        #100;
        signal_a=1;signal_b=1;signal_c=0;
        #100;
        signal_a=1;signal_b=1;signal_c=1;
        #100;
    end

initial
begin
    $dumpfile("led_test.vcd");
    $dumpvars(0, led_test_tb);
end

endmodule