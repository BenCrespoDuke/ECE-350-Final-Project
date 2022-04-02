module triState(in,en,out);
input [31:0] in;
input en;
output [31:0] out;

assign out = en ? in : 31'bz;

endmodule