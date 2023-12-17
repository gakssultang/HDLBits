module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);

    always @(posedge clk) begin
        if(reset || (q==4'd10))  // 9 -> 0
            q <= 4'b1;
        else begin
            q <= q + 4'b1;
        end
    end
        
endmodule