module top_module (
    input a,
    input b,
    input c,
    input d,
    output reg out_sop,
    output reg out_pos
); 
    assign out_sop = (c&d)|(~a&~b&c);
    assign out_pos = c&(~b|~c|d)&(~a|~c|d);
endmodule

/* SOP는 익숙한데 POS는.. */