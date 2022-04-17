/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB,
    directions,
    PMWOut,                  // I: Data from port B of RegFile
	transistors,
    resistors,
    regTrigger,
    regTrigger_two,
    address_transistors,
    address_resistors,
    clk_adc

	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

    //motors
    output [7:0] directions;
    output [3:0] PMWOut;
    
    //photoresistors and phototransistors
    input [7:0] transistors, resistors;
    input regTrigger, regTrigger_two;
    output [2:0] address_transistors, address_resistors;
	output clk_adc;

	/* YOUR CODE STARTS HERE */
    wire invertClock,nop,ctrl_MULT,ctrl_DIV,MultDivExE, IsMDOut, isMDIN,MultDivFin,stage3Over,jmp,jal,jr,shldBrnch,branchIsn,doBex;
    not inClock(invertClock,clock);
    wire [31:0] dataA, dataB, PC_Stage2, PC_Stage3,IR_Stage2,IR_Stage3,ALU_Output, PC_Stage1,PCIncimented,PCGens,PCProps,PC_In,PC_Out, IR_Stage1,MultDivOut,jrIsn;
    wire [31:0] dataMemA, dataMemB,PC_Stage4, IR_Stage4, WriteBackO, WriteBackD, PC_Stage5,IR_Stage5, dataToReg, junk32,PCIntern1,jmpIsn,PC_In1,branchPC,PC_In2,bexIsn;
    wire AluOver, ovfStage4, ovfStage5,MemWrEn,junk,nEQ,LT, regMemFlag;
    dffe_ref ISmldv(.q(IsMDOut), .d(isMDIN), .clk(clock), .en(1'b1), .clr(reset));
    register CurrentPC(.data_In(PC_In), .data_Out(PC_Out), .clk(invertClock),.en(1'b1),.clr(reset));

    bitwise_And PCgen(.in1(address_imem),.in2(32'b00000000000000000000000000000001),.out(PCGens));
    bitwise_Or PCProp(.in1(address_imem),.in2(32'b00000000000000000000000000000001),.out(PCProps));
    fullAdder PCCounter(.dataA(address_imem),.dataB(32'b00000000000000000000000000000001),.props(PCProps),.gens(PCGens),.carryIn(1'b0),.sum(PCIncimented),.carryOut(junk));

    assign PCIntern1 = (jmp || jal)? jmpIsn : PCIncimented;
    assign PC_In1 =  (nop|| IsMDOut) ? PC_Out : PCIntern1;
    assign PC_In2 = doBex?  bexIsn: PC_In1;
    assign PC_In = shldBrnch? branchPC : PC_In2;
    wire [31:0] IRInStage1;
    Stage1Ctrl CTRLSTAGE1(.NewIR(q_imem), .IR_Stage1(IR_Stage2),.nop(nop),.jal(jal), .jump(jmp), .jmpIsn(jmpIsn));

    assign address_imem = jr ? jrIsn : PC_Out;
    assign IR_Stage1 = nop ? 0 : q_imem;
    wire stage2Clk, stage1Res;
    assign stage1Res = reset;
    
    assign IRInStage1 = (shldBrnch || doBex)? 0 : IsMDOut? IR_Stage2 : IR_Stage1;

    PipeLineFirstStage stage1(.PC_In(PCIncimented),.IR_In(IRInStage1),.PC_Out(PC_Stage2),.IR_Out(IR_Stage2),.clk(invertClock),.flush(stage1Res));
        wire SWisn;
        Stage2Ctrl ctrl2(.IR_Stage1(IR_Stage2),.isSW(SWisn),.jr(jr), .bexIsn(bexIsn));
        wire [4:0] ctrl_reafRegA1;
        wire bex;
        assign bex = (IR_Stage2 == 5'b10110);
        assign ctrl_reafRegA1 = bex ? 5'b11110 : IR_Stage2[21:17];
        assign ctrl_readRegA = jr? IR_Stage2[26:22] : ctrl_reafRegA1;
        assign jrIsn =  (IR_Stage2[26:22] == ctrl_writeReg) ? data_writeReg : ((IR_Stage2[26:22] == IR_Stage3[26:22]) ?  stage3Out :  data_readRegA);           
        assign ctrl_readRegB = SWisn ? IR_Stage2[26:22] : IR_Stage2[16:12];
        wire stage2Res;
        
        assign stage2Res = reset;
        assign doBex = bex && (data_readRegA != 0);
        wire [31:0] IRInStage2;
        assign IRInStage2 = (shldBrnch || IsMDOut)? 0 : IR_Stage2;
        
    PipelineStage stage2(.DataIn_A(data_readRegA), .DataIn_B(data_readRegB),.PC_In(PC_Stage2),.IR_In(IRInStage2),.DataOut_A(dataA),.DataOut_B(dataB),.PC_Out(PC_Stage3),
    .IR_Out(IR_Stage3),.clk(invertClock),.flush(stage2Res), .ovf_In(1'b0), .ovf_Out(junk), .ovf_numIn(0), .ovf_numOut(junk32));
        wire [31:0] extended, AluInB,AIntern1,datAAluIn, BIntern1, BIntern2,OvfValue, OvfNumbStage5, OvfNumbStage4,AIntern2,AIntern3,BIntern3,BIntern4, output_transistors, output_resistors;
        wire immFlag, BypassA1,BypassA2,BypassB1,BypassB2,OvfFlag,TakeOvf4A,TakeOvf5A,TakeOvf4B, TakeOvf5B;
        wire [4:0] ALUOpIn1,ALUOpIn;

        assign AIntern1 = BypassA2 ? dataToReg : dataA;
        assign AIntern2 = BypassA1 ? dataMemA : AIntern1;
        assign AIntern3 =  TakeOvf5A ? OvfNumbStage5 : AIntern2;
        assign datAAluIn = TakeOvf4A ? OvfNumbStage4 : AIntern3;
        //All bypassing control done for stage 3
        Stage3Ctrl ThirdCtrl(.CurrentIR(IR_Stage3),.IRStage4(IR_Stage4),.IRStage5(IR_Stage5),.byPassB1(BypassB1),.byPassA1(BypassA1),.byPassB2(BypassB2),.byPassA2(BypassA2),.OvfIn(stage3Over),.OvfFlag(OvfFlag),.OvfOut(OvfValue),.TakeOvf4A(TakeOvf4A),.TakeOvf5A(TakeOvf5A),.TakeOvf4B(TakeOvf4B), .TakeOvf5B(TakeOvf5B), .OvfStage4(ovfStage4),  .OvfStage5(ovfStage5) );
   
        assign BIntern1 = BypassB2 ? dataToReg : dataB ;
        assign BIntern3 = BypassB1 ? dataMemA : BIntern1;
        assign BIntern4 = TakeOvf5B ? OvfNumbStage5 : BIntern3;
        assign BIntern2 = TakeOvf4B ? OvfNumbStage4 : BIntern4;
        //Decides whether it is an immident instruction
        SignExtend Extendor(.opCode(IR_Stage3[31:27]),.dataIn(IR_Stage3[16:0]),.dataOut(extended),.shouldExtend(immFlag));
        
        mux_2 willExtend(.out(AluInB), .select(immFlag && !branchIsn), .in0(BIntern2), .in1(extended));

        mux_2_5Bit ALUOPIn(.out(ALUOpIn1), .select(immFlag), .in0(IR_Stage3[6:2]), .in1(5'b00000));
        assign ALUOpIn = branchIsn? 5'b00001 : ALUOpIn1;
        wire [31:0] MultDataA, MultDataB,multInA,multInB;
        assign isMDIN = (IsMDOut && !MultDivFin) || (!IsMDOut && (ctrl_DIV || ctrl_MULT)); 
        assign ctrl_MULT = (!IR_Stage3[31] && !IR_Stage3[30] && !IR_Stage3[29] && !IR_Stage3[28] && !IR_Stage3[27]) && (!IR_Stage3[6] && !IR_Stage3[5] && IR_Stage3[4] && IR_Stage3[3] && !IR_Stage3[2]);
        assign ctrl_DIV = (!IR_Stage3[31] && !IR_Stage3[30] && !IR_Stage3[29] && !IR_Stage3[28] && !IR_Stage3[27]) && (!IR_Stage3[6] && !IR_Stage3[5] && IR_Stage3[4] && IR_Stage3[3] && IR_Stage3[2]);
        multdiv multAndDiv(.data_operandA(multInA), .data_operandB(multInB), .ctrl_MULT(ctrl_MULT), .ctrl_DIV(ctrl_DIV), .clock(clock), .data_result(MultDivOut), .data_exception(MultDivExE), .data_resultRDY(MultDivFin));
        wire [31:0] storedIsn3;
        register multDataA(.data_In(datAAluIn), .data_Out(MultDataA), .clk(clock),.en(ctrl_MULT || ctrl_DIV),.clr(reset));
        register  multDataB(.data_In(BIntern2), .data_Out(MultDataB), .clk(clock),.en(ctrl_MULT || ctrl_DIV),.clr(reset));
        register  store(.data_In(IR_Stage3), .data_Out(storedIsn3), .clk(clock),.en(ctrl_MULT || ctrl_DIV),.clr(reset));
        assign multInA = (ctrl_MULT || ctrl_DIV) ? datAAluIn : MultDataA;
        assign multInB = (ctrl_MULT || ctrl_DIV) ? BIntern2 : MultDataB;
        alu ALU(.data_operandA(datAAluIn), .data_operandB(AluInB), .ctrl_ALUopcode(ALUOpIn), .ctrl_shiftamt(IR_Stage3[11:7]), .data_result(ALU_Output), .isNotEqual(nEQ), .isLessThan(LT), .overflow(AluOver));

        branchCtrl brnchctrl(.IR_Stage3(IR_Stage3), .nEQ(nEQ), .LT(LT), .shouldBranch(shldBrnch), .newPC(branchPC), .branchIsn(branchIsn), .Stage3PC(PC_Stage3), .signExtended(extended));

        adc_test ADC(.determine_transistor(extended[2:0]), .determine_resistor(extended[1:0]), .dc_input_one(transistors), .dc_input_two(resistors), .clk(clock), .regTrigger(regTrigger), .regTrigger_two(regTrigger_two), .clk_out(clk_adc), .address_one(address_transistors), .address_two(address_resistors), .output_transistor(output_transistors), .output_resistor(output_resistors));
        servoController servos(.clck(clock),.IR(IR_Stage3),.DataA(datAAluIn),.DataB(AluInB),.Direction1(directions[1:0]),.Direction2(directions[3:2]),.Direction3(directions[5:4]),.Direction4(directions[7:6]),.Signals(PMWOut),.reset(reset));

    wire flsh3;
    wire [31:0] stage3Out,Stage3Isn;

    assign stage3Out = (IR_Stage3[31:27] == 5'd13) ? output_resistors : ((IR_Stage3[31:27] == 5'd14) ? output_transistors : ((MultDivFin && IsMDOut)?  MultDivOut : ALU_Output));
    assign stage3Over = IsMDOut ? MultDivExE : AluOver;
    assign flsh3 = reset;
    assign Stage3Isn = isMDIN? 0 : (MultDivFin && IsMDOut) ? storedIsn3 : IR_Stage3;
    PipelineStage stage3(.DataIn_A(stage3Out),.DataIn_B(BIntern2),.PC_In(PC_Stage3),.IR_In(Stage3Isn),.DataOut_A(dataMemA),.DataOut_B(dataMemB),.PC_Out(PC_Stage4)
    ,.IR_Out(IR_Stage4),.clk(invertClock),.flush(flsh3), .ovf_In(OvfFlag), .ovf_Out(ovfStage4), .ovf_numIn(OvfValue), .ovf_numOut(OvfNumbStage4));
        wire BypassMemData;
        wire [31:0] memDataIn;
        assign memDataIn = BypassMemData? data_writeReg : dataMemB;
        assign address_dmem = dataMemA;
        assign data = memDataIn;
        assign wren = MemWrEn;
        Stage4Control ctrl4(.OpCode(IR_Stage4[31:27]),.wrEn(MemWrEn),.IR_Stage4(IR_Stage4),.IR_Stage5(IR_Stage5),.ByPassData(BypassMemData));

    PipelineStage stage4(.DataIn_A(dataMemA),.DataIn_B(q_dmem),.PC_In(PC_Stage4),.IR_In(IR_Stage4),.DataOut_A(WriteBackO),.DataOut_B(WriteBackD),.PC_Out(PC_Stage5),
    .IR_Out(IR_Stage5),.clk(invertClock),.flush(reset), .ovf_In(ovfStage4), .ovf_Out(ovfStage5) , .ovf_numIn(OvfNumbStage4), .ovf_numOut(OvfNumbStage5));
        wire jal5,sext;
        wire [4:0] ctrl_writeReg1;
        wire [31:0] data_writeReg1,data_writeReg2;
        wire [31:0] sextIsn;
        assign sext = (IR_Stage5[31:27] == 5'b10101);
        WriteEn EnableWriteBack(.Opcode(IR_Stage5[31:27]),.En(ctrl_writeEnable), .Lw(regMemFlag),.IR_Stage5(IR_Stage5),.jal(jal5), .sextIsn(sextIsn));
        mux_2 dataOrMem(.out(dataToReg),.select(regMemFlag), .in0(WriteBackO), .in1(WriteBackD));
        assign ctrl_writeReg1 = (ovfStage5 || sext)? 5'b11110: IR_Stage5[26:22];
        assign ctrl_writeReg = jal5? 5'b11111 : ctrl_writeReg1 ;
        assign data_writeReg1 = ovfStage5? OvfNumbStage5 : dataToReg;
        assign data_writeReg2 = sext? sextIsn: data_writeReg1;
        assign data_writeReg  = jal5? PC_Stage5 : data_writeReg2;
      
	
	/* END CODE */

endmodule
