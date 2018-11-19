module a1_512(in,out);
input[40:0]in;
output[40:0]out;

wire[40:0]in_1;
wire[40:0]in_2;
wire[40:0]in_3;

assign in_1[40:0]={{4{in[40]}},in[40:4]};//>>4
assign in_2[40:0]={{6{in[40]}},in[40:6]};//>>6
assign in_3[40:0]={{9{in[40]}},in[40:9]};//>>9

assign  out[40:0]=in_1[40:0]+in_2[40:0]+in_3[40:0];

endmodule