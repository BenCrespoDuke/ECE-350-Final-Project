module multCtrl(clck,ctrl_In, subFlag, noAddFlag, firstOpFlag, shiftMultiplicanFlag, done,q,res);

input clck,res; 
input [1:0] ctrl_In;
output subFlag, noAddFlag, firstOpFlag, shiftMultiplicanFlag, done, q;
wire done1;
wire [3:0] cycle;
wire ns1,ns2,ns3,w1,w2,w3,w4,w5,w6;
FourBitCounter count(.clck(clck),.out(cycle), .res(res));
assign done1 = cycle[0] && cycle[1] && cycle[2] && cycle[3];
dffe_ref buffer(done,done1,clck,1'b1,res);
dffe_ref oppDig(q,ctrl_In[1],clck,1'b1,done);
not not3(ns3,q);
not not1(ns2,ctrl_In[0]);
not not2(ns1,ctrl_In[1]);


and noAdd1(w1,q,ctrl_In[0],ctrl_In[1]);
and noAdd2(w2,ns1,ns2,ns3);
or noAdd3(noAddFlag,w1,w2);

and mult1(w3,ns1,ctrl_In[0],q);
and mult2(w4,ctrl_In[1],ns2,ns3);
or mult3(shiftMultiplicanFlag,w3,w4);

and sub1(w5,ctrl_In[1],ns3);
and sub2(w6,ctrl_In[1],ns2);
or sub3(subFlag,w5,w6);

nor first(firstOpFlag,cycle[0],cycle[1],cycle[2],cycle[3]);


endmodule