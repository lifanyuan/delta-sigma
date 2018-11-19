module back_512(in,out);
input[0:0]in;

output[40:0]out;

assign out=(~in)?{{2{1'b1}},{22{1'b0}},1'b1,{16{1'b0}}}:{{2{1'b0}},{23{1'b1}},{16{1'b0}}};//16777215,小数点后16位

endmodule