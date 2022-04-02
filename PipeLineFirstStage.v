module PipeLineFirstStage(PC_In,IR_In,PC_Out,IR_Out,clk,flush);

input [31:0] PC_In, IR_In;
input flush,clk;
output [31:0]  PC_Out, IR_Out;


register PC(PC_In, PC_Out, clk,1'b1,flush);
register IR(IR_In, IR_Out, clk,1'b1,flush);

endmodule