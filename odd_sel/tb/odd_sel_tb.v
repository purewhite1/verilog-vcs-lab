`timescale 1ps/1ps


module odd_sel_tb();



reg [31:0] data;
reg  sel;
wire check;


odd_sel u_odd_sel(
.data       (data),
.sel        (sel),
.check      (check)
);



initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
   $fsdbDumpvars(0, odd_sel_tb);  // 只记录这些信
end

parameter data1 = 32'b1111_1111_0000_0000_0101_1010_0001_1111;
parameter data2 = 32'b1111_1111_1000_0010_0101_1010_0101_1111;
parameter data3 = 32'b1111_1111_0010_0110_0101_1010_0110_1111;
parameter data4 = 32'b1111_1111_0100_0001_0101_1010_1000_1111;


initial begin
    sel = 1; #5
    data = data1; #10;
    data = data2; #10;
    data = data3; #10;
    data = data4; #10;
    sel = 0;   #5
    data = data1; #10;
    data = data2; #10;
    data = data3; #10;
    data = data4; #10;
    #100;
    $finish; 
end

endmodule
