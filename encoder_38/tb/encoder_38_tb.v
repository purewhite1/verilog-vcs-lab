`timescale 1ns/1ns
module encoder38_tb();




wire y0, y1, y2, y3, y4, y5, y6, y7;
reg A, B, Ci;
reg E1_n, E2_n, E3;

decoder_38 u_decoder_38(
.E1_n           (E1_n)  ,
.E2_n           (E2_n),
.E3             (E3),
.A0             (Ci),
.A1             (B),
.A2             (A),
   
.Y0_n            (y0),  
.Y1_n            (y1), 
.Y2_n            (y2), 
.Y3_n            (y3), 
.Y4_n            (y4), 
.Y5_n            (y5), 
.Y6_n            (y6), 
.Y7_n            (y7) 
);


initial begin
    E1_n = 0;
    E2_n = 0;
    E3 = 1;
    A = 0;
    B = 0;
    Ci = 0;
    #20;
    A = 1;
    #20;
    B = 1;
    #20;
    Ci = 1;
    #20;
    E1_n = 1;
    #20;
    E1_n = 0;
    #20;
    B = 0;
    #20;
    $finish;
end








initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, encoder38_tb);  // 只记录这些信
end



endmodule
