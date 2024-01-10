module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = (!a&!b&!c==1)? 1'b0 : 1'b1;
endmodule


/* HDLBits Solution */

/*
module top_module(
	input a, 
	input b,
	input c,
	output out
);

	// SOP form: Three prime implicants (1 term each), summed.
	// POS form: One prime implicant (of 3 terms)
	// In this particular case, the result is the same for both SOP and POS.
	assign out = (a | b | c);
	
endmodule
*/