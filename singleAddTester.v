module singleAddTester(DataA,DataB,CarryIn,Sum,CarryOut);

input [31:0] DataA, DataB;
input CarryIn;
output [31:0] Sum;
output CarryOut;
wire [31:0] props, gens;

bitwise_And ander(DataA,DataB,gens);
bitwise_Or orr(DataA,DataB,props);

fullAdder adder(DataA, DataB, props, gens, CarryIn, Sum, CarryOut);

endmodule