////////////////////////////////////////
// TESTBENCH
////////////////////////////////////////

`include "tff.v"

module tb_tff();

	parameter PERIOD = 10;
	parameter HP = PERIOD/2;

	reg 	clk;
	reg 	i_t;
	wire 	o_q;
	wire 	o_qbar;

	reg [1:0] i 	= 1'b0;

	always #HP clk++;

	initial begin 
		clk = 1'b0;
		i_t = 1'b0;
		for (i=0; i<4; i=i+1)
			#HP i_t = i[1];
	end

	tff TFLIPFLOP(
		.clk(clk),
		.i_t(i_t),
		.o_q(o_q),
		.o_qbar(o_qbar)
	);

	initial begin
		$dumpfile("tb_tff.vcd");
		$dumpvars(0,tb_tff);
	end

	initial begin
		$display("clk\ti_t\to_q\to_qbar");
		$monitor(clk,"\t",i_t,"\t",o_q,"\t",o_qbar);
		#40 $finish;
	end

endmodule
