module adc_test(determine_transistor, determine_resistor, dc_input_one, dc_input_two, clk, regTrigger, regTrigger_two, clk_out, address_one, address_two, output_transistor, output_resistor);
    input [7:0] dc_input_one, dc_input_two;
    input [2:0] determine_transistor;
    input [1:0] determine_resistor;
    input clk, regTrigger, regTrigger_two;
    output [7:0] output_transistor, output_resistor;
    output [2:0] address_one, address_two;
    output clk_out;
    wire [16:0] freq = 21'd80000;
    wire [11:0] regEnable;
    wire [7:0] register_values[11:0];
    reg [2:0] transistor_count, resistor_count;
   
    always @(posedge regTrigger) begin
        if(transistor_count < 7) begin
            transistor_count <= transistor_count + 1;
        end
        else begin
            transistor_count <= 0;
        end
    end
    
    always @(posedge regTrigger_two) begin
        if(resistor_count < 3) begin
            resistor_count <= resistor_count + 1;
        end
        else begin
            resistor_count <= 0;
        end
    end
    
    decoder_3to8 decoder_transistors(regEnable[7:0], transistor_count, regTrigger);
    decoder_3to8 decoder_resistors(regEnable[11:8], resistor_count, regTrigger_two);
   
    assign address_one = transistor_count;
    assign address_two = resistor_count;
    assign output_transistor = register_values[determine_transistor];
    assign output_resistor = register_values[determine_resistor + 8];
   
    genvar i;
    genvar j;
    generate
        for(i = 1; i < 8; i = i + 1) begin: loop_transistor
			register transistor_register(dc_input_one, register_values[i], regTrigger, regEnable[i], 1'b0);
        end
        for(j = 8; j < 12; j = j + 1) begin: loop_resistor
			register resistor_register(dc_input_two, register_values[j], regTrigger_two, regEnable[j], 1'b0);
        end
    endgenerate
    
    clk_divider_adc adc(freq, clk, clk_out);
endmodule