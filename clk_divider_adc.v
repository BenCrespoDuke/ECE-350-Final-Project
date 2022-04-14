module clk_divider_adc(freq, clk, new_clk);

    input clk;
    input [16:0] freq;
    output new_clk;

    localparam MHz = 1000000;
    localparam SYSTEM_FREQ = 100*MHz;

    wire [31:0] count_limit;
    reg [31:0] count;
    reg inter_clk;

    assign count_limit = SYSTEM_FREQ / (2 * freq) - 1;
    assign new_clk = inter_clk;

    always @(posedge clk) begin
        if (count >= count_limit) begin
            count = 32'b0;
            inter_clk = ~new_clk;
        end
        else begin
            count = count + 1;
        end
    end

endmodule