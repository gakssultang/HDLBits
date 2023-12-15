module top_module( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = a&cin | b&cin | a&b;

endmodule

/*
module FullAdder(
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule
*/