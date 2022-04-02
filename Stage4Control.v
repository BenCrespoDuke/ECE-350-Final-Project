module Stage4Control(OpCode,wrEn,IR_Stage4,IR_Stage5,ByPassData);

input [31:0] IR_Stage5,IR_Stage4;
input [4:0] OpCode;
output ByPassData;
output wrEn;
wire nA,nB;
not not1(nA,OpCode[4]);
not not2(nB,OpCode[3]);
//not not3(nC,OpCode[2]);
//not not4(nD,OpCode[1]);
//ot not5(nE,OpCode[0]);
assign ByPassData = (IR_Stage5[26:22]== IR_Stage4[26:22]);
assign wrEn = !IR_Stage4[31] && !IR_Stage4[30] && IR_Stage4[29] && IR_Stage4[28] && IR_Stage4[27];





endmodule