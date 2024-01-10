module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    assign out = sel? b : a;

endmodule

/* HDL Solution

module top_module (
	input [99:0] a,
	input [99:0] b,
	input sel,
	output [99:0] out
);

	assign out = sel ? b : a;
	
	// The following doesn't work. Why?
	// assign out = (sel & b) | (~sel & a);
	
    // Because of vectors' size.
    // sel : 1 bit
    // a, b : [99:0]

endmodule

*/