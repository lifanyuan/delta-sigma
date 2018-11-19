module deal_pcm(in,clk,rst_n,en_32,en_16,en_8,out);

input [23:0]in;
input clk;
input rst_n;
input en_32;
input en_16;
input en_8;

output [23:0]out;



wire [23:0]insert_pcm_1_out;
wire [23:0]insert_pcm_2_out;
wire [23:0]insert_pcm_3_out;
wire [23:0]cic_out;

assign out=cic_out;

			 

insert_pcm_1 insert_pcm_1(  .in(in),
                            .clk(clk),
									 .out(insert_pcm_1_out),
									 .rst_n(rst_n),
									 .enable(en_32)
								  );
insert_pcm_2 insert_pcm_2(  .in(insert_pcm_1_out),
                            .clk(clk),
									 .out(insert_pcm_2_out),
									 .rst_n(rst_n),
									 .enable(en_16)
								  );
insert_pcm_3 insert_pcm_3(  .in(insert_pcm_2_out),
                            .clk(clk),
									 .out(insert_pcm_3_out),
									 .rst_n(rst_n),
									 .enable(en_8)
								  );
cicIP cicIP(    .in(insert_pcm_3_out),
                .enable(1'b1),
					 .clk(clk),
					 .out(cic_out),
					 .rst_n(rst_n)
				);
endmodule