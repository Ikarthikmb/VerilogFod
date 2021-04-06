// example 01 
// the example code is from nandland.com
//
module and_gate
	(
	input_1,
	input_2,
	and_result
	);

	initial
		begin
			input input_1;
			input input_2;
			output and_result;

			wire and_temp;
			
			assign and_temp = input_1 & input_2;
			assign and_result = and_temp;

			$display( and_result);
			$finish
		end

endmodule
