module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire c [99:0];
    wire [3:0] a_slice [99:0];
    wire [3:0] b_slice [99:0];
    wire [3:0] sum_slice [99:0];
    wire cout_internal [99:0];

    /* 1. slice input a, b by 4 bits */
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : gen_inst1
            assign a_slice[i] = a[i*4 +: 4];
            assign b_slice[i] = b[i*4 +: 4];
        end
    endgenerate

    /* 2. make 100 instances. */
    generate
        for (i = 0; i < 100; i = i + 1) begin : gen_inst2
            bcd_fadd bcd_fadd_inst (
                .a(a_slice[i]),
                .b(b_slice[i]),
                .cin(i == 0 ? cin : cout_internal[i-1]),
                .cout(cout_internal[i]),
                .sum(sum_slice[i])
            );
        end
    endgenerate
    assign cout = cout_internal[99];

    /* 3. concatenate sum_slice */
    generate
        for (i = 0; i < 100; i = i + 1) begin : gen_inst3
            assign sum[i*4 +: 4] = sum_slice[i];
        end
    endgenerate
endmodule
