module FA( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = a&cin | b&cin | a&b;

endmodule

module top_module( 
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);
    wire [3:0] cout;
    assign sum[4]=cout[3];
    FA FA_inst[3:0] (x[3:0], y[3:0], {cout[2:0], 1'b0}, cout[3:0], sum[3:0]);

endmodule

/* HDLBits Solution

module top_module (
	input [3:0] x,
	input [3:0] y,
	output [4:0] sum
);

	// This circuit is a 4-bit ripple-carry adder with carry-out.
	assign sum = x+y;	// Verilog addition automatically produces the carry-out bit.

	// Verilog quirk: Even though the value of (x+y) includes the carry-out, (x+y) is still considered to be a 4-bit number (The max width of the two operands).
	// This is correct:
	// assign sum = (x+y);
	// But this is incorrect:
	// assign sum = {x+y};	// Concatenation operator: This discards the carry-out
endmodule

*/