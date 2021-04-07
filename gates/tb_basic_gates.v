// Testbench for AND gate

`timescale 1ns / 1ns
`include "basic_gates.v"	// Loading the main file

module tb_basic_gates;		// Defining a module 

reg A, B;			// Defining input ports
wire o_and, o_or, o_nand;	// Defining output ports
wire o_nor, o_xor, o_xnor;	// Defining output ports

basic_gates basic_gates(A, B);	// Calling the main function

initial begin
 
 $dumpfile("basic_gates.vcd");
 $dumpvars(0, tb_basic_gates);
 
 #20		// 20ns delay
 
 {A, B} = 2'b00; #20;	// A = 0, B = 0
 {A, B} = 2'b01; #20;	// A = 0, B = 1
 {A, B} = 2'b10; #20;	// A = 1, B = 0
 {A, B} = 2'b11; #20;	// A = 1, B = 1

 $display("Test complete");

end

endmodule
