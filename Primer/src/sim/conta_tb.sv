`timescale 1ns / 1ps

module module_counter_tb;

logic clk;
logic rst;
logic [5 : 0] count_o;

module_counter # (10) COUNTER (
    .clk ( clk),
    .rst (rst),
    .count_o (count_o)
);

initial begin

    clk = 0;
    rst = 1;

    #30;

    rst = 0;

    #30;

    rst = 1;

    #30000;
    $finish;
end

always begin

    clk = ~clk;
    #10;
    
end

initial begin
    $dumpfile("modulr_conta_tb.vcd");
    $dumpvars (0,module_counter_tb);
end




endmodule
