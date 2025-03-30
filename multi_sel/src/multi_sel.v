`timescale 1ps/1ps

module multi_sel (
    input clk,
    input rst,
    input [7:0] d,
    output reg input_grant,
    output  [10:0] out
);


reg [7:0] input_reg ;
reg [1:0] cnt;
reg [10:0] result_reg ;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        cnt <= 0;
    end else begin
        cnt <= cnt +1;
    end    
end

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        input_reg  <= 8'b0;
        input_grant <= 0;
        result_reg  <= 10'b0;
    end else begin
        case (cnt)
          2'b00  :  begin
            input_reg  <= d;
            result_reg  <= d;
            input_grant <= 1;
          end
          2'b01  :  begin
            result_reg  <= input_reg *3;
            input_grant <= 0;
          end
          2'b10  :  begin
            result_reg  <= input_reg *7;
            input_grant <= 0;
          end
          2'b11  :  begin
            result_reg  <= input_reg  << 3;
            input_grant <= 0;
          end 
            default: result_reg  <= result_reg ;
        endcase
    end    
end


/*
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        input_reg  <= 8'b0;
        input_grant <= 0;
        result_reg  <= 8'b0;
    end else begin
        case (cnt)
          2'b00  :  begin
            input_reg  <= d;
            result_reg  <= d;
            input_grant <= 1;
          end
          2'b01  :  begin
            result_reg  <= input_reg + input_reg <<1;
            input_grant <= 0;
          end
          2'b10  :  begin
            result_reg  <= input_reg + input_reg <<1 + input_reg <<2;
            input_grant <= 0;
          end
          2'b11  :  begin
            result_reg  <= input_reg  << 3;
            input_grant <= 0;
          end 
            default: result_reg  <= result_reg ;
        endcase
    end    
end
*/

assign out = result_reg ;






    
endmodule
