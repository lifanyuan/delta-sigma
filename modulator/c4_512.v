module c4_512(in,out);
input[40:0]in;
output[40:0]out;

wire[40:0]in_1;
wire[40:0]in_2;
wire[40:0]in_3;
wire[40:0]in_4;
wire[40:0]in_5;

assign in_1[40:0]={{1{in[40]}},in[40:1]};//>>1
assign in_2[40:0]={{4{in[40]}},in[40:4]};//>>4
assign in_3[40:0]={{7{in[40]}},in[40:7]};//>>7
assign in_4[40:0]={{10{in[40]}},in[40:10]};//>>10
assign in_5[40:0]={{13{in[40]}},in[40:13]};//>>13

assign  out[40:0]=in_1[40:0]+in_2[40:0]+in_3[40:0]+in_4[40:0]+in_5[40:0];

endmodule