module SignExtend(opCode,dataIn,dataOut,shouldExtend);

input[16:0] dataIn;
input[4:0] opCode;
output shouldExtend;
output[31:0] dataOut;

assign dataOut[31] = dataIn[16];
assign dataOut[30] = dataIn[16];
assign dataOut[29] = dataIn[16];
assign dataOut[28] = dataIn[16];
assign dataOut[27] = dataIn[16];
assign dataOut[26] = dataIn[16];
assign dataOut[25] = dataIn[16];
assign dataOut[24] = dataIn[16];
assign dataOut[23] = dataIn[16];
assign dataOut[22] = dataIn[16];
assign dataOut[21] = dataIn[16];
assign dataOut[20] = dataIn[16];
assign dataOut[19] = dataIn[16];
assign dataOut[18] = dataIn[16];
assign dataOut[17] = dataIn[16];
assign dataOut[16:0] = dataIn[16:0];
wire An, Bn, Cn, Dn, En,w1,w2,w3,w4;
not aNot(An,opCode[4]);
not bNot(Bn,opCode[3]);
not cNot(Cn,opCode[2]);
not dNot(Dn,opCode[1]);
not eNot(En,opCode[0]);

and and1(w1,An,Bn,opCode[2],opCode[0]);
and and2(w2,An,Bn,opCode[2],opCode[1]);
and and3(w3,An,Bn,opCode[1],En);
and and4(w4,An,opCode[3],Cn,Dn,En);

or or1(shouldExtend,w1,w2,w3,w4);


endmodule