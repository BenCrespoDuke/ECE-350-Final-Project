module equalsZero(dataA,out);
    input [31:0] dataA;
    output out;
    wire w1,w2,w3,w4;

    nor nor1(w1,dataA[0],dataA[1],dataA[2],dataA[3],dataA[4],dataA[5],dataA[6],dataA[7]);
    nor nor2(w2,dataA[8],dataA[9],dataA[10],dataA[11],dataA[12],dataA[13],dataA[14],dataA[15]);
    nor nor3(w3,dataA[16],dataA[17],dataA[18],dataA[19],dataA[20],dataA[21],dataA[22],dataA[23]);
    nor nor4(w4,dataA[24],dataA[25],dataA[26],dataA[27],dataA[28],dataA[29],dataA[30],dataA[31]);

    and(out,w1,w2,w3,w4);

endmodule