// 4-bit Single Input Single Output (SISO)

module siso(
	input 	i_clk,
	input 	i_d,
	input 	i_rst,
	output 	o_siso,
	output 	r_d0,
	output 	r_d1,
	output 	r_d2
);

	reg r_d3;
	reg r_d2;
	reg r_d1;
	reg r_d0;

	initial begin
		r_d2	<= 1'b0;
		r_d1	<= 1'b0;
		r_d0	<= 1'b0;
	end

	always @(posedge i_clk) begin
		if(!i_rst) begin
			r_d2	<= 1'b0;
			r_d1	<= 1'b0;
			r_d0	<= 1'b0;
		end

		else begin
			r_d0 	<= i_d;
			r_d1 	<= r_d0;
			r_d2 	<= r_d1;
			r_d3 	<= r_d2;
		end
	end

	assign o_siso = r_d3;

endmodule
