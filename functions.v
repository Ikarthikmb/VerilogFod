module logic_function ();
	reg a = 0, b = 0;
	wire f;

	assign f = a & ~b | ~a & b;
	
	always
		#10 a = ~a;

	always
		#20 b = ~b;

	initial begin
		$monitor("a=%b, b=%b, f=%b", a,b,f);
		$dumpfile("functions.vcd");
		$dumpvars(0, logic_function);

		#100 $finish;
	end
endmodule
