module adc_test(determine_transistor, determine_resistor, dc_input_one, dc_input_two, clk, regTrigger, regTrigger_two, clk_out, address_one, address_two, output_transistor, output_resistor);
    input [7:0] dc_input_one, dc_input_two;
    input [2:0] determine_transistor;
    input [1:0] determine_resistor;
    input clk, regTrigger, regTrigger_two;
    output [31:0] output_transistor, output_resistor;
    output [2:0] address_one, address_two;
    output clk_out;
    wire [31:0] transistor_extend, resistor_extend, resistor_out, transistor_out, register_transistor[7:0], register_resistor[3:0];
    wire [16:0] freq = 21'd80000;
    wire [7:0] regEnable_transistor, regEnable_resistor;
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
    
    decoder_3to8 decoder_transistors(regEnable_transistor, transistor_count, regTrigger);
    decoder_3to8 decoder_resistors(regEnable_resistor, resistor_count, regTrigger_two);
   
    assign address_one = transistor_count;
    assign address_two = resistor_count;
    assign output_transistor[31:8] = 24'd0;
    assign output_resistor[31:0] = 24'd0;
    //double check the 2d array implementation
    assign output_transistor[7:0] = register_transistor[determine_transistor][7:0];
    assign output_resistor[7:0] = register_resistor[determine_resistor][7:0];
    //ends here
    assign transistor_extend[31:8] = 24'd0;
    assign resistor_extend[31:8] = 24'd0;
    assign transistor_extend[7:0] = dc_input_one;
    assign resistor_extend[7:0] = dc_input_two;
   
    genvar i;
    genvar j;
    generate
        for(i = 0; i < 8; i = i + 1) begin: loop_transistor
			register transistor_register(transistor_extend, register_transistor[i], regTrigger, regEnable_transistor[i], 1'b0);
        end
        for(j = 0; j < 4; j = j + 1) begin: loop_resistor
			register resistor_register(resistor_extend, register_resistor[j], regTrigger_two, regEnable_resistor[j], 1'b0);
        end
    endgenerate
    
    clk_divider_adc adc(freq, clk, clk_out);
endmodule