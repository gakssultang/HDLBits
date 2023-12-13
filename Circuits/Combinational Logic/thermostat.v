module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign heater = mode&too_cold;
    assign aircon = ~mode&too_hot;
    assign fan = (heater|aircon) | (fan_on); // same as heater | aircon | fan_on
endmodule

/* non-success ver.

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always @(*) begin
        if(mode&too_cold) begin
            assign heater=1'b1;                     // all LHS in always blocks must be of 'reg' type. 
        end
        else if(~mode&too_hot) begin
            assign {heater, aircon} = {1'b0, 1'b1}; // assign inside an always block is not synthesizable and should not be used.
    end
    assign fan = (heater|aircon) | (fan_on);
endmodule
*/