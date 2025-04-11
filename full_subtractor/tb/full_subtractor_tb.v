module full_subtractor_tb();


reg A, B, Ci;
wire D, Co;


full_subtractor u_full_subtractor(
.A                (A)    ,
.B                (B)    ,
.Ci               (Ci)   ,
   
.D                (D)   ,
.Co              (Co)                    
);

initial begin
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
    A = 0;
    #20;
    B = 0;
    #20;
    $finish;
end


initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, full_subtractor_tb);  // 只记录这些信
end







endmodule
