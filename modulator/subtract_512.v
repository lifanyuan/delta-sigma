module subtract_512(in_1,in_2,out);
input[40:0]in_1;
input[40:0]in_2;
output[40:0]out;

assign out[40:0]=in_1[40:0]-in_2[40:0];

endmodule