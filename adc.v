module adc_test(dc_input, clk, clk_out, dc_output);
    input [7:0] dc_input;
    input clk;
    output [7:0] dc_output;
    output clk_out;
   
    wire [16:0] freq = 21'd100000;
    wire clk_adc;
    reg [7:0] output_values;
    clk_divider_adc adc(freq, clk, clk_adc);
   
    always @(posedge clk_adc) begin
        output_values <= dc_input;
    end

    assign dc_output = output_values;
    assign clk_out = clk_adc;
endmodule