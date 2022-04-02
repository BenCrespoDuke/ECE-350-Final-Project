module mux_230bit(out, select, in0, in1);
    input select;
    input[30:0] in0, in1;
    output[30:0] out;
    assign out = select ? in1 : in0;
endmodule