module b1_512(in,out);
input[23:0]in;
output[40:0]out;

wire[40:0]in_1;
wire[40:0]in_2;
wire[40:0]in_3;

//25+1位整数,16位小数
assign in_1[40:0]={{5{in[23]}},in[23:0],{12{1'b0}}};//>>4
assign in_2[40:0]={{7{in[23]}},in[23:0],{10{1'b0}}};//>>6
assign in_3[40:0]={{10{in[23]}},in[23:0],{7{1'b0}}};//>>9

assign out[40:0]=in_1[40:0]+in_2[40:0]+in_3[40:0];
endmodule