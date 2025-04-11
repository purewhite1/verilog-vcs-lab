`timescale 1ns/1ns

module decoder_38(
   input             E1_n   ,
   input             E2_n   ,
   input             E3     ,
   input             A0     ,
   input             A1     ,
   input             A2     ,
   
   output wire       Y0_n   ,  
   output wire       Y1_n   , 
   output wire       Y2_n   , 
   output wire       Y3_n   , 
   output wire       Y4_n   , 
   output wire       Y5_n   , 
   output wire       Y6_n   , 
   output wire       Y7_n   
);



assign Y0_n = (E2_n | E1_n | (~E3)) |  (~((~A2)&(~A1)&(~A0)));
assign Y1_n = (E2_n | E1_n | (~E3)) |  (~((~A2)&(~A1)&(A0)));
assign Y2_n = (E2_n | E1_n | (~E3)) |  (~((~A2)&(A1)&(~A0)));
assign Y3_n = (E2_n | E1_n | (~E3)) |  (~((~A2)&(A1)&(A0)));
assign Y4_n = (E2_n | E1_n | (~E3)) |  (~((A2)&(~A1)&(~A0)));
assign Y5_n = (E2_n | E1_n | (~E3)) |  (~((A2)&(~A1)&(A0)));
assign Y6_n = (E2_n | E1_n | (~E3)) |  (~((A2)&(A1)&(~A0)));
assign Y7_n = (E2_n | E1_n | (~E3)) |  (~((A2)&(A1)&(A0)));



endmodule