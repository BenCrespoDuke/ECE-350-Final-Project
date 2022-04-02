module Stage2Ctrl(IR_Stage1,isSW,jr,bexIsn);
    input [31:0] IR_Stage1;
    output [31:0] bexIsn;
    output isSW,jr;
    assign isSW = (!IR_Stage1[31] && !IR_Stage1[30] && IR_Stage1[29] && IR_Stage1[28] && IR_Stage1[27]) || (!IR_Stage1[31] && !IR_Stage1[30] && !IR_Stage1[29] && IR_Stage1[28] && !IR_Stage1[27]) || (!IR_Stage1[31] && !IR_Stage1[30] && IR_Stage1[29] && IR_Stage1[28] && !IR_Stage1[27]);
    assign jr = !IR_Stage1[31] && !IR_Stage1[30] && IR_Stage1[29] && !IR_Stage1[28] && !IR_Stage1[27];
    assign bexIsn[31:27] = 5'b00000;
    assign bexIsn[26:0] = IR_Stage1[26:0];
endmodule