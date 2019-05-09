`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/17 10:54:15
// Design Name: 
// Module Name: dsd_pcm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//`define SIMULATION

module dsd_pcm(
    input bclk,
    input clk_100,
    input data_in,
    input ws,
    input rst_n,
    output uart_tx,
    output modulator_out_L,
    output modulator_out_R
    );
// assign data_out_end_L_1=modulator_out_L;
 wire en_64,en_32,en_16,en_8;
// wire rst_n;
// assign rst_n=!rst;
// assign clk_out=bclk;
 enable enable(    .clk(bclk),
                   .rst_n(rst_n),
                         .en_64(en_64),
                         .en_32(en_32),
                         .en_16(en_16),
                         .en_8(en_8)
                  );   
wire[31:0]iis_pcm_out_L;
wire[23:0]iis_pcm_out_L_2;
wire[31:0]iis_pcm_out_R;///////////////////////
wire[23:0]iis_pcm_out_R_2;
wire[15:0]iis_pcm_out_L_3;

iis_pcm iis_pcm(        .bclk(bclk),
                        .clk(bclk),
                        .ws(ws),
                        .data_in(data_in),
                        .rst_n(rst_n),
                        .enable(en_32),
                        .data_out_L(iis_pcm_out_L),
                        .data_out_R(iis_pcm_out_R)
                   );                  
assign iis_pcm_out_L_2=iis_pcm_out_L[31:8];
assign iis_pcm_out_R_2=iis_pcm_out_R[31:8];
assign iis_pcm_out_L_3=iis_pcm_out_L[31:16];
wire [23:0]deal_pcm_out_L,deal_pcm_out_R;
`ifndef SIMULATION
deal_pcm deal_pcm_L(  .in(iis_pcm_out_L_2),//({iis_pcm_out_L_2[23],iis_pcm_out_L_2[23:1]}),
                        .clk(bclk),
                       .rst_n(rst_n),
                       .en_32(en_32),
                       .en_16(en_16),
                       .en_8(en_8),
                       .out(deal_pcm_out_L)
                  );
deal_pcm deal_pcm_R(  .in(iis_pcm_out_R_2),//({iis_pcm_out_L_2[23],iis_pcm_out_L_2[23:1]}),
                          .clk(bclk),
                         .rst_n(rst_n),
                         .en_32(en_32),
                         .en_16(en_16),
                         .en_8(en_8),
                         .out(deal_pcm_out_R)
                                    );
modulator_512 modulator_512_L( .in(deal_pcm_out_L),
                               .out(modulator_out_L),
                               .rst_n(rst_n),
                               .clk(bclk),
                               .enable(1'b1)
                             );    
modulator_512 modulator_512_R( .in(deal_pcm_out_R),
                            .out(modulator_out_R),
                            .rst_n(rst_n),
                            .clk(bclk),
                            .enable(1'b1)
                          );  
`endif
fft fft1(.clk_in(bclk),
        .clk_100(clk_100),
        .rst_n(rst_n),
        .pcm(iis_pcm_out_L_3),
        .uart_tx(uart_tx)
        );                    
//serial_send serial_send1(
//                              .clk(clk_100),
//                              .rst_n(rst_n),
//                              .uart_tx(uart_tx)
//                              );
endmodule
