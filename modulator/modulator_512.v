module modulator_512(in,out,rst_n,clk,enable);

input[23:0]in;
output[0:0]out;
input rst_n;
input clk;
input enable;

wire[40:0]a1_out;
wire[40:0]a2_out;
wire[40:0]a3_out;
wire[40:0]a4_out;
wire[40:0]a5_out;

wire[40:0]b1_out;

wire[40:0]c1_out;
wire[40:0]c2_out;
wire[40:0]c3_out;
wire[40:0]c4_out;
wire[40:0]c5_out;

wire[40:0]g1_out;
wire[40:0]g2_out;

wire[40:0]i1_out;
wire[40:0]i2_out;
wire[40:0]i3_out;
wire[40:0]i4_out;
wire[40:0]i5_out;

wire[40:0]sub1_out;
wire[40:0]sub2_out;
wire[40:0]sub3_out;
wire[40:0]sub4_out;
wire[40:0]sub5_out;
wire[40:0]sub6_out;
wire[40:0]sub7_out;

wire[40:0]out_back;

b1_512 b1_512_1(.in(in),.out(b1_out));
a1_512 a1_512_1(.in(out_back),.out(a1_out));
a2_512 a2_512_1(.in(out_back),.out(a2_out));
a3_512 a3_512_1(.in(out_back),.out(a3_out));
a4_512 a4_512_1(.in(out_back),.out(a4_out));
a5_512 a5_512_1(.in(out_back),.out(a5_out));

c1_512 c1_512_1(.in(i1_out),.out(c1_out));
c2_512 c2_512_1(.in(i2_out),.out(c2_out));
c3_512 c3_512_1(.in(i3_out),.out(c3_out));
c4_512 c4_512_1(.in(i4_out),.out(c4_out));
c5_512 c5_512_1(.in(i5_out),.out(c5_out));

g1_512 g1_512_1(.in(i3_out),.out(g1_out));
g2_512 g2_512_1(.in(i5_out),.out(g2_out));

subtract_512 subtract_512_1(.in_1(b1_out),.in_2(a1_out),.out(sub1_out));
subtract_512 subtract_512_2(.in_1(c1_out),.in_2(a2_out),.out(sub2_out));
subtract_512 subtract_512_3(.in_1(sub2_out),.in_2(g1_out),.out(sub3_out));
subtract_512 subtract_512_4(.in_1(c2_out),.in_2(a3_out),.out(sub4_out));
subtract_512 subtract_512_5(.in_1(c3_out),.in_2(a4_out),.out(sub5_out));
subtract_512 subtract_512_6(.in_1(sub5_out),.in_2(g2_out),.out(sub6_out));
subtract_512 subtract_512_7(.in_1(c4_out),.in_2(a5_out),.out(sub7_out));

integrator_512 integrator_512_1(.in(sub1_out),.out(i1_out),.clk(clk),.rst_n(rst_n),.enable(enable));
integrator_512 integrator_512_2(.in(sub3_out),.out(i2_out),.clk(clk),.rst_n(rst_n),.enable(enable));
integrator_512 integrator_512_3(.in(sub4_out),.out(i3_out),.clk(clk),.rst_n(rst_n),.enable(enable));
integrator_512 integrator_512_4(.in(sub6_out),.out(i4_out),.clk(clk),.rst_n(rst_n),.enable(enable));
integrator_512 integrator_512_5(.in(sub7_out),.out(i5_out),.clk(clk),.rst_n(rst_n),.enable(enable));

comparator_512 comparator_512_1(.in(c5_out),.out(out));
back_512 back_512_1(.in(out),.out(out_back));


endmodule
