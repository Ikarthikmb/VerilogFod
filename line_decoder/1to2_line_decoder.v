/*
 * 	LINE DECODER
 *
 * A decoder is a circuit that changes a code into a set of signals. 
 * Lets begin to study and design a line decoder which is a common type of decoder wit n-digit binary number and 2^n data lines.
 *
 * Truth table:
 * A	| D1	| D0
 * ---	| ---	| ---
 * 0	| 0	| 1
 * 1	| 1	| 0
 *
 * 'A' is the address and 'D' is the dataline. D0 is 'NOT A' and D1 is 'A'.
 *
 * Written by: DraKo
 * Date created: 01-05-2021
 */
 
 module line_decoder();
 	reg a = 0;
 	wire d0, d1;
 	
 	assign d0 = ~a;
 	assign d1 = a;
 	
 	always
 		#10 a = ~a;
 	
 	initial begin
 		#10
 		$monitor("a=%b, d1=%b, d0=%b", a, d1,d0);
 		$dumpfile("1to2linedecoder.vcd");
 		$dumpvars(0, line_decoder);
 	#110 $finish;
 	
 	end
 	
 endmodule
