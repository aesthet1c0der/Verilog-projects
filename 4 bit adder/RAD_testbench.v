module RAD_testbench();
  
    // Declare variables and nets for module ports
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0]sum;
    wire cout; 
  
    integer i, j; // used for verification
    parameter LOOP_LIMIT=4;
    // Instantiate the module
    ripple_adder_4bit_dataflow RIPPLE_ADD_4BIT(
        .a(a),
        .b(b),
        .carry_in(cin),
        .sum(sum),
        .carry_out(cout)
        );
  
    // Generate stimulus and monitor module ports
    always@(*) begin
      $monitor("a=%b, b=%b, carry_in=%0b, sum=%0d, carry_out=%b", a, b, cin, sum, cout);
    end  
  
    initial begin
        // Change the values of a and b and observe the effects
        for (i=0; i<2; i=i+1) begin
            for (j=0; j<2; j=j+1) begin
                #1 a = i; b = j; cin = 0;
            end
        end
        // Change the loops limits observe the effects

    end
  
endmodule