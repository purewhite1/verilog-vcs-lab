module encoder_83_tb();

wire [2:0]Y;
wire GS,EO;
reg [7:0] I;
reg EI;

encoder_83 u_decoder_83(
.I              (I) ,
.EI             (EI),
   
.Y              (Y),
.GS             (GS),
.EO             (EO)   
);


initial begin
    EI = 1;
    I  = 8'd200;
    #20;
    EI = 0;
    #20;
    EI = 1;
    I = 8'd100;
    #20;
    I = 8'd50;
    #100;
    $finish;
end

initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, encoder_83_tb);  // 只记录这些信
end



endmodule
