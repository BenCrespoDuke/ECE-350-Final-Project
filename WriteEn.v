module WriteEn(Opcode,En,Lw,IR_Stage5,jal,sextIsn);

input[4:0] Opcode;
input [31:0] IR_Stage5;
output [31:0] sextIsn;
output jal;
output En,Lw;
wire w1,w2,w3,nA,nB,nC,nD,nE, OvFlag1,OvFlag2, OvfIm1, OvfIm2,OvfIm3,OvfIm4;
not not1(nA,Opcode[4]);
not not2(nB,Opcode[3]);
not not3(nC,Opcode[2]);
not not4(nD,Opcode[1]);
not not5(nE,Opcode[0]);

and and1(w1,nA,nC,nD,nE);
and and2(w2,nB,Opcode[2],nD,Opcode[0]);
and and3(w3,nA,nB,nC,Opcode[1],Opcode[0]);
assign jal = (!IR_Stage5[31] && !IR_Stage5[30] && !IR_Stage5[29] && IR_Stage5[28] && IR_Stage5[27]);
or or1(En,w1,w2,w3);
assign sextIsn[31:27] = 5'b00000;
assign sextIsn[26:0] = IR_Stage5[26:0];
and(Lw,nA,Opcode[3],nC,nD,nE);





endmodule