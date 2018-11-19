module integrator_512(in,out,clk,rst_n,enable);
input[40:0]in;
output[40:0]out;
input rst_n;
input clk;
input enable;

reg[40:0]a;
wire[40:0]out;

assign out=a;

always@(posedge clk or negedge rst_n)
begin
if(!rst_n)
begin
    a<=41'd0;
end
else if(enable)
begin
     a<=a+in;  
end
end

endmodule