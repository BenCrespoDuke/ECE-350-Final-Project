`timescale 1 ns/ 100 ps
module singleAddTester_tb;

reg[31:0] A , B;
reg carryIn;
wire[7:0] sum;
wire carryOut;

singleAddTester tester(A,B,carryIn,sum,carryOut);

integer  i;
integer  j;


initial begin
    assign carryIn = 0;
    for(i = 0; i<255; i = i+1) begin
        for(j = 0; j<255; j = j+1) begin
            #40
            assign A = i;
            assign B = j;
            #40
            if( ((sum)!==(i+j))) begin
                if(!((i+j)>255 && carryOut == 1 && sum == (i+j-256)))begin
                    $display("failed at i = %d and j = %d  sum = %b",i,j,sum);
                    $finish;
                end
            end
            
        end
         $display("finished i = %d",i);
    end

    $finish;
end




endmodule