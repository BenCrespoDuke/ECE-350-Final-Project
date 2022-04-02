`timescale 1 ns/ 100 ps
module full_adder_tb;

    reg A, B, Cin;

    wire s, Cout;

   rippleCarryAdder adder(.inA(A), .inB(B), .carryIn(Cin), .sum(s), .CarryOut(Cout));
    
    initial begin
        A = 0;
        B = 0;
        Cin = 0;
        #80;
        $finish;

    end

    always 
        #10 A = ~A;
    always 
        #20 B = ~B;
    always 
        #40 Cin = ~Cin;
    
    always @(A,B,Cin) begin
        #1;
        $display("A:%b, B:%b, Cin:%b => s:%b, Cout%b",A,B,Cin,s,Cout);
    end

    initial begin
        $dumpfile("Full_Adder_Wave.vcd");
        $dumpvars(0, full_adder_tb);
    end

endmodule
