`timescale 1ps/1ps
module decoder_0_tb();

reg [8:0] I_n;
wire [3:0] Y_n;


decoder_0 u_decoder_0(

.I_n        (I_n),
.Y_n        (Y_n)

);



initial begin
    I_n = 0;
    #20;
    I_n = 9'd495;
    #20;
    I_n = 9'd333;
    #100;
    $finish;
end

initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, decoder_0_tb);  // 只记录这些信
end
















endmodule
