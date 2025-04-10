`timescale 1ns/1ns

module encoder_83(
   input      [7:0]       I   ,
   input                  EI  ,
   
   output reg [2:0]       Y   ,
   output wire            GS  ,
   output wire            EO    
);

assign GS = EI & ((I[7] | I[6] | I[5] | I[4] | I[3] | I[2] | I[1] | I[0]));
assign EO = (~(I[7] | I[6] | I[5] | I[4] | I[3] | I[2] | I[1] | I[0])) & EI;




always@(*)begin
    if (~EI)begin
        Y = 3'b000;
    end else
    casex(I)
        8'b1xxxxxxx : Y = 3'b111;
        8'b01xxxxxx : Y = 3'b110;
        8'b001xxxxx : Y = 3'b101;
        8'b0001xxxx : Y = 3'b100;   
        8'b00001xxx : Y = 3'b011;
        8'b000001xx : Y = 3'b010;
        8'b0000001x : Y = 3'b001;
        8'b00000001 : Y = 3'b000;
    endcase
end

endmodule