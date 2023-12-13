module module_a (input x, input y, output z);
    assign z = (x^y)&x;
endmodule

module module_b ( input x, input y, output z );
    assign z = ~(x^y);
endmodule

module top_module (input x, input y, output z);
    
    wire [3:0] z1;
    
    module_a IA1 (.x(x), .y(y), .z(z1[0]));
    module_b IB1 (.x(x), .y(y), .z(z1[1]));
    module_a IA2 (.x(x), .y(y), .z(z1[2]));
    module_b IB2 (.x(x), .y(y), .z(z1[3]));
    
    assign z = (z1[0]|z1[1])^(z1[2]&z1[3]);
    
endmodule
