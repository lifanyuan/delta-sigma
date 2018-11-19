module a5_512(in,out);
input[40:0]in;
output[40:0]out;

wire[40:0]in_1;
wire[40:0]in_2;


assign in_1[40:0]={{1{in[40]}},in[40:1]};//>>1
assign in_2[40:0]={{12{in[40]}},in[40:12]};//>>12


assign  out[40:0]=in_1[40:0]+in_2[40:0];

endmodule