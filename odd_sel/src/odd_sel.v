`timescale 1ps/1ps


module odd_sel (
    input [31:0] data,  //输入待测数据
    input sel,          //判断奇校验还是偶校验
    output check      //判断对错
);

wire  check_temp;

assign check_temp = ^data;


assign check = (sel == 1'b1) ? check_temp : ~check_temp;


    
endmodule
