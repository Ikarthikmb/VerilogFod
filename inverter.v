module inverter();
	wire y;
	reg a = 0;
	
	assign y=~a;
	
	always
		#10 a = ~a;

	initial begin
		$monitor("a=%b, y=%b", a, y);
		$dumpfile("inverter.vcd");
		$dumpvars(0, inverter);
	#100 $finish;
	end
endmodule
