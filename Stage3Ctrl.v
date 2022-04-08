module  Stage3Ctrl(CurrentIR,IRStage4,IRStage5,byPassB1,byPassA1,byPassB2,byPassA2,OvfIn,OvfFlag,OvfOut,OvfStage4,OvfStage5,TakeOvf4A,TakeOvf5A,TakeOvf4B, TakeOvf5B);

input[31:0] CurrentIR,IRStage4,IRStage5;
output [31:0] OvfOut;
input OvfIn,OvfStage4,OvfStage5;
output byPassA1,byPassA2, byPassB1, byPassB2,OvfFlag,TakeOvf4A,TakeOvf5A,TakeOvf4B, TakeOvf5B;
wire [31:0] IR_Stage3;
wire branchIsn,branchIsn4,branchIsn5,spIsn4,spIsn5;
assign spIsn4 = IRStage4[31:27] == 5'b01001;
assign spIsn5 = IRStage5[31:27] == 5'b01001;
assign branchIsn = (!IR_Stage3[31] && !IR_Stage3[30] && !IR_Stage3[29] && IR_Stage3[28] && !IR_Stage3[27]) || (!IR_Stage3[31] && !IR_Stage3[30] && IR_Stage3[29] && IR_Stage3[28] && !IR_Stage3[27]);
assign branchIsn4 = (!IRStage4[31] && !IRStage4[30] && !IRStage4[29] && IRStage4[28] && !IRStage4[27]) || (!IRStage4[31] && !IRStage4[30] && IRStage4[29] && IRStage4[28] && !IRStage4[27]);
assign branchIsn5 = (!IRStage5[31] && !IRStage5[30] && !IRStage5[29] && IRStage5[28] && !IRStage5[27]) || (!IRStage5[31] && !IRStage5[30] && IRStage5[29] && IRStage5[28] && !IRStage5[27]);
assign IR_Stage3 = CurrentIR;
assign byPassA1 = (CurrentIR[21:17] == IRStage4[26:22]) && !(!IRStage4[31] && !IRStage4[30] && IRStage4[29] && IRStage4[28] && IRStage4[27]) && (IRStage4[26:22] != 0) && !branchIsn4 && !spIsn4;
assign byPassA2 = (CurrentIR[21:17] == IRStage5[26:22]) && !(!IRStage5[31] && !IRStage5[30] && IRStage5[29] && IRStage5[28] && IRStage5[27]) && (IRStage5[26:22] != 0) && !branchIsn5 && !spIsn5;
assign byPassB1 = (CurrentIR[16:12] == IRStage4[26:22] || (branchIsn && (CurrentIR[26:22] == IRStage4[26:22]))) && !(!CurrentIR[31] && !CurrentIR[30] && CurrentIR[29] && CurrentIR[28] && CurrentIR[27]) && (IRStage4[26:22] != 0) && !branchIsn4 && !spIsn4;
assign byPassB2 = (CurrentIR[16:12] == IRStage5[26:22] || (branchIsn && (CurrentIR[26:22] == IRStage5[26:22]))) && !(!CurrentIR[31] && !CurrentIR[30] && CurrentIR[29] && CurrentIR[28] && CurrentIR[27]) && (IRStage5[26:22] != 0) && !branchIsn5 && !spIsn5;


assign TakeOvf4A = OvfStage4 && (CurrentIR[21:17] == 5'b11110) && !(!IRStage4[30] && IRStage4[29] && IRStage4[28] && IRStage4[27]);
assign TakeOvf5A = OvfStage5 && (CurrentIR[21:17] == 5'b11110) && !(!IRStage4[30] && IRStage4[29] && IRStage4[28] && IRStage4[27]);
assign TakeOvf4B = OvfStage4 && (CurrentIR[16:12] == 5'b11110) && !(!IRStage4[30] && IRStage4[29] && IRStage4[28] && IRStage4[27]);
assign TakeOvf5B = OvfStage5 && (CurrentIR[16:12] == 5'b11110) && !(!IRStage4[30] && IRStage4[29] && IRStage4[28] && IRStage4[27]);


wire OvFlag1, OvFlag2;
wire [31:0] OvfIm1,OvfIm2,OvfIm3,OvfIm4;
assign OvFlag1 = (!IR_Stage3[31] && !IR_Stage3[30] && !IR_Stage3[29] && !IR_Stage3[28] && !IR_Stage3[27]) && ((!IR_Stage3[6] && !IR_Stage3[5] && !IR_Stage3[4] && !IR_Stage3[3] && !IR_Stage3[2]) || (!IR_Stage3[6] && !IR_Stage3[5] && !IR_Stage3[4] && !IR_Stage3[3] && IR_Stage3[2]) || (!IR_Stage3[6] && !IR_Stage3[5] && !IR_Stage3[4] && !IR_Stage3[3] && !IR_Stage3[2]) || (!IR_Stage3[6] && !IR_Stage3[5] && IR_Stage3[4] && IR_Stage3[3] && !IR_Stage3[2]) || (!IR_Stage3[6] && !IR_Stage3[5] && IR_Stage3[4] && IR_Stage3[3] && IR_Stage3[2]));
assign OvFlag2 = (!IR_Stage3[31] && !IR_Stage3[30] && IR_Stage3[29] && !IR_Stage3[28] && IR_Stage3[27]);
assign OvfFlag = OvfIn && (OvFlag1 || OvFlag2);
assign OvfIm1 = (!IR_Stage3[6] && !IR_Stage3[5] && !IR_Stage3[4] && !IR_Stage3[3]  && !IR_Stage3[2]) ? 1 : 0;
assign OvfIm2 = (!IR_Stage3[31] && !IR_Stage3[30] && IR_Stage3[29] && !IR_Stage3[28] && IR_Stage3[27]) ? 2 : OvfIm1;
assign OvfIm3 = (!IR_Stage3[6] && !IR_Stage3[5] && !IR_Stage3[4] && !IR_Stage3[3] && IR_Stage3[2]) ? 3 : OvfIm2;
assign OvfIm4 = (!IR_Stage3[6] && !IR_Stage3[5] && IR_Stage3[4] && IR_Stage3[3] && !IR_Stage3[2]) ? 4 :OvfIm3;
assign OvfOut = (!IR_Stage3[6] && !IR_Stage3[5] && IR_Stage3[4] && IR_Stage3[3] && IR_Stage3[2]) ? 5 : OvfIm4;

endmodule