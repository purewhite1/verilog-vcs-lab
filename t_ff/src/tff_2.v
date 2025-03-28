`timescale 1ps/1ps

module tff_2 (
    input wire t,
    input  clk,
    input  rst,
    output wire q

);


reg q1;
reg q2;


always @(posedge clk or negedge rst) begin
    if (!rst) begin
        q1 <= 0;        
    end else if(t)begin
        q1 <= ~q1;
    end else begin
        q1 <= q1;
    end    
end

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        q2 <= 0;        
    end else if(q1)begin
        q2 <= ~q2;
    end else begin
        q2 <= q2;
    end    
end
assign q = q2;






    
endmodule
