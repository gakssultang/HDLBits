module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    reg [3:0] q_i;
    always @(posedge clk) begin
        if(reset || (q_i==4'd10))  // 9 -> 0
            q_i <= 4'b1;
        else begin
            q_i <= q_i + 4'b1;
        end
    end
    assign q = q_i;
        
endmodule

// or set output q as reg

/*
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
*/