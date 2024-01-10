/* pre-declared

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
endmodule
*/

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );


    wire [3:0] cout_internal;
    assign cout = cout_internal[3];
    bcd_fadd BCD_FA_inst1 (
        a[3:0], b[3:0], cin, cout_internal[0], sum[3:0]
    );
    bcd_fadd BCD_FA_inst2 (
        a[7:4], b[7:4], cout_internal[0], cout_internal[1], sum[7:4]
    );
    bcd_fadd BCD_FA_inst3 (
        a[11:8], b[11:8], cout_internal[1], cout_internal[2], sum[11:8]
    );
    bcd_fadd BCD_FA_inst4 (
        a[15:12], b[15:12], cout_internal[2], cout_internal[3], sum[15:12]
    );

endmodule

/* for more general solution, check "bcdaddr100.v" */
/* 1. slice input a, b by 4 bits */
/* 2. make 100 instances. */
/* 3. concatenate sum_slice */