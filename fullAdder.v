module fullAdder(dataA,dataB,props,gens,carryIn,sum,carryOut);

input [31:0] dataA,dataB,props,gens;
input carryIn;
output [31:0] sum;
output carryOut;
wire cc1,cc2,cc3,cc4;
wire c8,c16,c24,c32;
wire P0, P1, P2, P3, G0, G1, G2, G3;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36, w37;
adder_Block add1(carryIn, props[7:0], gens[7:0], dataA[7:0], dataB[7:0], sum[7:0], cc1);
adder_Block add2(c8, props[15:8], gens[15:8], dataA[15:8], dataB[15:8], sum[15:8], cc2);
adder_Block add3(c16, props[23:16], gens[23:16], dataA[23:16], dataB[23:16], sum[23:16], cc3);
adder_Block add4(c24, props[31:24], gens[31:24], dataA[31:24], dataB[31:24], sum[31:24], cc4);

and pzero(P0,props[0] ,props[1] ,props[2] ,props[3] ,props[4] ,props[5] ,props[6] ,props[7],carryIn);
and pone(P1,props[8] ,props[9] ,props[10] ,props[11] ,props[12] ,props[13] ,props[14] ,props[15]);
and ptwo(P2,props[16] ,props[17] ,props[18] ,props[19] ,props[20] ,props[21] ,props[22] ,props[23]);
and pthree(P3,props[24] ,props[25] ,props[26] ,props[27] ,props[28] ,props[29] ,props[30] ,props[31]);

and g1(w1,props[7],gens[6]);
and g11(w2,props[7],props[6],gens[5]);
and g111(w3,props[7],props[6],props[5],gens[4]);
and g1111(w4,props[7],props[6],props[5],props[4],gens[3]);
and g11111(w5,props[7],props[6],props[5],props[4], props[3], gens[2]);
and g111111(w6,props[7],props[6],props[5],props[4], props[3], props[2], gens[1]);
and g1111111(w7,props[7],props[6],props[5],props[4], props[3], props[2], props[1], gens[0]);
or gzero(G0,w1,w2,w3,w4,w5,w6,w7,gens[7]);
or carry8(c8,G0,P0);

and g2(w8,props[15],gens[14]);
and g22(w9,props[15],props[14],gens[13]);
and g222(w10,props[15],props[14],props[13],gens[12]);
and g2222(w11,props[15],props[14],props[13],props[12],gens[11]);
and g22222(w12,props[15],props[14],props[13],props[12], props[11], gens[10]);
and g222222(w13,props[15],props[14],props[13],props[12], props[11], props[10], gens[9]);
and g2222222(w14,props[15],props[14],props[13],props[12], props[11], props[10], props[9], gens[8]);
or gOne(G1,w8,w9,w10,w11,w12,w13,w14,gens[15]);
and C1And(w15,P1,P0);
and C1And2(w16,P1,G0);
or carry16(c16,w15,w16,G1);


and g3(w17,props[23],gens[22]);
and g33(w18,props[23],props[22],gens[21]);
and g333(w19,props[23],props[22],props[21],gens[20]);
and g3333(w20,props[23],props[22],props[21],props[20],gens[19]);
and g33333(w21,props[23],props[22],props[21],props[20], props[19], gens[18]);
and g333333(w22,props[23],props[22],props[21],props[20], props[19], props[18], gens[17]);
and g3333333(w23,props[23],props[22],props[21],props[20], props[19], props[18], props[17], gens[16]);
or gTwo(G2,w17,w18,w19,w20,w21,w22,w23,gens[23]);
and C2And(w24,P1,P0,P2);
and C2And2(w25,P1,G0,P2);
and C2And3(w37,P2,G1);
or carry24(c24,w24,w25,G2,w37);


and g4(w26,props[31],gens[30]);
and g44(w27,props[31],props[30],gens[29]);
and g444(w28,props[31],props[30],props[29],gens[28]);
and g4444(w29,props[31],props[30],props[29],props[28],gens[27]);
and g44444(w30,props[31],props[30],props[29],props[28], props[27], gens[26]);
and g444444(w31,props[31],props[30],props[29],props[28], props[27], props[26], gens[25]);
and g4444444(w32,props[31],props[30],props[29],props[28], props[27], props[26], props[25], gens[24]);
or gThree(G3,w26,w27,w28,w29,w30,w31,w32,gens[31]);
and C3And(w33,P1,P0,P2,P3);
and C3And2(w34,G0,P1,P2,P3);
and C3And3(w35,G1,P2,P3);
and C3And4(w36,G2,P3);
or fincarry(carryOut,G3,w33,w34,w35,w36);

endmodule

