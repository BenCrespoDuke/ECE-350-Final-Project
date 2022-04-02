module simple_tb;

reg A;
reg [1:0] B;
reg [31:0] dataA;
reg [31:0] dataB;
wire signed [31:0] out;
wire [2:0]tempOut,temp2;
reg start;
wire out2;
wire exc;
wire rdy;
//FourBitCounter count(A,out,1'b0);
//multCtrl ctl(A,B, out[4], out[3], out[2], out[1], out[0],out2);
multdiv tester(dataA, dataB,  start, 1'b0, A, out, exc, rdy);
integer i = 8;
initial begin
    assign A = 1'b0;
    assign B = i;
   assign dataA = -13421772;
  //assign dataB = 0;
  assign dataA = -2147483648;
 assign dataB = -1;
    assign start = 1'b1;
    $display("PreFirstEdge: %b",out);
    #10 assign A = ~A;
    #10 assign A = ~A;
    assign start = 1'b0;
    $display("out2: %b",tempOut);
    $display("PostFirst Edge: %d",out);
  //  assign dataA = 8;
  //  assign dataB = 4;
  //  assign start = 1'b1;
  //  #10 assign A = ~A;
   // #10 assign A = ~A;
 //   assign start = 1'b0;
   // $display("out: %d", out);
for(i = 0; i<32;i= i+1) begin
   // $display("number: %d",out);
    #10 assign A = ~A;
    if(rdy == 1)begin

        $display("finished: %b",out);
        $display("is d o n e: %b",rdy);
        $display("is overflow: %b",exc);
        $display("ans: %d",(dataA/dataB));
        $finish;
    end
    #10 assign A = ~A;
    
    $display("cycle %d: %d",i+2,out);
     $display("ctrl: %b",tempOut);
  /*  $display("cycle: %d",i);
   $display("out: %d",out);
   $display("out2: %b",tempOut);
   $display("ctrl: %b",temp2);
    $display("is done: %b",rdy);
    $display("exc: %b",exc);*/

end
/*$display("out: %d",out);
#10 assign A = ~A;
#10 assign A = ~A;
 $display("is done: %b",rdy);
 $display("ans: %d",(dataA*dataB));*/

$finish;



end

initial begin
        $dumpfile("Full_Adder_Wave.vcd");
        $dumpvars(0, simple_tb);
    end


endmodule