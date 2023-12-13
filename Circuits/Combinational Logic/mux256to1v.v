module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    assign out [3:0] = in[sel*4 +: 4]; // sel*4, sel*4+1, sel*4+2, sel*4+3

endmodule
