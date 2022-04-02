`timescale 1 ns/ 100 ps
module alu1_tb;

    reg[31:0] A , B;
    wire[31:0] And_Out, Or_Out, Not_Out;


    bitwise_Or Orr(A,B,Or_Out);
    bitwise_Not Nott(A,Not_Out);
    bitwise_And app(A, B, And_Out);
    integer i;
    integer b = 1;
  
    initial begin
        
    for(i = 0; i<32; i = i+1) begin
            #20;
            assign A = 0;
            assign  B = 0;
            #20
            if(Not_Out[i] !== 1 | Or_Out[i] !== 0 | And_Out[i]!== 0)begin
                $display("%b, %b ,%b",Not_Out[i],Or_Out[i],And_Out[i]);
                $display("error on bit %b case 1", b);
                $finish;
            end
            #20;

            assign A = b;
            assign B = 0;
            #20
            if(Not_Out[i] !== 0 | Or_Out[i] !== 1 | And_Out[i]!== 0)begin
                $display("error on bit %b case 2", b);
                $finish;
            end
           
        
            #20;

            assign A = 0;
           assign  B = b;
           #20
            if( Or_Out[i] !== 1 | And_Out[i]!== 0)begin
                $display("error on bit %b case 3", b);
                $finish;
            end

            #20;
            assign A = b;
            assign B = b;
            #20
            if( Or_Out[i] !== 1 | And_Out[i]!== 1)begin
                $display("error on bit %b case 4",b);
                $finish;
            end
  
            b = b*2;
    end
    $finish;
    end
endmodule




