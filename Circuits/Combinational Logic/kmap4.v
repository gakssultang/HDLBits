module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    /* Lazy Solution */
    assign out = ({a,b,c,d} == 4'b1000 || {a,b,c,d} == 4'b0100 || {a,b,c,d} == 4'b0010 || {a,b,c,d} == 4'b0001 || {a,b,c,d} == 4'b0111 || {a,b,c,d} == 4'b1011 || {a,b,c,d} == 4'b1101 || {a,b,c,d} == 4'b1110) ? 1'b1 : 1'b0;
    
    /* Simplify Lazy Solution */
    /*
    always @(*) begin
        case({a,b,c,d})
            4'b1000, 4'b0100, 4'b0010, 4'b0001, 4'b0111, 4'b1011, 4'b1101, 4'b1110: out = 1'b1;
            default: out = 1'b0;
        endcase
    end
    */

    /* After I recognized that this is k-map of xor4 */
    /*
    assign out = (a ^ b ^ c ^ d);
    */
    

endmodule
