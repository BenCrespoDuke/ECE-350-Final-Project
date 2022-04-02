module PipelineStage(DataIn_A,DataIn_B,PC_In,IR_In,DataOut_A,DataOut_B,PC_Out,IR_Out,clk,flush,ovf_In,ovf_Out,ovf_numIn,ovf_numOut);

input [31:0] DataIn_A, DataIn_B, PC_In, IR_In, ovf_numIn;
input flush,clk,ovf_In;
output ovf_Out;
output [31:0] DataOut_A, DataOut_B, PC_Out, IR_Out,ovf_numOut;

dffe_ref overFlow(.q(ovf_Out), .d(ovf_In), .clk(clk), .en(1'b1), .clr(flush));
register dataA(DataIn_A, DataOut_A, clk,1'b1,flush);
register dataB(DataIn_B, DataOut_B, clk,1'b1,flush);
register PC(PC_In, PC_Out, clk,1'b1,flush);
register IR(IR_In, IR_Out, clk,1'b1,flush);
register OvfNumb(ovf_numIn,ovf_numOut, clk, 1'b1, flush);

endmodule