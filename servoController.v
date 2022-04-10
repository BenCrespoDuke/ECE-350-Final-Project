module servoController(clck,IR,DataA,DataB,Direction1,Direction2,Direction3,Direction4,Signals,reset);

input clck,reset;
input [31:0] DataA,DataB,IR;
output [1:0] Direction1,Direction2,Direction3,Direction4;
output [3:0] Signals;

wire isSpIsn,shouldChangeDir;
wire [31:0] speedIn,directionNumb,directionIn,MemTime,MemDir;
wire [31:0] DutyCycle;
wire [31:0] timeLim,TimeAjust,TimeIn;

wire finishMove;
assign isSpIsn = (IR[31:27] == 5'b01001);
assign speedIn = 1900*DataB;
assign TimeAjust = DataA*5;
register speedReg(.data_In(speedIn), .data_Out(DutyCycle), .clk(clck),.en(isSpIsn),.clr(reset));
wire [31:0] countIn,currentCount;
assign shouldChangeDir = (IR[31:27] == 5'b01010) || finishMove;
assign TimeIn = (IR[31:27] == 5'b01010)? TimeAjust: MemTime;
assign directionIn =  (IR[31:27] == 5'b01010)? DataB: MemDir;
register directionReg(.data_In(directionIn), .data_Out(directionNumb), .clk(clck),.en(shouldChangeDir || currentCount == 0),.clr(reset));
register timingReg(.data_In(TimeIn), .data_Out(timeLim), .clk(clck),.en(shouldChangeDir || currentCount == 0),.clr(reset));



dffe_ref dflip(.q(finishMove),.d(currentCount>timeLim && timeLim!=0),.clk(!clck), .en(1'b1),.clr(reset));
register counting(.data_In(countIn), .data_Out(currentCount), .clk(clck),.en(1'b1),.clr(reset || finishMove));
assign countIn =  currentCount + 32'd1;
//assign finishMove = currentCount > timeLim ;

assign Direction1 = (directionNumb == 2 || directionNumb == 3)? 2'b01 : ( (directionNumb == 1 || directionNumb == 4)? 2'b10 : 2'b00 );
assign Direction2 = (directionNumb == 2 || directionNumb == 3)? 2'b01 : ( (directionNumb == 1 || directionNumb == 4)? 2'b10 : 2'b00 );
assign Direction3 = (directionNumb == 1 || directionNumb == 3)? 2'b10 : ( (directionNumb == 2 || directionNumb == 4)? 2'b01 : 2'b00 );
assign Direction4 = (directionNumb == 1 || directionNumb == 3)? 2'b10 : ( (directionNumb == 2 || directionNumb == 4)? 2'b01 : 2'b00 );

wire signalTemp;
assign Signals[0] = signalTemp;
assign Signals[1] = signalTemp;
assign Signals[2] = signalTemp;
assign Signals[3] = signalTemp;
servo signalCreator(.signal(signalTemp), .clk(clck), .en(directionNumb!=0), .duty(DutyCycle));
//servo(signal, clk, en, duty);
//servo(signal, clk, en, duty );
//servo(signal, clk, en, duty);
MoveMem tempMemory(.IR_In(IR), .DirIn(DataB), .timeIn(TimeAjust), .shift(shouldChangeDir && !(IR[31:27] == 5'b01010)),.clck(clck),.reset(reset),.timeOut(MemTime), .dirOut(MemDir));

endmodule