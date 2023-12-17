module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q);

    always @(posedge clk) begin
        if(reset || ((q==4'd9)&&(slowena)))  // 9 -> 0 when slowena is HIGH
            q <= 4'b0;
        else begin
            if(slowena)
                q <= q + 4'b1;
        end
    end

endmodule
