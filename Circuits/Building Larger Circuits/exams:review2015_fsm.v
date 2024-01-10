module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    parameter [3:0] S     = 4'd0;
    parameter [3:0] S1    = 4'd1;
    parameter [3:0] S11   = 4'd2;
    parameter [3:0] S110  = 4'd3;
    parameter [3:0] B0    = 4'd4;
    parameter [3:0] B1    = 4'd5;
    parameter [3:0] B2    = 4'd6;
    parameter [3:0] B3    = 4'd7;
    parameter [3:0] COUNT = 4'd8;
    parameter [3:0] WAIT  = 4'd9;

    reg [3:0] cs, ns;

    // Reset
    always @(posedge clk) begin
        if(reset)
            cs <= S;
        else
            cs <= ns;
    end

    // State Transition
    always @(*) begin
        case (cs)
            S:          ns = data? S1 : S;
            S1:         ns = data? S11 : S;
            S11:        ns = data? S11 : S110;
            S110:       ns = data? B0 : S;
            B0:         ns = B1;
            B1:         ns = B2;
            B2:         ns = B3;
            B3:         ns = COUNT;
            COUNT:      ns = done_counting? WAIT    :   COUNT;
            WAIT:       ns = ack?           S       :   WAIT;
            default:    ns = cs;
        endcase
    end

    // Output Assignment
    assign shift_ena =  (cs==B0)? 1'b1  :
                        (cs==B1)? 1'b1  :
                        (cs==B2)? 1'b1  :
                        (cs==B3)? 1'b1  : 1'b0;
    assign counting = (cs==COUNT);
    assign done = (cs==WAIT);

endmodule