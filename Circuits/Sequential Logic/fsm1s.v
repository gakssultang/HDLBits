// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A=0, B=1;
    reg present_state, next_state;

    // Reset Logic
    always @(posedge clk) begin
        if(reset)   present_state <= B;
        else        present_state <= next_state;
    end

    // State Transition
    always @(*) begin
        case(present_state)
            A: begin
                next_state = in? A : B;
            end
            B: begin
                next_state = in? B : A;
            end
        endcase
    end

    // Assign output
    assign out = (present_state==B)? 1 : 0;

endmodule