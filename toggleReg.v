module toggleReg(q, d, clk, en, clr);

input d, clk, en, clr;
output q;
wire w1,w2,w3,w4,w5;

not notty(w1,d);
not notty2(w3,q);
and and1(w2,d,w3);
and and2(w4,w1,q);
or orgate(w5,w2,w4);

dffe_ref regg(q, w5, clk, 1'b1, clr);

endmodule