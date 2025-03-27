`timescale 1ps/1ps

module mux_tb ();

wire i0;
wire i1;
wire i2;
wire i3;
reg [1:0] S;
wire out;

MUX4_1 u_MUX4_1(
.i0         (i0),
.i1         (i1),
.i2         (i2),
.i3         (i3),
.S          (S),
.out        (out)

);

assign i0 = 1;
assign i1 = 0;
assign i2 = 0;
assign i3 = 1;


initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, mux_tb);  // 只记录这些信
end

initial begin
    $monitor("S = %b, out = %b", S, out); // 打印输出信号
    S = 00; #5;
    S = 01; #5;
    S = 10; #5;
    S = 11; #5;
     #10;
    $finish;

end


endmodule
