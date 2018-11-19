module cicIP(in,enable,clk,out,rst_n);
input[23:0] in;
input enable;
input clk;
input rst_n;
output[23:0]out;

wire clken;
wire enable;
wire in_vaild;
wire out_vaild;
wire out_ready;
wire in_ready;
wire [1:0]in_error;
wire [1:0]out_error;


assign clken=enable;     //时钟允许信号
assign in_vaild=enable;    //输入数据有效信号
assign in_error=2'd0;
assign out_ready=1'b1;



//cic cic_1( .clk(clk),
//           .clken(clken),
//			  .reset_n(rst_n),
//			  .in_data(in),
//           .in_valid(in_vaild),
//           .out_ready(out_ready),
//           .in_error(in_error),
//			  .out_data(out),
//			  .in_ready(in_ready),
//			  .out_valid(out_vaild),
//			  .out_error(out_error)
//          );
cic cic_1 (
            .aclk(clk),                              // input wire aclk
            .aclken(clken),                          // input wire aclken
            .s_axis_data_tdata(in),    // input wire [23 : 0] s_axis_data_tdata
            .s_axis_data_tvalid(in_vaild),  // input wire s_axis_data_tvalid
            .s_axis_data_tready(in_ready),  // output wire s_axis_data_tready
            .m_axis_data_tdata(out),    // output wire [23 : 0] m_axis_data_tdata
            .m_axis_data_tvalid(out_vaild)  // output wire m_axis_data_tvalid
          );
endmodule