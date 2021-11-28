////////////////////////////////////////
//
// T FLIP FLOP
//
// Port		| Type
// =======|=====
// clk		| input
// i_t		| input
// o_q		| output
// o_qbar	| output
//
// Truth Table
// Clock	| T	| Q	| Q'
// =======|=======|===
// 0			| 0	| 0	| 1
// 1			| 0	| 0	| 1
// 0			| 1	| 0	| 1
// 1			| 1	| 1	| 0
// 0			| 0	| 1	| 0
// 1			| 0	| 1	| 0
////////////////////////////////////////

module tff(
	input 	clk,
	input 	i_t,
	output	o_q,
	output	o_qbar
);
	reg	o_q = 1'b0;
	reg	o_qn = 1'b0;

	always@(posedge clk) begin
		if(!i_t)
			o_q <= o_q ;
		else
			o_q <= ~o_q;
	end

	assign o_qbar = ~o_q;
endmodule
