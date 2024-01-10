module counter(
    input           clk, rst_n;
    output  [3:0]   cnt;
);
    reg [3:0] count;
    assign cnt = count;

    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)
            count <= 4'b0;
        else
            count <= count + 4'b1;
    end

endmodule