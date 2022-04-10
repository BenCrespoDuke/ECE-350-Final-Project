module MoveMem(
    IR_In, DirIn, timeIn, shift,clck,reset,timeOut,dirOut
);
//Register file that store all loadMemory isntrictions when they are being called or to be inseerted in registers in "memory"
input [31:0] IR_In,DirIn,timeIn;
input shift,reset,clck;
output [31:0] timeOut, dirOut;

wire [31:0] DirIn1,DirIn2,DirIn3,DirIn4,DirIn5,DirIn6,DirIn7,DirIn8,dirOut,dirOut2,dirOut3,dirOut4,dirOut5,dirOut6,dirOut7,dirOut8;
wire [31:0] timeIn1,timeIn2,timeIn3,timeIn4,timeIn5,timeIn6,timeIn7,timeIn8,timeOut,timeOut2,timeOut3,timeOut4,timeOut5,timeOut6,timeOut7,timeOut8;
wire addIsn,clear;
reg [5:0] currentIn = 5'b0;
assign addIsn = (IR_In[31:27] == 5'b01011);
assign clear = IR_In[31:27] == 5'b01100;
register dir1(DirIn1, dirOut, clck,(shift ||currentIn == 0),reset || clear);
register dir2(DirIn2, dirOut2, clck,(shift ||currentIn == 1),reset || clear);
register dir3(DirIn3, dirOut3, clck,(shift ||currentIn == 2),reset || clear);
register dir4(DirIn4, dirOut4, clck,(shift ||currentIn == 3), reset || clear);
register dir5(DirIn5, dirOut5, clck,(shift ||currentIn == 4),reset || clear);
register dir6(DirIn6, dirOut6, clck,(shift ||currentIn == 5),reset || clear);
register dir7(DirIn7, dirOut7, clck,(shift ||currentIn == 6),reset || clear);
register dir8(DirIn8, dirOut8, clck,(shift ||currentIn == 7),reset || clear);

register speed1(timeIn1, timeOut, clck,(shift ||currentIn == 0),reset || clear);
register speed2(timeIn2, timeOut2, clck,(shift ||currentIn == 1),reset || clear);
register speed3(timeIn3, timeOut3, clck,(shift ||currentIn == 2),reset || clear);
register speed4(timeIn4, timeOut4, clck,(shift ||currentIn == 3),reset || clear);
register speed5(timeIn5, timeOut5, clck,(shift ||currentIn == 4),reset || clear);
register speed6(timeIn6, timeOut6, clck,(shift ||currentIn == 4),reset || clear);
register speed7(timeIn7, timeOut7, clck,(shift ||currentIn == 6),reset || clear);
register speed8(timeIn8, timeOut8, clck,(shift ||currentIn == 7),reset || clear);

assign DirIn1  = (shift == 1)? dirOut2 :((currentIn == 0)? DirIn : 32'b0);
assign DirIn2  = (shift == 1)? dirOut3 :((currentIn == 1)? DirIn : 32'b0);
assign DirIn3  = (shift == 1)? dirOut4 :((currentIn == 2)? DirIn : 32'b0);
assign DirIn4  = (shift == 1)? dirOut5 :((currentIn == 3)? DirIn : 32'b0);
assign DirIn5  = (shift == 1)? dirOut6 :((currentIn == 4)? DirIn : 32'b0);
assign DirIn6  = (shift == 1)? dirOut7 :((currentIn == 5)? DirIn : 32'b0);
assign DirIn7  = (shift == 1)? dirOut8 :((currentIn == 6)? DirIn : 32'b0);
assign DirIn8  = (currentIn == 7)? DirIn : 32'b0;


assign timeIn1  = (shift == 1)? timeOut2 :((currentIn == 0)? timeIn : 32'b0);
assign timeIn2  = (shift == 1)? timeOut3 :((currentIn == 1)? timeIn : 32'b0);
assign timeIn3  = (shift == 1)? timeOut4 :((currentIn == 2)? timeIn : 32'b0);
assign timeIn4  = (shift == 1)? timeOut5 :((currentIn == 3)? timeIn : 32'b0);
assign timeIn5  = (shift == 1)? timeOut6 :((currentIn == 4)? timeIn : 32'b0);
assign timeIn6  = (shift == 1)? timeOut7 :((currentIn == 5)? timeIn : 32'b0);
assign timeIn7  = (shift == 1)? timeOut8 :((currentIn == 6)? timeIn : 32'b0);
assign timeIn8  = (currentIn == 7)? timeIn : 32'b0;


always @(negedge clck) begin

    if(addIsn == 1'b1 &&  currentIn<7)begin
        currentIn = currentIn+1;
    end
    if(shift == 1 && currentIn!=0) begin
        currentIn = currentIn-1;
    end
    
end



endmodule