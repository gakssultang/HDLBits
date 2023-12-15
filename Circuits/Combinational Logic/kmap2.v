
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  );

	/* 0s are less then 1s, so I just grouped 0s and inverted them. */
    assign out = ~( (a&b&!c) | (b&!c&d) | (!a&!b&c&d) | (a&c&!d) );
    
    /* when grouping 1s */
    /*
    assign out = (!a&!d) | (!b&!c) | (b&c&d) | (a&c&d);
    */

endmodule
