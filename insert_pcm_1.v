module insert_pcm_1(in,clk,enable,rst_n,out);

input [23:0]in;
input clk;
input rst_n;
input enable;
output [23:0]out;

wire [23:0]data_temp_1;

neicha_pcm neicha_1(  .in(in),
                  .clk(clk),
						.rst_n(rst_n),
						.out(data_temp_1),
						.enable(enable)
					 );
halfbandIP_pcm_1 halfbandIP_1(    .in(data_temp_1),
                              .clk(clk),
										.out(out),
										.rst_n(rst_n),
										.enable(enable)
									);

endmodule