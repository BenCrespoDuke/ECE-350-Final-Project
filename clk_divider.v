module clk_divider(freq, clk, new_clk,change);

    input clk,change;
    input [31:0] freq;
    output new_clk;

    localparam MHz = 1000000;
    localparam SYSTEM_FREQ = 100*MHz;

    wire [31:0] count_limit;
    reg [31:0] count;
    reg inter_clk;

    assign count_limit = freq;
    assign new_clk = inter_clk;

    always @(posedge clk) begin
        if(change == 1'b1) begin
            count = 32'b0;
            inter_clk = 1'b0;
        end
        else if (count >= count_limit) begin
            count = 32'b0;
            inter_clk = 1'b1;
        end
        else begin
            count = count + 1;
            inter_clk = 1'b0;
        end
    end

endmodule