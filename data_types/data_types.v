// Data Types in Verilog HDL

module data_types(); 

    /* 1-Nets 
    *  wire: it is driven continously by logic. The default value is "z" 
    *   - carry electrical signals from one module to next
    *   - do not store any data
    *   - they must be constantly supplied with a value or they will not contain a value
    *   - wires may not be the target of a blocking or sequential assignment
    *   - Left hand side in a continous concurrent is mostly a wire.
    *   - Wires are internal and also external
    *   They come in one of three variables:
    *       1) wire: these wires cary simple data from one port to another
    *       2) wor: these wires are logical OR of all input data values applied to the wire. These sythesize to OR gates with multiple input ports.
    *       3) wand: these wires are logical AND of all data values applied to the wire. These synthesise to AND gates with multiple input ports 
    *   - Can be assigned value with 'assign' keyword. 
    */

    wire a, b, c;       // a, b, c are wire type variables.
    assign c = a && b;  // bitwise AND  of 'a' and 'b' is stored in 'c'
    assign a = a | b;   // Circular assignments cannot be made possible using assign keyword, as this produces continous loop. Here the value of a is undefined because it depends on itself passed through combinational(i.e asynchronous) logic.
    
    // For wand and wor data types, all assignments to that wire are considered to be ports to logic gate. For instance,
    wire a, b, c;
    wor x;
    assign x = a;
    assign x = b;
    assign x = c;

    // is equivalent to this code
    wire a, b, c, x;
    assign x = (a | b | c);


    /* reg
     *  - A register, denoted with the keyword 'reg' is a memory storege location.
     *  - They store values without needing constant assignment, but they must be updated with blocking or sequential assignment.
     *  - Register values are all treated as being unsigned values, and any extension of a value into a larger register will not result in logical sign extension
     *  - can be used with "=" and "<="   
     *  - it is a variable which retains value till it is updated
     *  - its default value is 'z'
     *  - reg should be assigned on the left side of a procedural block
     */
    wire u, v; 
    reg x, y;
    assign x <= u + v;
    assign y = u + v;
    /* 
     * Blocking Assignments:
     *  - Assignments with the "=" operator are blocking assignments, and they will be performed sequentially.
     * Non-Blocking Assignments:
        - Assignments with the "<=" operator are non blocking assignments, all the non-blocking assignments in a particular code block will begin at the same time.
     *  - The blocking will not terminate untill all the non-blocking assignments have completed
     */

    /* Vector
     * A vector is collection of variables denoted with same name but with different subscripts. 
     * example: [2:0]i;
     */
    assign y = i[2]^i[1];
    assign y = i[1]^i[2];

    /* Integer
     * - These are similar to registers, except they are treated implicitly as signed numbers.
     * - Can be logically sign extended on assignment.
     */
    integer a = 10;

    /* Real
     * A real number can be specified in one of the following two forms:
     * 1) Decimal notation: 2.0, 5.66, 1245.54, 0.1
     * 2) Scientific notation: 
     *      214_5.1e2       214510 (Underscores are ignored)
     *      3.6e2           360.0 (e and E are same)
     *      8E-6            0.000008
     */
    real r = 554e4;

    /*
     * Parameter
     *  - A parameter is similar to identifiers in C.
     *  - Used to declare a global constant
     */
    parameter u = 6;

    // Arrays
    /*
     * Busses 
     *  - Register and arrays can be declared as multi-bit buses.
     *  - Ths assignment is using the made in the variable declaration using the [] operator.
     */
    wire [5:0] a;  //This declares a to be bus of 6 wires with bit-5 being MSB and bit-0 being LSB.

    /*
     * Bit Selection
     * The individual wires or registers in a bus can be interfaced directly, and subsets of the bus can be manipulated
     */
    wire [15:0] a;                  //Bus declaration
    assign a[14] = 1'b1;            //assign value 1 to bit-14 of the bus
    assign a[7:0] = 8'b01101110;    //assig 01101110 to the lower 8 bits of the bus
    // Likewise we can read from one part of the bus to another part. 
    wire [7:0] b;
    assign b[7:0] = a[15:8];    //assign the 8-bit bus b to be the upper 8 bits of the 16-bit bus
    // Part select operators let the compiler calculate the range based on a starting and a data-width size
    assign b[7:0] = a[8+:8];    //equivalent
    assign b[7:0] = a[15-:8];   //equivalent 

endmodule