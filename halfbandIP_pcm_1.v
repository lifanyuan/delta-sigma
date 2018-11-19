module halfbandIP_pcm_1(in,clk,out,rst_n,enable);

input clk;
input rst_n;
input enable;
input[23:0] in;
output reg[23:0]out;

wire ast_sink_valid;
wire ast_source_valid,s_axis_data_tready;
wire [31:0] out_32;
//wire[1:0]ast_source_error;
//wire[1:0]ast_sink_error;
//assign out=out_32[23:0];//cut low bits***lfy
assign ast_sink_valid=enable;
//assign ast_sink_error=2'b00;
always@(*)//saturation cutting
begin
    if($signed(out_32)>$signed(32'd8388607))
        out=24'd8388607;
    else if($signed(out_32)<$signed(-32'd8388608))
        out=-24'd8388608;
    else 
        out=out_32[23:0];
end
//halfband_pcm_1 halfband_1_1( .clk(clk),
//                 .reset_n(rst_n),
//					  .ast_sink_data(in),
//	              .ast_sink_valid(ast_sink_valid),               
//	              .ast_sink_error(ast_sink_error),
//	              .ast_source_data(out),
//	              .ast_source_valid(ast_source_valid),
//	              .ast_source_error(ast_source_error)
//                );
halfband_pcm_1 halfband_1 (
                  .aclk(clk),                              // input wire aclk
                  .s_axis_data_tvalid(ast_sink_valid),  // input wire s_axis_data_tvalid
                  .s_axis_data_tready(s_axis_data_tready),  // output wire s_axis_data_tready
                  .s_axis_data_tdata(in),    // input wire [23 : 0] s_axis_data_tdata
                  .m_axis_data_tvalid(ast_source_valid),  // output wire m_axis_data_tvalid
                  .m_axis_data_tdata(out_32)    // output wire [31 : 0] m_axis_data_tdata
                );
endmodule