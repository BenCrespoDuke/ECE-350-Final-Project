module Stage1Ctrl (NewIR, IR_Stage1,nop,jal,jump,jmpIsn);

input [31:0] NewIR, IR_Stage1;
output nop,jump,jal;
output [31:0] jmpIsn;

assign nop = (!IR_Stage1[31] && IR_Stage1[30] && !IR_Stage1[29] && !IR_Stage1[28] && !IR_Stage1[27]) && ((IR_Stage1[26:22] == NewIR[21:17]));

assign jump = (!IR_Stage1[31] && !IR_Stage1[30] && !IR_Stage1[29] && !IR_Stage1[28] && IR_Stage1[27]);

assign jal = (!IR_Stage1[31] && !IR_Stage1[30] && !IR_Stage1[29] && IR_Stage1[28] && IR_Stage1[27]);
assign jmpIsn[31:27] = 5'b00000;
assign jmpIsn[26:0] = IR_Stage1[26:0];
endmodule