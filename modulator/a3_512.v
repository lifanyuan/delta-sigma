module a3_512(in,out);
input[40:0]in;
output[40:0]out;

wire[40:0]in_1;
wire[40:0]in_2;
wire[40:0]in_3;
wire[40:0]in_4;
wire[40:0]in_5;
wire[40:0]in_6;

assign in_1[40:0]={{3{in[40]}},in[40:3]};//>>3
assign in_2[40:0]={{4{in[40]}},in[40:4]};//>>4
assign in_3[40:0]={{6{in[40]}},in[40:6]};//>>6
assign in_4[40:0]={{7{in[40]}},in[40:7]};//>>7
assign in_5[40:0]={{8{in[40]}},in[40:8]};//>>8
assign in_6[40:0]={{14{in[40]}},in[40:14]};//>>14

assign  out[40:0]=in_1[40:0]+in_2[40:0]+in_3[40:0]+in_4[40:0]+in_5[40:0]+in_6[40:0];

endmodule