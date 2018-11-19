module neicha_pcm(in,clk,rst_n,out,enable);

input[23:0]in;
input enable;
input clk;
input rst_n;
output[23:0]out;

reg state;
reg [23:0]out_temp;

always@(posedge clk or negedge rst_n)
if(!rst_n)
   begin
       state<=0;
		 out_temp<=0;
  end
 else if(enable)
   if(state==0)
	begin
	  out_temp<=in;
	  state<=1;
	 end
	else
	 begin
	   out_temp<=0;
		state<=0;
	  end
		
   assign out=out_temp;
	endmodule