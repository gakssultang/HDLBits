/* Solution 1, detect overflow with carry-out bits */
/* I don't sure with this solution */

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
    wire [8:0] full_sum;
    wire [7:0] cin;
    wire cout;
    
    assign full_sum = a + b;
    assign s = full_sum[7:0];
    
    assign cin = a[6:0] + b[6:0];
    assign cout = full_sum[8];
    
    assign overflow = cin[7]^cout;
    
endmodule

/* Solution 2, detect overflow by comparing the signs of the input and output numbers */

/*
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
    assign s = a + b;
    assign overflow = ((a[7] & b[7] & ~s[7]) | (~a[7] & ~b[7] & s[7]));
endmodule
*/