module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;



    wire [31:0] AndRes, OrRes, notRes, addRes,addInB,leftShiftRes,rightShiftRes,props,gens; 
    wire carryOut,is;
    wire ez,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
   
    
    bitwise_And and_block(.in1(data_operandA),.in2(data_operandB),.out(AndRes));
    bitwise_Or or_block(.in1(data_operandA),.in2(data_operandB),.out(OrRes));
    bitwise_Not not_block(.in1(data_operandB), .out(notRes));

    bitwise_And and_blockk(.in1(data_operandA),.in2(addInB),.out(gens));
    bitwise_Or or_blockk(.in1(data_operandA),.in2(addInB),.out(props));

    fullAdder addd(.dataA(data_operandA),.dataB(addInB),.props(props),.gens(gens),.carryIn
    (ctrl_ALUopcode[0]),.sum(addRes),.carryOut(carryOut));

    mux_2 posOrNeg(.out(addInB),.select(ctrl_ALUopcode[0]),.in0(data_operandB),.in1(notRes));

    
    equalsZero equalizer(.dataA(addRes),.out(ez));
    not nEq(isNotEqual,ez);
    not nLT(is,addRes[31]);
    not NLT(w8, is);
    and aa(w9,overflow,is);
    or aarp(w10,w8,w9);
    not emp(w12,data_operandA[31]);
    nand aarpp(w11,data_operandB[31],w12);
    and(isLessThan,w10,w11);
    
    LeftShifter lShift(.dataA(data_operandA),.shiftAm(ctrl_shiftamt),.out(leftShiftRes));
    RightShifter rShift(.dataA(data_operandA),.shiftAm(ctrl_shiftamt),.out(rightShiftRes));

    mux_six selecter(addRes,addRes,AndRes,OrRes,leftShiftRes,rightShiftRes,ctrl_ALUopcode[2:0],data_result);

    and over1(w2,data_operandA[31],addInB[31]);
    not dumb(w3,addRes[31]);
    and over2(w4,w2,w3);
    not dumb1(w5,data_operandA[31]);
    not dumb11(w6,addInB[31]);
    and dumb111(w7,w5,w6,addRes[31]);
    or dumb1111(overflow,w7,w4);
    // add your code here:

endmodule