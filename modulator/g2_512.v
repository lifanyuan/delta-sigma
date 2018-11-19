module g2_512(in,out);
input[40:0]in;
output[40:0]out;

assign out[40:0]={{15{in[40]}},in[40:15]};//>>15

endmodule

