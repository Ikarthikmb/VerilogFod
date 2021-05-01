/*
 * 	LINE DECODER
 *
 * A decoder is a circuit that changes a code into a set of signals. 
 * Lets begin to study and design a 2 to 4 line decoder which has 2 input lines and 4 output lines
 *
 * Truth table:
 * A0	| A1	| D3	| D2	| D1	| D0
 * ---	| ---	| ---	| ---	| ---	| ---
 * 0	| 0	| 0	| 0	| 0	| 1
 * 0	| 1	| 0	| 0	| 1	| 0
 * 1	| 0	| 0	| 1	| 0	| 0
 * 1	| 1	| 1	| 0	| 0	| 0
 *
 * 'A0' and 'A1' are the address and D0, D1, D2, D3 are the datalines.
 *
 * Written by: DraKo
 * Date created: 01-05-2021
 */
 
 module line_decoder_3to4();
 	reg a0 = 0, a1 = 0;
 	wire d0, d1, d2, d3;
 	
 	assign d0 = ~a1 && ~a2;
 	assign d1 = ~a1 && a2;
 	assign d2 = a1 && ~a2;
 	assign d3 = a1 && a2;
 	
 	always
 		#10 a0 = ~a0;
 		#20 a1 = ~a1;
 	
 	initial begin
 		#10 ;//Delay of 10ns
 		$monitor("a1=%b, a0=%b, d3=%b, d2=%b, d1=%b, d0=%b", a1, a0, d3, d2, d1, d0);
 		$dumpfile("linedecoder2to4.vcd");
 		$dumpvars(0, line_decoder_2to4);
 	#200 $finish;
 	
 	end
 	
 endmodule
