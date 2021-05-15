# VerilogHDL | Assignment 3 (Operators)

**1. What is the value of y in the below snippet?**
```
reg [2:0] a, b;
reg y;

initial begin
    a = 3'd5;
    b = 3'b111;
    y = a && b;
end
```
Ans: 1

**2. What is the value of x in the below snippet?**
```
reg [2:0] a, b;
reg [2:0] x;

initial begin 
    a = 3'd5;
    b = 3'b111;
    x = a | b;
end
```
Ans: 7

**3. What is the value of x in the below snippet?**
```
reg [2:0] a;
reg [2:0] x;

initial begin 
    a = 3'd4;
    x = ^a;
end
```
Ans: 1

**4. What is the value of x in the below snippet?**
```
reg [3:0] a;
reg [1:0] x;

initial begin
    a = 4'd10;
    x = (a >> 1);
end
```
Ans: 1

**5. Find the of b in below snippet?**
```
reg [3:0] a;
reg [6:0] b;

initial begin
    a = 4'd10;
    b = {a,1};
end
```
Ans. 21

**6. Which block executes in the below snippet and justify the reason.**
```
reg [3:0] a = 4'b110x;
initial begin 
    if (a = 4'b1100)
        begin:B1
        end
    else
        begin:B2
        end
end
```
Ans: B1, because the input has a dont care(x) at one's place which could be either 0 or 1 and in the if statement executes if it has 4'b1100 so it's a validated as true and B1 runs.

**7. Which block executes in the below snippet and justify the reason**
```
reg [3:0] a == 4'b110x;
initial begin 
    if (a !== 4'b1100)
        begin:B1
        end
    else
        begin:B2
        end
end
```
Ans. B1 is executed 
<!--B2 will be executed. "if" is executed only when a is not equal to 4'b1100.-->

**8. Wha is the value of y in the below expression and justify the reason.**
```
reg [3:0] a = 4'b110x;
wire y = (a == 4'b1100) ?1'b1:1'b0;
```
Ans. z

**9. What is the value of y in the below expression and justify the reason.**
```
reg [3:0] a = 4'b010x;
wire y = (a ==4'b1100)? 1'b1:1'b0;
```
Ans. z

**10. What is the value of b in the below expression and justify the reason.**
```
reg [3:0] a = 4'b0100;
reg [3:0] b;

initial begin
    b = a + 1'bx;
end
```
Ans. b = x
