`timescale 1ps/1ps

module tff_2_tb ();


reg t, clk, rst;
wire q;


tff_2 u_tff_2(
.t      (t),
.clk    (clk),
.rst    (rst),
.q    (q)
);




initial clk = 0;
always #5 clk = ~clk;


initial begin
    rst = 0;
    #10 rst = 1; 
    t = 0; #10;
    t = 1; #10;
    t = 1; #10;
    t = 0; #10;
    #200 $finish;
end

initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, tff_2_tb);  // 只记录这些信
end




endmodule
