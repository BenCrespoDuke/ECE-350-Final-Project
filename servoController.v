module servoController(clck,IR,DataA,DataB,Direction1,Direction2,Direction3,Direction4,Signals,reset);

input clck,reset;
input [31:0] DataA,DataB,IR;
output [1:0] Direction1,Direction2,Direction3,Direction4;
output [3:0] Signals;

wire isSpIsn,shouldChangeDir;
wire [31:0] speedIn,directionNumb,directionIn;
wire [31:0] DutyCycle;
wire [31:0] timeLim,TimeAjust,TimeIn;
reg [31:0] counter = 32'b1;
reg finishMove = 1'b0;
assign isSpIsn = (IR[31:27] == 5'b01001);
assign speedIn = 1900*DataB;
//assign TimeAjust = DataA*50000 ;
register speedReg(.data_In(speedIn), .data_Out(DutyCycle), .clk(clck),.en(isSpIsn),.clr(reset));

assign shouldChangeDir = (IR[31:27] == 5'b01010);
//assign TimeIn = shouldChangeDir? TimeAjust: 32'b0;
assign directionIn = shouldChangeDir? DataB: 32'b0;
register directionReg(.data_In(DataB), .data_Out(directionNumb), .clk(clck),.en(shouldChangeDir || finishMove),.clr(reset));
//register timingReg(.data_In(TimeIn), .data_Out(timeLim), .clk(clck),.en(shouldChangeDir || finishMove),.clr(reset));

/*always @(negedge clck) begin
    

if(directionNumb != 0)begin
    if(shouldChangeDir == 1)begin
        counter = 32'b1;
        finishMove = 1'b0;
    end
    if(counter == timeLim ) begin
        finishMove = 1'b1;
        counter = 32'b1;
    end

    counter = counter+1;

end

end*/

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


endmodule