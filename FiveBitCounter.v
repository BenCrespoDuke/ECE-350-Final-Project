module FiveBitCounter(clock,out,res);

input res,clock;

output [4:0] out;
wire w1, w2, w3, w4, w5,w6,w7,w8;
toggleReg t1(w1, 1'b1, clock, 1'b1, res);
toggleReg t2(w2, w1, clock, 1'b1, res);
and and1(w3,w2,w1);
toggleReg t3(w4, w3, clock, 1'b1, res);
and and2(w5,w2,w1,w4);
toggleReg t4(w6, w5, clock, 1'b1, res);
and and3(w7,w1,w2,w6,w4);
toggleReg t5(w8, w7, clock, 1'b1, res);

assign out[0] = w1;
assign out[1] = w2;
assign out[2] = w4;
assign out[3] = w6;
assign out[4] = w8;

endmodule