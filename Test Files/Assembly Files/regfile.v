module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

	wire [31:0] wrtEn,RdRegA, RdRegB;
	wire [31:0] w0Out, w1Out, w2Out, w3Out, w4Out, w5Out, w6Out, w7Out, w8Out, w9Out, w10Out, w11Out, w12Out, w13Out, w14Out, w15Out, w16Out, w17Out, w18Out, w19Out, w20Out, w21Out, w22Out, w23Out, w24Out, w25Out, w26Out, w27Out, w28Out, w29Out, w30Out, w31Out;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31;

	Decoder32 wrtDecode(.out(wrtEn), .select(ctrl_writeReg));	
	Decoder32 rdADecoder(.out(RdRegA), .select(ctrl_readRegA));

	Decoder32 rdBDecoder(.out(RdRegB), .select(ctrl_readRegB));

	

	triState ttri0(w0Out,RdRegA[0],data_readRegA);
	triState ttri1(w1Out,RdRegA[1],data_readRegA);
	triState tri2(w2Out,RdRegA[2],data_readRegA);
	triState tri3(w3Out,RdRegA[3],data_readRegA);
	triState tri4(w4Out,RdRegA[4],data_readRegA);
	triState tri5(w5Out,RdRegA[5],data_readRegA);
	triState tri6(w6Out,RdRegA[6],data_readRegA);
	triState tri7(w7Out,RdRegA[7],data_readRegA);
	triState tri8(w8Out,RdRegA[8],data_readRegA);
	triState tri9(w9Out,RdRegA[9],data_readRegA);
	triState tri10(w10Out,RdRegA[10],data_readRegA);
	triState tri11(w11Out,RdRegA[11],data_readRegA);
	triState tri12(w12Out,RdRegA[12],data_readRegA);
	triState tri13(w13Out,RdRegA[13],data_readRegA);
	triState tri14(w14Out,RdRegA[14],data_readRegA);
	triState tri15(w15Out,RdRegA[15],data_readRegA);
	triState tri16(w16Out,RdRegA[16],data_readRegA);
	triState tri17(w17Out,RdRegA[17],data_readRegA);
	triState tri18(w18Out,RdRegA[18],data_readRegA);
	triState tri19(w19Out,RdRegA[19],data_readRegA);
	triState tri20(w20Out,RdRegA[20],data_readRegA);
	triState tri21(w21Out,RdRegA[21],data_readRegA);
	triState tri22(w22Out,RdRegA[22],data_readRegA);
	triState tri23(w23Out,RdRegA[23],data_readRegA);
	triState tri24(w24Out,RdRegA[24],data_readRegA);
	triState tri25(w25Out,RdRegA[25],data_readRegA);
	triState tri26(w26Out,RdRegA[26],data_readRegA);
	triState tri27(w27Out,RdRegA[27],data_readRegA);
	triState tri28(w28Out,RdRegA[28],data_readRegA);
	triState tri29(w29Out,RdRegA[29],data_readRegA);
	triState tri30(w30Out,RdRegA[30],data_readRegA);
	triState tri31(w31Out,RdRegA[31],data_readRegA);



	triState tri0B(w0Out,RdRegB[0],data_readRegB);
	triState tri1B(w1Out,RdRegB[1],data_readRegB);
	triState tri2B(w2Out,RdRegB[2],data_readRegB);
	triState tri3B(w3Out,RdRegB[3],data_readRegB);
	triState tri4B(w4Out,RdRegB[4],data_readRegB);
	triState tri5B(w5Out,RdRegB[5],data_readRegB);
	triState tri6B(w6Out,RdRegB[6],data_readRegB);
	triState tri7B(w7Out,RdRegB[7],data_readRegB);
	triState tri8B(w8Out,RdRegB[8],data_readRegB);
	triState tri9B(w9Out,RdRegB[9],data_readRegB);
	triState tri10B(w10Out,RdRegB[10],data_readRegB);
	triState tri11B(w11Out,RdRegB[11],data_readRegB);
	triState tri12B(w12Out,RdRegB[12],data_readRegB);
	triState tri13B(w13Out,RdRegB[13],data_readRegB);
	triState tri14B(w14Out,RdRegB[14],data_readRegB);
	triState tri15B(w15Out,RdRegB[15],data_readRegB);
	triState tri16B(w16Out,RdRegB[16],data_readRegB);
	triState tri17B(w17Out,RdRegB[17],data_readRegB);
	triState tri18B(w18Out,RdRegB[18],data_readRegB);
	triState tri19B(w19Out,RdRegB[19],data_readRegB);
	triState tri20B(w20Out,RdRegB[20],data_readRegB);
	triState tri21B(w21Out,RdRegB[21],data_readRegB);
	triState tri22B(w22Out,RdRegB[22],data_readRegB);
	triState tri23B(w23Out,RdRegB[23],data_readRegB);
	triState tri24B(w24Out,RdRegB[24],data_readRegB);
	triState tri25B(w25Out,RdRegB[25],data_readRegB);
	triState tri26B(w26Out,RdRegB[26],data_readRegB);
	triState tri27B(w27Out,RdRegB[27],data_readRegB);
	triState tri28B(w28Out,RdRegB[28],data_readRegB);
	triState tri29B(w29Out,RdRegB[29],data_readRegB);
	triState tri30B(w30Out,RdRegB[30],data_readRegB);
	triState tri31B(w31Out,RdRegB[31],data_readRegB);















	register reg0(.data_In(32'b00000000000000000000000000000), .data_Out(w0Out), .clk(clock),.en(1'b0) ,.clr(ctrl_reset));
	
	and and1(w1,wrtEn[1],ctrl_writeEnable);
	register reg1(.data_In(data_writeReg), .data_Out(w1Out), .clk(clock), .en(w1),.clr(ctrl_reset));

	and and2(w2,wrtEn[2],ctrl_writeEnable);
	register reg2(.data_In(data_writeReg), .data_Out(w2Out), .clk(clock), .en(w2),.clr(ctrl_reset));

	and and3(w3,wrtEn[3],ctrl_writeEnable);
	register reg3(.data_In(data_writeReg), .data_Out(w3Out), .clk(clock),.en(w3),.clr(ctrl_reset));

	and and4(w4,wrtEn[4],ctrl_writeEnable);
	register reg4(.data_In(data_writeReg), .data_Out(w4Out), .clk(clock),.en(w4),.clr(ctrl_reset));

	and and5(w5,wrtEn[5],ctrl_writeEnable);
	register reg5(.data_In(data_writeReg), .data_Out(w5Out), .clk(clock),.en(w5),.clr(ctrl_reset));

	and and6(w6,wrtEn[6],ctrl_writeEnable);
	register reg6(.data_In(data_writeReg), .data_Out(w6Out), .clk(clock),.en(w6),.clr(ctrl_reset));

	and and7(w7,wrtEn[7],ctrl_writeEnable);
	register reg7(.data_In(data_writeReg), .data_Out(w7Out), .clk(clock),.en(w7),.clr(ctrl_reset));

	and and8(w8,wrtEn[8],ctrl_writeEnable);
	register reg8(.data_In(data_writeReg), .data_Out(w8Out), .clk(clock),.en(w8),.clr(ctrl_reset));

	and and9(w9,wrtEn[9],ctrl_writeEnable);
	register reg9(.data_In(data_writeReg), .data_Out(w9Out), .clk(clock),.en(w9),.clr(ctrl_reset));

	and and10(w10,wrtEn[10],ctrl_writeEnable);
	register reg10(.data_In(data_writeReg), .data_Out(w10Out), .clk(clock),.en(w10),.clr(ctrl_reset));

	and and11(w11,wrtEn[11],ctrl_writeEnable);
	register reg11(.data_In(data_writeReg), .data_Out(w11Out), .clk(clock),.en(w11),.clr(ctrl_reset));

	and and12(w12,wrtEn[12],ctrl_writeEnable);
	register reg12(.data_In(data_writeReg), .data_Out(w12Out), .clk(clock),.en(w12),.clr(ctrl_reset));

	and and13(w13,wrtEn[13],ctrl_writeEnable);
	register reg13(.data_In(data_writeReg), .data_Out(w13Out), .clk(clock),.en(w13),.clr(ctrl_reset));

	and and14(w14,wrtEn[14],ctrl_writeEnable);
	register reg14(.data_In(data_writeReg), .data_Out(w14Out), .clk(clock),.en(w14),.clr(ctrl_reset));

	and and15(w15,wrtEn[15],ctrl_writeEnable);
	register reg15(.data_In(data_writeReg), .data_Out(w15Out), .clk(clock),.en(w15),.clr(ctrl_reset));

	and and16(w16,wrtEn[16],ctrl_writeEnable);
	register reg16(.data_In(data_writeReg), .data_Out(w16Out), .clk(clock),.en(w16),.clr(ctrl_reset));

	and and17(w17,wrtEn[17],ctrl_writeEnable);
	register reg17(.data_In(data_writeReg), .data_Out(w17Out), .clk(clock),.en(w17),.clr(ctrl_reset));

	and and18(w18,wrtEn[18],ctrl_writeEnable);
	register reg18(.data_In(data_writeReg), .data_Out(w18Out), .clk(clock),.en(w18),.clr(ctrl_reset));

	and and19(w19,wrtEn[19],ctrl_writeEnable);
	register reg19(.data_In(data_writeReg), .data_Out(w19Out), .clk(clock),.en(w19),.clr(ctrl_reset));

	and and20(w20,wrtEn[20],ctrl_writeEnable);
	register reg20(.data_In(data_writeReg), .data_Out(w20Out), .clk(clock),.en(w20),.clr(ctrl_reset));

	and and21(w21,wrtEn[21],ctrl_writeEnable);
	register reg21(.data_In(data_writeReg), .data_Out(w21Out), .clk(clock),.en(w21),.clr(ctrl_reset));

	and and22(w22,wrtEn[22],ctrl_writeEnable);
	register reg22(.data_In(data_writeReg), .data_Out(w22Out), .clk(clock),.en(w22),.clr(ctrl_reset));

	and and23(w23,wrtEn[23],ctrl_writeEnable);
	register reg23(.data_In(data_writeReg), .data_Out(w23Out), .clk(clock),.en(w23),.clr(ctrl_reset));

	and and24(w24,wrtEn[24],ctrl_writeEnable);
	register reg24(.data_In(data_writeReg), .data_Out(w24Out), .clk(clock),.en(w24),.clr(ctrl_reset));

	and and25(w25,wrtEn[25],ctrl_writeEnable);
	register reg25(.data_In(data_writeReg), .data_Out(w25Out), .clk(clock),.en(w25),.clr(ctrl_reset));

	and and26(w26,wrtEn[26],ctrl_writeEnable);
	register reg26(.data_In(data_writeReg), .data_Out(w26Out), .clk(clock),.en(w26),.clr(ctrl_reset));

	and and27(w27,wrtEn[27],ctrl_writeEnable);
	register reg27(.data_In(data_writeReg), .data_Out(w27Out), .clk(clock),.en(w27),.clr(ctrl_reset));

	and and28(w28,wrtEn[28],ctrl_writeEnable);
	register reg28(.data_In(data_writeReg), .data_Out(w28Out), .clk(clock),.en(w28),.clr(ctrl_reset));

	and and29(w29,wrtEn[29],ctrl_writeEnable);
	register reg29(.data_In(data_writeReg), .data_Out(w29Out), .clk(clock),.en(w29),.clr(ctrl_reset));

	and and30(w30,wrtEn[30],ctrl_writeEnable);
	register reg30(.data_In(data_writeReg), .data_Out(w30Out), .clk(clock),.en(w30),.clr(ctrl_reset));

	and and31(w31,wrtEn[31],ctrl_writeEnable);
	register reg31(.data_In(data_writeReg), .data_Out(w31Out), .clk(clock),.en(w31),.clr(ctrl_reset));
	// add your code here


endmodule
