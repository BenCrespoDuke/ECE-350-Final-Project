module MoveMem(
    IR_In, DirIn, SpeedIn, Shift,clck,reset,dirOut
);
input [31:0] IR_In,DirIn;
input Shift,reset,clck;


register dir1(dirOut, data_Out, clck,en,clr);
register speed1(data_In, data_Out, clk,en,clr);
register dir1(data_In, data_Out, clk,en,clr);
register speed1(data_In, data_Out, clk,en,clr);
register dir1(data_In, data_Out, clk,en,clr);
register speed1(data_In, data_Out, clk,en,clr);
register dir1(data_In, data_Out, clk,en,clr);
register speed1(data_In, data_Out, clk,en,clr);
endmodule