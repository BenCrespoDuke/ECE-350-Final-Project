module Decoder32(out, select);

input [4:0] select;
output [31:0] out;
wire ns0,ns1,ns2,ns3,ns4;

not not1(ns0,select[0]);
not not2(ns1,select[1]);
not not3(ns2,select[2]);
not not4(ns3,select[3]);
not not5(ns4,select[4]);

and(out[0],ns0,ns1,ns2,ns3,ns4);
and(out[1],select[0],ns1,ns2,ns3,ns4);
and(out[2],ns0,select[1],ns2,ns3,ns4);
and(out[3],select[0],select[1],ns2,ns3,ns4);
and(out[4],ns0,ns1,select[2],ns3,ns4);
and(out[5],select[0],ns1,select[2],ns3,ns4);
and(out[6],ns0,select[1],select[2],ns3,ns4);
and(out[7],select[0],select[1],select[2],ns3,ns4);
and(out[8],ns0,ns1,ns2,select[3],ns4);
and(out[9],select[0],ns1,ns2,select[3],ns4);
and(out[10],ns0,select[1],ns2,select[3],ns4);
and(out[11],select[0],select[1],ns2,select[3],ns4);
and(out[12],ns0,ns1,select[2],select[3],ns4);
and(out[13],select[0],ns1,select[2],select[3],ns4);
and(out[14],ns0,select[1],select[2],select[3],ns4);
and(out[15],select[0],select[1],select[2],select[3],ns4);

and(out[16],ns0,ns1,ns2,ns3,select[4]);
and(out[17],select[0],ns1,ns2,ns3,select[4]);
and(out[18],ns0,select[1],ns2,ns3,select[4]);
and(out[19],select[0],select[1],ns2,ns3,select[4]);
and(out[20],ns0,ns1,select[2],ns3,select[4]);
and(out[21],select[0],ns1,select[2],ns3,select[4]);
and(out[22],ns0,select[1],select[2],ns3,select[4]);
and(out[23],select[0],select[1],select[2],ns3,select[4]);
and(out[24],ns0,ns1,ns2,select[3],select[4]);
and(out[25],select[0],ns1,ns2,select[3],select[4]);
and(out[26],ns0,select[1],ns2,select[3],select[4]);
and(out[27],select[0],select[1],ns2,select[3],select[4]);
and(out[28],ns0,ns1,select[2],select[3],select[4]);
and(out[29],select[0],ns1,select[2],select[3],select[4]);
and(out[30],ns0,select[1],select[2],select[3],select[4]);
and(out[31],select[0],select[1],select[2],select[3],select[4]);



endmodule

module decoder_3to8(decode_value, input_value, ctrl_enable);
    input [2:0] input_value;
    input ctrl_enable;
    reg [7:0] decode_values;
    output [7:0] decode_value;

    always @(posedge ctrl_enable) begin
        decode_values <= 8'b0;
        if(input_value == 0) begin
            decode_values[0] <= 1'b1;
        end
        else if(input_value == 1) begin
            decode_values[1] <= 1'b1;
        end
        else if(input_value == 2) begin
            decode_values[2] <= 1'b1;
        end
        else if(input_value == 3) begin
            decode_values[3] <= 1'b1;
        end
        else if(input_value == 4) begin
            decode_values[4] <= 1'b1;
        end
        else if(input_value == 5) begin
            decode_values[5] <= 1'b1;
        end
        else if(input_value == 6) begin
            decode_values[6] <= 1'b1;
        end
        else if(input_value == 7) begin
            decode_values[7] <= 1'b1;
        end
    end
endmodule
