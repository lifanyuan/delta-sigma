module enable(clk,rst_n,en_64,en_32,en_16,en_8);

input clk;
input rst_n;


output en_64;
output en_32;
output en_16;
output en_8;



reg[5:0]cnt_64;
reg[4:0]cnt_32;
reg[3:0]cnt_16;
reg[2:0]cnt_8;

reg en_64;
reg en_32;
reg en_16;
reg en_8;



//*************en_64************//
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    cnt_64<=0;
 else 
    cnt_64<=cnt_64+1;
end	 

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n) 
     en_64<=0;
 else if(cnt_64==6'd1)
     en_64<=1;
	  else
	  en_64<=0;
end
//*************en_32************//
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    cnt_32<=0;
 else 
    cnt_32<=cnt_32+1;
end	 

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n) 
     en_32<=0;
 else if(cnt_32==5'd1)
     en_32<=1;
	  else
	  en_32<=0;
end
//*************en_16************//
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    cnt_16<=0;
 else 
    cnt_16<=cnt_16+1;
end	 

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n) 
     en_16<=0;
 else if(cnt_16==4'd1)
     en_16<=1;
	  else
	  en_16<=0;
end
//*************en_8************//
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    cnt_8<=0;
 else 
    cnt_8<=cnt_8+1;
end	 

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n) 
     en_8<=0;
 else if(cnt_8==3'd1)
     en_8<=1;
	  else
	  en_8<=0;
end

endmodule