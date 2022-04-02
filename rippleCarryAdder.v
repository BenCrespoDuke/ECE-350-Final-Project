module rippleCarryAdder(inA,inB,carryIn,sum,CarryOut);

input inA,inB,carryIn;
output sum, CarryOut;
wire w1,w2,w3,w4,w5,w6,w7;

nand n1(w1,inA,inB);
nand n2(w2,w1,inA);
nand n3(w3,w1,inB);
nand n4(w4,w3,w2);
nand n5(w5,w4,carryIn);
nand n6(w6,w4,w5);
nand n7(w7,w5,carryIn);
nand n8(CarryOut,w5,w1);
nand n9(sum,w6,w7);

endmodule