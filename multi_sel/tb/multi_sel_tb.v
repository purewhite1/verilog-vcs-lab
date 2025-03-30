`timescale 1ps/1ps


module multi_sel_tb();

reg             clk;
reg             rst;
reg     [7:0]   d;
wire            input_grant;
wire    [10:0]   out;



multi_sel u_odd_sel(
.clk            (clk),
.rst            (rst),
.d              (d),
.input_grant    (input_grant),
.out            (out)
);

initial clk = 0; 
always #10 clk <= ~clk;


initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, multi_sel_tb);  // 只记录这些信
end


initial begin
    rst = 0;  d = 8'd143;
    #20; rst = 1;
    #60;
    d = 8'd7;
    #100;
    d = 8'd6;
    #20;
    d = 8'd128;
    #20;
    d = 8'd129;
    #100;
    $finish;
end











endmodule
