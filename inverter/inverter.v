// Module initialization
module inverter(
  input   a,      // input declaration
  output  y       // output declaration
);
  assign y = ~a;  // Assigning output value
endmodule

// Testbench declaration
module inverter_tb();
  wire y;
  reg  a = 0;

  always begin
    #10 a = ~a;   // assigning a = NOT a for every 10ns
  end

  initial begin
    $monitor("a=%d, y=%d", a, y); // Monitoring output
    $dumpvars("inverter.vcd");     // storing generated values in vsd file
    $dumpvars(0, inverter);
  end
endmodule
