module Decoder32(out, select);

input [4:0] select;
output [31:0] out;
wire ns0,ns1,ns2,ns3,ns4;

not not1(ns0,select[0]);
not not2(ns1,select[1]);
not not3(ns2,select[2]);
not not4(ns3,select[3]);
not not5(ns4,select[4]);

and(out[0],ns0,ns1,ns2,ns3,ns4);
and(out[1],select[0],ns1,ns2,ns3,ns4);
and(out[2],ns0,select[1],ns2,ns3,ns4);
and(out[3],select[0],select[1],ns2,ns3,ns4);
and(out[4],ns0,ns1,select[2],ns3,ns4);
and(out[5],select[0],ns1,select[2],ns3,ns4);
and(out[6],ns0,select[1],select[2],ns3,ns4);
and(out[7],select[0],select[1],select[2],ns3,ns4);
and(out[8],ns0,ns1,ns2,select[3],ns4);
and(out[9],select[0],ns1,ns2,select[3],ns4);
and(out[10],ns0,select[1],ns2,select[3],ns4);
and(out[11],select[0],select[1],ns2,select[3],ns4);
and(out[12],ns0,ns1,select[2],select[3],ns4);
and(out[13],select[0],ns1,select[2],select[3],ns4);
and(out[14],ns0,select[1],select[2],select[3],ns4);
and(out[15],select[0],select[1],select[2],select[3],ns4);

and(out[16],ns0,ns1,ns2,ns3,select[4]);
and(out[17],select[0],ns1,ns2,ns3,select[4]);
and(out[18],ns0,select[1],ns2,ns3,select[4]);
and(out[19],select[0],select[1],ns2,ns3,select[4]);
and(out[20],ns0,ns1,select[2],ns3,select[4]);
and(out[21],select[0],ns1,select[2],ns3,select[4]);
and(out[22],ns0,select[1],select[2],ns3,select[4]);
and(out[23],select[0],select[1],select[2],ns3,select[4]);
and(out[24],ns0,ns1,ns2,select[3],select[4]);
and(out[25],select[0],ns1,ns2,select[3],select[4]);
and(out[26],ns0,select[1],ns2,select[3],select[4]);
and(out[27],select[0],select[1],ns2,select[3],select[4]);
and(out[28],ns0,ns1,select[2],select[3],select[4]);
and(out[29],select[0],ns1,select[2],select[3],select[4]);
and(out[30],ns0,select[1],select[2],select[3],select[4]);
and(out[31],select[0],select[1],select[2],select[3],select[4]);



endmodule