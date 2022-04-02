module branchCtrl (IR_Stage3,nEQ,LT,shouldBranch,newPC,branchIsn,Stage3PC,signExtended);

input [31:0] IR_Stage3,Stage3PC,signExtended;
input nEQ, LT;
output shouldBranch,branchIsn;
output [31:0] newPC;
wire junk,realLT;
wire [31:0] PCGens, PCProps;
assign branchIsn = (!IR_Stage3[31] && !IR_Stage3[30] && !IR_Stage3[29] && IR_Stage3[28] && !IR_Stage3[27]) || (!IR_Stage3[31] && !IR_Stage3[30] && IR_Stage3[29] && IR_Stage3[28] && !IR_Stage3[27]);
assign shouldBranch = (nEQ && !IR_Stage3[31] && !IR_Stage3[30] && !IR_Stage3[29] && IR_Stage3[28] && !IR_Stage3[27]) ||  (realLT && !IR_Stage3[31] && !IR_Stage3[30] && IR_Stage3[29] && IR_Stage3[28] && !IR_Stage3[27]);
assign realLT = !LT && nEQ;
    bitwise_And PCgen(.in1(Stage3PC),.in2(signExtended),.out(PCGens));
    bitwise_Or PCProp(.in1(Stage3PC),.in2(signExtended),.out(PCProps));
    fullAdder PCCounter(.dataA(Stage3PC),.dataB(signExtended),.props(PCProps),.gens(PCGens),.carryIn(1'b0),.sum(newPC),.carryOut(junk));
    
endmodule