module iis_pcm(bclk,clk,ws,data_in,rst_n,enable,data_out_L,data_out_R);

input bclk;
input clk;
input ws;
input data_in;
input enable;
input rst_n;

output [31:0]data_out_L;
output [31:0]data_out_R;

wire[31:0]data_out_L;
wire[31:0]data_out_R;

wire clk;

//***************************************
reg ws_1;
always @(posedge bclk or negedge rst_n)
begin
    if(!rst_n)
	 ws_1<=0;
	 else
	 ws_1<=ws;
end
//***********************************
reg[31:0]data_L_temp_1;
reg[31:0]data_R_temp_1;
always @(posedge bclk or negedge rst_n)
begin
  if(!rst_n) begin
  data_L_temp_1<=0;
  data_R_temp_1<=0; 
  end
  else if(ws_1==0) begin
	 data_L_temp_1[31:0]<={data_L_temp_1[30:0],data_in};
	 end
  else if(ws_1==1) begin
    data_R_temp_1[31:0]<={data_R_temp_1[30:0],data_in}; 
	 end
end
//***********************************
reg [5:0]cnt_L,cnt_R;
reg cnt_en_L,cnt_en_R;
reg rd_en_L,rd_en_R;
reg wr_en_L,wr_en_R;
wire [5:0]wrusedw_L,wrusedw_R;
wire [5:0]rdusedw_L,rdusedw_R;
/*************left*********************/
always @(posedge bclk or negedge rst_n)//generate a pulse at any time when ws_1=1
begin
  if(!rst_n)
  cnt_L<=0;
  else if(ws_1==1)
  cnt_L<=cnt_L+1;
  else if(ws_1==0)
  cnt_L<=0;
end
always @(posedge bclk or negedge rst_n)
begin
  if(!rst_n)
  cnt_en_L<=0;
  else if(cnt_L==6'd15)
  cnt_en_L<=1;
  else
  cnt_en_L<=0;
end
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n) 
  rd_en_L<=0;
  else if(rdusedw_L>=6'd1)
  rd_en_L<=1;
  else 
  rd_en_L<=0;
end

always @(posedge bclk or negedge rst_n)
begin
  if(!rst_n)
  wr_en_L<=0;
  else if(wrusedw_L>=6'd32)
  wr_en_L<=0;
  else
  wr_en_L<=1;
end 
/**************right*******************/
always @(posedge bclk or negedge rst_n)//generate a pulse at any time when ws_1=0
begin
  if(!rst_n)
  cnt_R<=0;
  else if(ws_1==0)
  cnt_R<=cnt_R+1;
  else if(ws_1==1)
  cnt_R<=0;
end
always @(posedge bclk or negedge rst_n)
begin
  if(!rst_n)
  cnt_en_R<=0;
  else if(cnt_R==6'd15)
  cnt_en_R<=1;
  else
  cnt_en_R<=0;
end
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n) 
  rd_en_R<=0;
  else if(rdusedw_R>=6'd1)
  rd_en_R<=1;
  else 
  rd_en_R<=0;
end
always @(posedge bclk or negedge rst_n)
begin
  if(!rst_n)
  wr_en_R<=0;
  else if(wrusedw_R>=6'd32)
  wr_en_R<=0;
  else
  wr_en_R<=1;
end 

//fifo_pcm_L fifo_L(  .aclr(~rst_n),
//                .data(data_L_temp_1),
//	             .rdclk(clk),
//	             .rdreq(enable&rd_en_L),
//	             .wrclk(bclk),
//	             .wrreq(cnt_en_L&wr_en_L),
//	             .q(data_out_L),
//	             .wrusedw(wrusedw_L),
//					 .rdusedw(rdusedw_L)
//				 );
fifo_pcm_L fifo_L (
                   .rst(~rst_n),                      // input wire rst
                   .wr_clk(bclk),                // input wire wr_clk
                   .rd_clk(clk),                // input wire rd_clk
                   .din(data_L_temp_1),                      // input wire [31 : 0] din
                   .wr_en(cnt_en_L&wr_en_L),                  // input wire wr_en
                   .rd_en(enable&rd_en_L),                  // input wire rd_en
                   .dout(data_out_L),                    // output wire [31 : 0] dout
                   .full(),                    // output wire full
                   .empty(),                  // output wire empty
                   .rd_data_count(rdusedw_L),  // output wire [5 : 0] rd_data_count
                   .wr_data_count(wrusedw_L)  // output wire [5 : 0] wr_data_count
                 );
fifo_pcm_L fifo_R (
                    .rst(~rst_n),                      // input wire rst
                    .wr_clk(bclk),                // input wire wr_clk
                    .rd_clk(clk),                // input wire rd_clk
                    .din(data_R_temp_1),                      // input wire [31 : 0] din
                    .wr_en(cnt_en_R&wr_en_R),                  // input wire wr_en
                    .rd_en(enable&rd_en_R),                  // input wire rd_en
                    .dout(data_out_R),                    // output wire [31 : 0] dout
                    .full(),                    // output wire full
                    .empty(),                  // output wire empty
                    .rd_data_count(rdusedw_R),  // output wire [5 : 0] rd_data_count
                    .wr_data_count(wrusedw_R)  // output wire [5 : 0] wr_data_count
                                  );
 

endmodule