module pattern_recognition(
  // Outputs
  counter,
  // Inputs
  clk, srst_n, din
);
  parameter s0 = 2'b00,
            s1 = 2'b01,
            s2 = 2'b10,
            s3 = 2'b11;

  input               clk;
  input               srst_n;
  input               din;

  // output logic [15:0] counter;	// for .sv
  output reg [15:0] counter;
  reg [1:0] state, next;
  
  always@(posedge clk) begin
    case(state)
      s0: begin
        if(!din)
          state <= s1;
        else
          state <= s0;
      end
      
      s1: begin
        if(din)
          state <= s2;
        else
          state <= s1;
      end
      
      s2: begin
        if(din)
          state <= s3;
        else
          state <= s1;
      end
      
      s3: begin 
        if(!din) begin
          state <= s1; 
          counter <= counter + 1'b1;
        end
        else
          state <= s0;
      end
    endcase
  end 
  
  always@(posedge clk) begin
    if(!srst_n) begin
      counter <= 16'b0;
      state <= s0;
    end
  end
endmodule  
