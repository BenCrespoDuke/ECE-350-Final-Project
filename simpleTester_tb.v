`timescale 1 ns/ 100 ps
module simpleTester_tb;

reg [31:0] A,B,Gen,Prop;
wire [31:0] sum;
reg [4:0] shiftAm;
reg carryIn;
wire CarryOut, ez, is;
wire [31:0] out,Bres;
//singleAddTester add(A, Bres,carryIn,sum,CarryOut);
alu myAlu(A, B, 0, 0, sum, ez, is, CarryOut);
bitwise_Not nott(B,Bres);
//RightShifter shifty(.dataA(A),.shiftAm(shiftAm),.out(out));
//equalsZero zero(A,out);
integer  i;
integer j;
initial begin
   assign carryIn = 0;
for(j = 1; j<2147; j=j+1)begin
for(i = 4; i< 2147; i =i +1) begin
    assign A = 8388608;
    //assign A = 33554432;
    assign B = 8388862;
    #10
    if(sum !== (i-j)) begin
        $display("error at A = %b  B = %b expected %b, got %b",A,B,(A+B),sum);
        //$display("%b",Bres);
        $finish;
    end
    // $display(" A = %b B = %b res = %b",A,B,sum);
   /* for(j = 16777216; j< 1073741824; j = j+16777216)begin
    assign A = i;
    assign B = j;
    assign carryIn = 0;
    #1;
    if(sum!==(i+j))begin
      //  if((i+j)>4294967295 && sum !== (i+j-4294967295) && CarryOut!== 1 ) begin
            $display("sum: %b A: %b, B: %b ",sum,A,B);
            $display("Expected: %b",(i+j));
    $finish;
     //   end
    end
    //$display("sum: %d A: %d, B: %d",sum,A,B);
    end*/
end
end
     $finish;
end

endmodule