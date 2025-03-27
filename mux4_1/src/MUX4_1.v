`timescale 1ps/1ps
module MUX4_1 (
    input i0,i1,i2,i3,
    input [1:0] S,
    output reg out
);





always @(*) begin
   case (S)
    2'b00 : out = i0;
    2'b01 : out = i1;
    2'b10 : out = i2;
    2'b11 : out = i3; 
    default: out = i0;
endcase 
end



endmodule
