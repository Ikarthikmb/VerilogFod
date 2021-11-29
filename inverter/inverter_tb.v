// Testbench declaration

`include "inverter.v"

module inverter_tb();
  wire y;
  reg  a = 0;

  always begin
    #10 a = ~a;   // assigning a = NOT a for every 10ns
  end

  initial begin
    $monitor("a=%d, y=%d", a, y); // Monitoring output
    $dumpfile("inverter_tb.vcd");     // storing generated values in vsd file
    $dumpvars(0, inverter_tb);
		#40 $finish;
  end

	inverter INVERTER(a,y);
endmodule
