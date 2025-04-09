`timescale 1ps/1ps

module decoder_0(
   input      [8:0]         I_n   ,
   
   output  [3:0]         Y_n   
);


assign Y_n[3] =  I_n[8] & I_n[7];
assign Y_n[2] =  I_n[6] & I_n[5] & I_n[4] & I_n[3];
assign Y_n[1] =  I_n[6] & I_n[5] & I_n[2] & I_n[1];
assign Y_n[0] =  I_n[8] & I_n[6] & I_n[4] & I_n[2] & I_n[0];







endmodule
