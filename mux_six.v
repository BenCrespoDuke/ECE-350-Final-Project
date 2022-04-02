module mux_six(in1,in2,in3,in4,in5,in6,sel,out);

input [31:0] in1,in2,in3,in4,in5,in6;
input [2:0] sel;
output [31:0] out;
wire [31:0] w1,w2,w3,w4;
mux_2 one(w1,sel[0],in1,in2);
mux_2 two(w2,sel[0],in3,in4);
mux_2 three(w3,sel[0],in5,in6);
mux_2 four(w4,sel[1],w1,w2);
mux_2 five(out,sel[2],w4,w3);

endmodule