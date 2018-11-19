module comparator_512(in,out);
input[40:0]in;
output[0:0]out;

assign  out=(in[40])?{1'b0}:{1'b1};

endmodule