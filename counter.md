## 13 May 2021
1. Write and RTL description for 4-bit loadable up counter and verify using testbench.
   1. Modify this for n-bit counter
2. Write a RTL to design 4-bit mod12 loadable up counter and verify using testbench.
3. Write and RTL design 4-bit loadable binary synchronous up down counter.
4. Write an RTL and testbench for SISO.

> # 2. Synchronous UP Counter

**Inputs**: Data_in, load, reset, clk  
**Outputs**: Data_out

```
always@(posedge clk)
    begin 
        if(rst)
            data_out <= 1'b0000;
        else if(load)
            data_out <= data_in;
        else
            data_out <= data_out + 1;
        end

task load_ip(input [3:0] j);
    begin
        @(negedge clk)
        load    = 1'b1;
        data_in = j;
        @(negedge clk)
        load    = 1'b0;
    end

initial begin
    initialization;
    reset;
    load_ip(4'b1001);
    #100 $finish;
```
- Modifying this for n-bit counter

```
up_counter #(parameter width = 4)
    input [width - 1: 0]data_in;

```

># 4. Write an RTL and testbench for SISO.

```
module d_ff(
    input d, clk,
    output reg q
);

    always@(posedge clk)
    begin
        q   <= d;
    end
endmodule

module siso(
    input ip, clk,
    output op
);

    wire w1, w2, w3;

    d_ff DFF1(ip, clk, w1);
    d_ff DFF2(w1, clk, w2);
    d_ff DFF3(w2, clk, w3);
    d_ff DFF4(w3, clk, op);

endmodule

```

**Testbench for SISO**
```
module siso_tb();

    reg ip, clk;
    output op;

    siso SISO(ip, clk, op);

    always
    begin
        #10 clk = 1'b1;
        #10 clk = 1'b0;
    end

    initial begin
        #10 ip = 1'b0;
        #10 ip = 1'b1;
        #10 ip = 1'b1;
        #10 ip = 1'b1;
        #10 ip = 1'b0;
        #10 ip = 1'b0;
        #10 ip = 1'b1;

        #150 $finish;
    end

    initial $monitor("clock=%d, input=%d, output=%d", clk, ip, op);

endmodule
```