# Assignment 2 (Data Types)

**1. What is the value of y in binary format in below snippet?**
```
reg [5:0] y;
initial begin
    y = 'Ox2;
end
```
> Ans: `y = X`

**2. What us the value of b in the below snippet?**
```
integer b;
initial begin
    b = - 'd12/3;
end
```
> Ans: 1431655761

**3. What value is passed across the port b in the below snippet?**
```
module test(output [32:0] b);
    real  a = 14.5;
    assign b = a;
endmodule
```
> Ans: 15

**4. Find the value of the variab;e t at 1ns & 20ns respectively from the below snippet?**
```
time t;
initial begin
    #10 t = $time;
    #20;
end
```

> Ans: 
> - At 0ns t = x.
> - At 20 ns t = 10.

**5. Write an RTL snippet to initialize all the locations of an array of size: 10 x 8 to 0 at 0ms. Depth = 10, width = 8 bits.**  
Ans: 
```
input [7:0] array [9:0];
```

**6. What will be the value of parameter constant for the instance DUT in the top module from the below snippet?**
```
module test;
    parameter WIDTH = 8;
endmodule

module top;
    test #(16) DUT();
endmodule
```
> Ans: 16

**7. What is the bug in the following snippet?**
```
module test;
    parameter WIDTH = 8;
endmodule

module top;
    test DUT();
    initial 
        defparam DUT.WIDTH = 10;
endmodule
```
> Ans: bug is `initial` so remove it. correct code 
```
module top;
    test DUT();
    defparam DUT.WIDTH = 10;
endmodule
```

**8. What will be displayed in the console mode for the below snippet?**
```
reg [13*8:1]s;
initial begin
    s = "maven silicon";
    $display("Value = %s, s[104:65]);
end
```
> Ans: maven