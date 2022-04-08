/*
    Takes an 8-bit position as an input
    Output a single pwm signal with period of ~20ms
    Pulse width = 1ms -> 2ms full scale. 1.5ms is center position
*/
module servo(signal, clk, en, duty);

    input [31:0] duty;
    input clk, en,dirSwich,speedUp,slowDown;
    output reg signal;
  
    //assign duty = 32'd1000000;
    // position is 100k-200k (1ms-2ms @ 100MHz)
    // period is 2e6
    // The servo output is set by comparing the position input with the counter

    reg [31:0] counter = 32'b0;

    always @(posedge clk) begin
            if (counter > 32'd2000000) begin
                counter = 32'b0;
            end

            if (counter > duty) begin
                signal = 1'b0;
            end else begin
                signal = 1'b1;
            end

            counter = counter + 1;
       
        end
        
        
     
       
   

endmodule