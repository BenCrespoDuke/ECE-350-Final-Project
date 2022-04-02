module RightShifter(dataA,shiftAm,out);
     input[31:0] dataA;
     input [4:0] shiftAm;
     output[31:0] out;
     wire [31:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;
     wire shftTyp;
     and sn0(shftTyp,dataA[31],1);

    and sn11(w1[0],1,dataA[1]);
     and sn12(w1[1],1,dataA[2]);
     and sn13(w1[2],1,dataA[3]);
     and sn14(w1[3],1,dataA[4]);
     and sn15(w1[4],1,dataA[5]);
     and sn16(w1[5],1,dataA[6]);
     and sn17(w1[6],1,dataA[7]);
     and sn18(w1[7],1,dataA[8]);
     and sn19(w1[8],1,dataA[9]);
     and sn110(w1[9],1,dataA[10]);
     and sn111(w1[10],1,dataA[11]);
     and sn112(w1[11],1,dataA[12]);
     and sn113(w1[12],1,dataA[13]);
     and sn114(w1[13],1,dataA[14]);
     and sn115(w1[14],1,dataA[15]);
     and sn116(w1[15],1,dataA[16]);
     
     and s11(w1[16],1,dataA[17]);
     and s12(w1[17],1,dataA[18]);
     and s13(w1[18],1,dataA[19]);
     and s14(w1[19],1,dataA[20]);
     and s15(w1[20],1,dataA[21]);
     and s16(w1[21],1,dataA[22]);
     and s17(w1[22],1,dataA[23]);
     and s18(w1[23],1,dataA[24]);
     and s19(w1[24],1,dataA[25]);
     and s110(w1[25],1,dataA[26]);
     and s111(w1[26],1,dataA[27]);
     and s112(w1[27],1,dataA[28]);
     and s113(w1[28],1,dataA[29]);
     and s114(w1[29],1,dataA[30]);
     and s115(w1[30],1,dataA[31]);
     and s116(w1[31],1,shftTyp);

    mux_2 is1(w2,shiftAm[0],dataA,w1);

     and sn21(w3[0],1,w2[2]);
     and sn22(w3[1],1,w2[3]);
     and sn23(w3[2],1,w2[4]);
     and sn24(w3[3],1,w2[5]);
     and sn25(w3[4],1,w2[6]);
     and sn26(w3[5],1,w2[7]);
     and sn27(w3[6],1,w2[8]);
     and sn28(w3[7],1,w2[9]);
     and sn29(w3[8],1,w2[10]);
     and sn210(w3[9],1,w2[11]);
     and sn211(w3[10],1,w2[12]);
     and sn212(w3[11],1,w2[13]);
     and sn213(w3[12],1,w2[14]);
     and sn214(w3[13],1,w2[15]);
     and sn215(w3[14],1,w2[16]);
     and sn216(w3[15],1,w2[17]);

     and s21(w3[16],1,w2[18]);
     and s22(w3[17],1,w2[19]);
     and s23(w3[18],1,w2[20]);
     and s24(w3[19],1,w2[21]);
     and s25(w3[20],1,w2[22]);
     and s26(w3[21],1,w2[23]);
     and s27(w3[22],1,w2[24]);
     and s28(w3[23],1,w2[25]);
     and s29(w3[24],1,w2[26]);
     and s210(w3[25],1,w2[27]);
     and s211(w3[26],1,w2[28]);
     and s212(w3[27],1,w2[29]);
     and s213(w3[28],1,w2[30]);
     and s214(w3[29],1,w2[31]);
     and s215(w3[30],1,shftTyp);
     and s216(w3[31],1,shftTyp);

    mux_2 is2(w4,shiftAm[1],w2,w3);

    and sn41(w5[0],1,w4[4]);
     and sn42(w5[1],1,w4[5]);
     and sn43(w5[2],1,w4[6]);
     and sn44(w5[3],1,w4[7]);
     and sn45(w5[4],1,w4[8]);
     and sn46(w5[5],1,w4[9]);
     and sn47(w5[6],1,w4[10]);
     and sn48(w5[7],1,w4[11]);
     and sn49(w5[8],1,w4[12]);
     and sn410(w5[9],1,w4[13]);
     and sn411(w5[10],1,w4[14]);
     and sn412(w5[11],1,w4[15]);
     and sn413(w5[12],1,w4[16]);
     and sn414(w5[13],1,w4[17]);
     and sn415(w5[14],1,w4[18]);
     and sn416(w5[15],1,w4[19]);

     and s41(w5[16],1,w4[20]);
     and s42(w5[17],1,w4[21]);
     and s43(w5[18],1,w4[22]);
     and s44(w5[19],1,w4[23]);
     and s45(w5[20],1,w4[24]);
     and s46(w5[21],1,w4[25]);
     and s47(w5[22],1,w4[26]);
     and s48(w5[23],1,w4[27]);
     and s49(w5[24],1,w4[28]);
     and s410(w5[25],1,w4[29]);
     and s411(w5[26],1,w4[30]);
     and s412(w5[27],1,w4[31]);
     and s413(w5[28],1,shftTyp);
     and s414(w5[29],1,shftTyp);
     and s415(w5[30],1,shftTyp);
     and s416(w5[31],1,shftTyp);

    mux_2 is4(w6,shiftAm[2],w4,w5);

    and sn81(w7[0],1,w6[8]);
     and sn82(w7[1],1,w6[9]);
     and sn83(w7[2],1,w6[10]);
     and sn84(w7[3],1,w6[11]);
     and sn85(w7[4],1,w6[12]);
     and sn86(w7[5],1,w6[13]);
     and sn87(w7[6],1,w6[14]);
     and sn88(w7[7],1,w6[15]);
     and sn89(w7[8],1,w6[16]);
     and sn810(w7[9],1,w6[17]);
     and sn811(w7[10],1,w6[18]);
     and sn812(w7[11],1,w6[19]);
     and sn813(w7[12],1,w6[20]);
     and sn814(w7[13],1,w6[21]);
     and sn815(w7[14],1,w6[22]);
     and sn816(w7[15],1,w6[23]);

     and s81(w7[16],1,w6[24]);
     and s82(w7[17],1,w6[25]);
     and s83(w7[18],1,w6[26]);
     and s84(w7[19],1,w6[27]);
     and s85(w7[20],1,w6[28]);
     and s86(w7[21],1,w6[29]);
     and s87(w7[22],1,w6[30]);
     and s88(w7[23],1,w6[31]);
     and s89(w7[24],1,shftTyp);
     and s810(w7[25],1,shftTyp);
     and s811(w7[26],1,shftTyp);
     and s812(w7[27],1,shftTyp);
     and s813(w7[28],1,shftTyp);
     and s814(w7[29],1,shftTyp);
     and s815(w7[30],1,shftTyp);
     and s816(w7[31],1,shftTyp);

    mux_2 is8(w8,shiftAm[3],w6,w7);

     and sn161(w9[0],1,w8[16]);
     and sn162(w9[1],1,w8[17]);
     and sn163(w9[2],1,w8[18]);
     and sn164(w9[3],1,w8[19]);
     and sn165(w9[4],1,w8[20]);
     and sn166(w9[5],1,w8[21]);
     and sn167(w9[6],1,w8[22]);
     and sn168(w9[7],1,w8[23]);
     and sn169(w9[8],1,w8[24]);
     and sn1610(w9[9],1,w8[25]);
     and sn1611(w9[10],1,w8[26]);
     and sn1612(w9[11],1,w8[27]);
     and sn1613(w9[12],1,w8[28]);
     and sn1614(w9[13],1,w8[29]);
     and sn1615(w9[14],1,w8[30]);
     and sn1616(w9[15],1,w8[31]);

     and s161(w9[16],1,shftTyp);
     and s162(w9[17],1,shftTyp);
     and s163(w9[18],1,shftTyp);
     and s164(w9[19],1,shftTyp);
     and s165(w9[20],1,shftTyp);
     and s166(w9[21],1,shftTyp);
     and s167(w9[22],1,shftTyp);
     and s168(w9[23],1,shftTyp);
     and s169(w9[24],1,shftTyp);
     and s1610(w9[25],1,shftTyp);
     and s1611(w9[26],1,shftTyp);
     and s1612(w9[27],1,shftTyp);
     and s1613(w9[28],1,shftTyp);
     and s1614(w9[29],1,shftTyp);
     and s1615(w9[30],1,shftTyp);
     and s1616(w9[31],1,shftTyp);

     mux_2 is16(out,shiftAm[4],w8,w9);

endmodule





































    