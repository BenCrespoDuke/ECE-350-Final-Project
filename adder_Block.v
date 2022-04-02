module adder_Block(carryIn, prop, gen, A, B, Out, CarryOut);

input carryIn;
input [7:0] prop,gen,A,B;
output CarryOut;
output [7:0] Out;
wire ca1,ca2,ca3,ca4,ca5,ca6,ca7;
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36;

 
xor s0(Out[0],carryIn,A[0],B[0]);

and pg1(w1,carryIn,prop[0]);
or c1(ca1,w1,gen[0]);
xor s1(Out[1],ca1,A[1],B[1]);

and pg2(w3,prop[1],prop[0],carryIn);
and pg22(w2,prop[1],gen[0]);
or c2(ca2,gen[1],w2,w3);
xor s2(Out[2],ca2,A[2],B[2]);

and pg3(w4,prop[2],prop[1],prop[0],carryIn);
and pg33(w5,prop[2],prop[1],gen[0]);
and pg333(w6,prop[2],gen[1]);
or c3(ca3,w4,w5,w6,gen[2]);
xor s3(Out[3],ca3,A[3],B[3]);

and pg4(w7,prop[3],prop[2],prop[1],prop[0],carryIn);
and pg44(w8,prop[3],prop[2],prop[1],gen[0]);
and pg444(w9,prop[3],prop[2],gen[1]);
and pg4444(w10,prop[3],gen[2]);
or c4(ca4,w7,w8,w9,w10,gen[3]);
xor s4(Out[4],ca4,A[4],B[4]);


and pg5(w11,prop[4],prop[3],prop[2],prop[1],prop[0],carryIn);
and pg55(w12,prop[4],prop[3],prop[2],prop[1],gen[0]);
and pg555(w13,prop[4],prop[3],prop[2],gen[1]);
and pg5555(w14,prop[4],prop[3],gen[2]);
and pg55555(w15,prop[4],gen[3]);
or c5(ca5,w11,w12,w13,w14,w15,gen[4]);
xor s5(Out[5],ca5,A[5],B[5]);

and pg6(w16,prop[5],prop[4],prop[3],prop[2],prop[1],prop[0],carryIn);
and pg66(w17,prop[5],prop[4],prop[3],prop[2],prop[1],gen[0]);
and pg666(w18,prop[5],prop[4],prop[3],prop[2],gen[1]);
and pg6666(w19,prop[5],prop[4],prop[3],gen[2]);
and pg66666(w20,prop[5],prop[4],gen[3]);
and pg666666(w21,prop[5],gen[4]);
or c6(ca6,w16,w17,w18,w19,w20,w21,gen[5]);
xor s6(Out[6],ca6,A[6],B[6]);

and pg7(w22,prop[6],prop[5],prop[4],prop[3],prop[2],prop[1],prop[0],carryIn);
and pg77(w23,prop[6],prop[5],prop[4],prop[3],prop[2],prop[1],gen[0]);
and pg777(w24,prop[6], prop[5],prop[4],prop[3],prop[2],gen[1]);
and pg7777(w25,prop[6], prop[5],prop[4],prop[3],gen[2]);
and pg77777(w26,prop[6], prop[5],prop[4],gen[3]);
and pg777777(w27,prop[6], prop[5],gen[4]);
and pg7777777(w28,prop[6],gen[5]);
or c7(ca7,w22,w23,w24,w25,w26,w27,w28,gen[6]);
xor s7(Out[7],ca7,A[7],B[7]);

and pg8(w29,prop[7], prop[6],prop[5],prop[4],prop[3],prop[2],prop[1],prop[0],carryIn);
and pg88(w30,prop[7], prop[6],prop[5],prop[4],prop[3],prop[2],prop[1],gen[0]);
and pg888(w31,prop[7], prop[6], prop[5],prop[4],prop[3],prop[2],gen[1]);
and pg8888(w32,prop[7], prop[6], prop[5],prop[4],prop[3],gen[2]);
and pg88888(w33,prop[7], prop[6], prop[5],prop[4],gen[3]);
and pg888888(w34,prop[7], prop[6], prop[5],gen[4]);
and pg8888888(w35,prop[7], prop[6],gen[5]);
and pg88888888(w36,prop[7],gen[6]);
or c8(CarryOut,w29,w30,w31,w32,w33,w34,w35,w36,gen[7]);




endmodule