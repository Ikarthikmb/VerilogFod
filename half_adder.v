///////////////////////////////////////////////////////////////////////////////
// File Downloaded from http://www.nandland.com
///////////////////////////////////////////////////////////////////////////////
module half_adder 
  (
   i_bit1,
   i_bit2,
   o_sum,
   o_carry
   );
 
  input  i_bit1;
  input  i_bit2;
  output o_sum;
  output o_carry;
 
  assign o_sum   = i_bit1 ^ i_bit2;  // bitwise xor
  assign o_carry = i_bit1 & i_bit2;  // bitwise and
  
  initial begin
		$monitor("sum=%b, carry=%b", o_sum, o_carry);
		$dumpfile("half_adder.vcd");
		$dumpvars(0, half_adder);
	#50 $finish;
	end 

endmodule // half_adder
