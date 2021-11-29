// SISO TESTBENCH

`include "siso.v"

module tb_siso();
	
	parameter PERIOD 	= 10;
	parameter HP 			= PERIOD/2;
	parameter LEN 		= 4;		// Adjust this based on the length of the pattern

	reg 	i_clk;
	reg 	i_d;
	reg 	i_rst;
	wire 	o_siso;
	integer i;
	reg [LEN-1:0] pattern = 1101;		// Modify pattern here
	wire r_d0;
	wire r_d1;
	wire r_d2;

	always #HP i_clk <= ~i_clk;

	initial begin
		i_clk = 1'b1;
		i_d 	= 1'b0;
		i_rst = 1'b0;
		i_rst = 1'b1;

		for(i=0; i<LEN; i=i+1) 
			#PERIOD i_d = pattern[i];
		#PERIOD i_d = 1'b0;
	end

	/*/
	initial begin
		$display("time\td\to_siso");
		$monitor("%0t\t",$time,i_d,"\t",o_siso);
		#(2*LEN*PERIOD) $finish;
	end
	/*/

	initial begin
		$display("time\td\td0\td1\td2\to_siso");
		$monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,i_d,r_d0,r_d1,r_d2,o_siso);
		#(40+(LEN*PERIOD)) $finish;
	end

	initial begin
		$dumpfile("tb_siso.vcd");
		$dumpvars(0,tb_siso);
	end

	siso SISO(
		.i_clk(i_clk),
		.i_d(i_d),
		.i_rst(i_rst),
		.o_siso(o_siso),
		.r_d0(r_d0),
		.r_d1(r_d1),
		.r_d2(r_d2)
	);	
endmodule
