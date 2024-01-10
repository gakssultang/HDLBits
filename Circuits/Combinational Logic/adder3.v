module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = a&cin | b&cin | a&b;
    
    //assign {cout, sum} = a + b + cin;

endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    full_adder FA1[2:0] (a[2:0], b[2:0], {cout[1:0], cin}, cout[2:0], sum[2:0]);

endmodule