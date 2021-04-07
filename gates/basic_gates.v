// Implementation of Basic Gates
// which includes AND, OR, NAND, NOR, XOR, XNOR gates.
// 
// AND: Outputs HIGH when both inputs are HIGH.
// OR: Outputs LOW when both inputs are LOW.
// NAND: Outputs LOW when both inputs are HIGH.
// NOR: Outputs HIGH when both inputs are LOW.
// XOR: Outputs LOW when both the inputs are same.
// XNOR: Outputs HIGH when both inputs are same.
//
// Date created: 7 April 2021
// Author: DraKo
//

module basic_gates (A, B);

	input A, B;			// Defining the inputs A and B
	output o_and, o_or, o_nand;	// Defining outputs
	output o_nor, o_xor, o_xnor;	// Defining outputs

	assign o_and = A & B;			// AND operation
	assign o_or = A ^ B;			// OR operation
	assign o_nand = ~(A & B);		// NAND operation
	assign o_nor = ~(A ^ B);		// NOR operation
	assign o_xor = A * ~B + ~A * B;		// XOR operation
	assign o_xnor = A * B + ~A * ~B;	// XNOR operation

endmodule //end of the module
