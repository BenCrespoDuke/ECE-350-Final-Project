module multdiv(data_operandA, data_operandB, ctrl_MULT, ctrl_DIV, clock, data_result, data_exception, data_resultRDY//, tempOut, tempOut2
);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;
    wire [31:0] MultSub, MultIn, props,gens,AddOut, shiftedMult, multAfterShift;
    wire subFlag, noAddFlag, firstOpFlag, shiftMultiplicanFlag, CarryOut;
    wire [63:0] regIn, preRegOut, regOut,realRegIn,pos2;
    wire [31:0] tempReg,shitftedMult;
    wire regEnable,clr,q,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w16,w12,w13,w14,w15,w17,wasEx, needToRes, overflowed,over, w102,w103;
    wire isMult,multDone;
   // output [2:0] tempOut, tempOut2;
   


    //Decides to Reset MULT/DIV
    //dffe_ref reffere(.q(needToRes), .d(ctrl_MULT || ctrl_DIV), .clk(clock), .en(1'b1), .clr(clr));
	 assign needToRes = ctrl_MULT || ctrl_DIV;
    dffe_ref isMultt(isMult,ctrl_MULT, clock, needToRes, clr);

    register64 prod(.data_In(realRegIn), .data_Out(preRegOut), .clk(clock),.en(1'b1),.clr(clr));


   mux_2 addOrSub(.out(MultIn),.select(subFlag),.in0(multAfterShift),.in1(MultSub));

   assign shitftedMult = data_operandA <<< 1;

   mux_2 needToShift(.out(multAfterShift),.select(shiftMultiplicanFlag), .in0(data_operandA), .in1(shitftedMult));

    
    multCtrl cttrl(.clck(clock),.ctrl_In(regOut[1:0]), .subFlag(subFlag), .noAddFlag(noAddFlag), .firstOpFlag(firstOpFlag), .shiftMultiplicanFlag(shiftMultiplicanFlag), .done(multDone),.q(q), .res(needToRes));

    bitwise_Not notty(multAfterShift,MultSub);
    bitwise_And gens1(MultIn,regOut[63:32],gens);
    bitwise_Or props1(MultIn,regOut[63:32],props);

    fullAdder adder(.carryIn(subFlag), .props(props), .gens(gens), .dataB(MultIn), .dataA(regOut[63:32]), .sum(AddOut), .carryOut(CarryOut)); 
 
    and orrgate(w1,regOut[33],regOut[34],regOut[35],regOut[36],regOut[37],regOut[38],regOut[39]);
    and orrrgate(w2,regOut[40],regOut[41],regOut[42],regOut[43],regOut[44],regOut[45],regOut[46],regOut[47]);
    and orrrrgate(w3,regOut[48],regOut[49],regOut[50],regOut[51],regOut[52],regOut[53],regOut[54],regOut[55]);
    and orrrrrgate(w4,regOut[56],regOut[57],regOut[58],regOut[59],regOut[60],regOut[61],regOut[62],regOut[63]);
    and gatte(w5,w1,w2,w3,w4,CarryOut);

    nor orrgate1(w6,regOut[33],regOut[34],regOut[35],regOut[36],regOut[37],regOut[38],regOut[39]);
    nor orrrgate2(w7,regOut[40],regOut[41],regOut[42],regOut[43],regOut[44],regOut[45],regOut[46],regOut[47]);
    nor orrrrgate3(w8,regOut[48],regOut[49],regOut[50],regOut[51],regOut[52],regOut[53],regOut[54],regOut[55]);
    nor orrrrrgate4(w9,regOut[56],regOut[57],regOut[58],regOut[59],regOut[60],regOut[61],regOut[62],regOut[63]);
    not notty4(w10,CarryOut);
    and gatte2(w11,w6,w7,w8,w9,w10);
    nor isOver(over,w11,w5,w17);
    nor orrgate5(w12,regOut[2],regOut[3],regOut[4],regOut[5],regOut[6],regOut[7],regOut[32],regOut[33]);
    nor orrrgate6(w13,regOut[8],regOut[9],regOut[10],regOut[11],regOut[12],regOut[13],regOut[14],regOut[15]);
    nor orrrrgate7(w14,regOut[16],regOut[17],regOut[18],regOut[19],regOut[20],regOut[21],regOut[22],regOut[23]);
    nor orrrrrgate8(w15,regOut[24],regOut[25],regOut[26],regOut[27],regOut[28],regOut[29],regOut[30],regOut[31]);
    and edgeCase(w16,w12,w13,w14,w15,w6,w7,w8,w9);
    and edgeCase2(w17,CarryOut,w16);
   //assign data_exception = CarryOut;
    wire w111, w112, w113, w114, w115,w116,overf;
   xor diffSign(w102,data_operandA[31],data_operandB[31]);
  // not uhhhh(w115,w5);
   xor signWrong(w103,w102,w5);
   or pleaseWork(overf,w103,over);
   not notbeg(w116,w16);
   and isovf(overflowed,overf,w116);


   
    


    mux_2 addOrNothing(.out(regIn[61:30]), .select(noAddFlag), .in0(AddOut), .in1(regOut[63:32]));
    assign regIn[62] = regIn[61];
    assign regIn[63] = regIn[62];
    assign regIn[29:0] = regOut[31:2];

    assign pos2[31:0] = data_operandB;
    assign pos2[63:32] = regIn[61:30];
    mux64 isFirst(.out(realRegIn), .select(needToRes), .in0(regIn), .in1(pos2));

    //assign data_result = regOut[33:2];
   /* assign tempOut[0] = divSubFlag;
    assign tempOut[2:1] = 2'b00;
    assign tempOut2[2] = subFlag;
    assign tempOut2[1] = noAddFlag;
    assign tempOut2[0] = shiftMultiplicanFlag;*/
   // dffe_ref oppDig(wasExe,data_exception,clock,1'b1,ctrl_MULT);
    mux64 whichone(.out(regOut),.select(needToRes), .in0(preRegOut), .in1(64'b0000000000000000000000000000000000000000000000000000000000000000));

    wire [63:0] DivPreOut,DivregOut,RegOutOnReset,DivRegIn,dataIn;
    wire [4:0] DivCount;
    wire [31:0] Divpops,DivAddOut,DivMultIn,negB,gensB,propsB,negatedB,DivNegate,DivAddIn,Divgens,Divprops,fixedBIn;
    wire CarryOut2,divDone,divSubFlag,CarryOut3,noRes,Zero1,Zero2,Zero3,Zero4,isZero,divDon,DivSinCtrl,CarryOut4,qIn;

    //Div Stuff

    not messedUpAgain(divSubFlag, DivregOut[62]);
    // Deciding whether to negate Div
    xor DivisorSignControl(DivSinCtrl,divSubFlag,data_operandB[31]);
    bitwise_Not notty3(data_operandB,DivNegate);
    mux_2  negateOrNot(.out(DivAddIn),.select(DivSinCtrl), .in0(data_operandB), .in1(DivNegate));
    
    //A = A-M or A = A+M
    bitwise_And gens12(DivAddIn,DivregOut[62:31],Divgens);
    bitwise_Or props12(DivAddIn,DivregOut[62:31],Divprops);
    fullAdder Divadder(.carryIn(DivSinCtrl), .props(Divprops), .gens(Divgens), .dataB(DivAddIn), .dataA(DivregOut[62:31]), .sum(DivAddOut), .carryOut(CarryOut2));
    
    //A pos or Negative
    
    //5 bit counter

    FiveBitCounter divCounter(clock,DivCount,needToRes);

    and divDon1(divDon,DivCount[0],DivCount[1],DivCount[2],DivCount[3],DivCount[4]);
    dffe_ref buffer1(divDone,divDon,clock,1'b1,needToRes);
    assign DivRegIn[63:32] = DivAddOut;
  // assign DivRegIn[63:32] = 32'b11000001100000000000000000000001;
    assign DivRegIn[31:1] =  DivregOut[30:0];
    
    not iMessEDUP(dataIn[0],DivAddOut[31]);
    
    assign dataIn[63:32] = DivAddOut;
    assign dataIn[31:1] =  DivregOut[30:0];

    
    register64 div(.data_In(dataIn), .data_Out(DivPreOut), .clk(clock),.en(1'b1),.clr(clr));

    bitwise_Not notty2(data_operandA,negB);
    bitwise_And gens13(negB,32'b00000000000000000000000000001,gensB);
    bitwise_Or props13(negB,32'b000000000000000000000000000001,propsB);

    fullAdder adder4(.carryIn(1'b0), .props(propsB), .gens(gensB), .dataB(negB), .dataA(32'b000000000000000000000000000001), .sum(negatedB), .carryOut(CarryOut4));

    mux_2 posOrNegB(.out(fixedBIn), .select(data_operandA[31]), .in0(data_operandA), .in1(negatedB));
    assign RegOutOnReset[31:0] = fixedBIn;
    assign RegOutOnReset[63:32] = 32'b00000000000000000000000000000000;
    not noRese(noRes,needToRes);
   // triState tekeReg(DivPreOut,noRes,DivregOut);
   // triState takeRes(RegOutOnReset,needToRes,DivregOut);
    mux64  chooseDataOutOfReggie(.out(DivregOut), .select(needToRes), .in0(DivPreOut), .in1(RegOutOnReset));
    nor notZero1(Zero1,data_operandB[0],data_operandB[1],data_operandB[2],data_operandB[3],data_operandB[4],data_operandB[5],data_operandB[6],data_operandB[7]);
    nor notZero2(Zero2,data_operandB[8],data_operandB[9],data_operandB[10],data_operandB[11],data_operandB[12],data_operandB[13],data_operandB[14],data_operandB[15]);
    nor notZero3(Zero3,data_operandB[16],data_operandB[17],data_operandB[18],data_operandB[19],data_operandB[20],data_operandB[21],data_operandB[22],data_operandB[23]);
    nor notZero4(Zero4,data_operandB[24],data_operandB[25],data_operandB[26],data_operandB[27],data_operandB[28],data_operandB[29],data_operandB[30],data_operandB[31]);
    and isZeroGate(isZero,Zero1,Zero2,Zero3,Zero4);

    //negate output and choose between negative and posive
    wire [31:0] negDivOut, gensC,propsC,negatedDivOut,DivResult;
    wire w101,CarryOut5;
    bitwise_Not notty22(DivregOut[31:0],negDivOut);
    bitwise_And gens132(negDivOut,32'b00000000000000000000000000001,gensC);
    bitwise_Or props132(negDivOut,32'b000000000000000000000000000001,propsC);
    fullAdder adder5(.carryIn(1'b0), .props(propsC), .gens(gensC), .dataB(negDivOut), .dataA(32'b000000000000000000000000000001), .sum(negatedDivOut), .carryOut(CarryOut5));
    
    xor negating(w101,data_operandA[31],data_operandB[31]);
    mux_2 negateOutPut(.out(DivResult),.select(w101), .in0(DivregOut[31:0]), .in1(negatedDivOut));

    // add your code here
	wire readyImm;
	wire [31:0] dataResImm;
      mux_2  chooseData(.out(dataResImm), .select(isMult), .in0(DivResult), .in1(regOut[33:2]));
      mux_2bit  chooseFin(.out(readyImm), .select(isMult), .in0(divDone) ,.in1(multDone));
		//dffe_ref isreaddy( data_resultRDY, readyImm, clock, 1'b1, clr);
		assign data_resultRDY = readyImm;
		register isreaddy2( dataResImm, data_result, clock, 1'b1, clr);
      mux_2bit dataEXE(.out(data_exception), .select(isMult), .in0(isZero), .in1(overflowed));

endmodule