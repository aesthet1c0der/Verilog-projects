module testbench();
  
    // Declare variables and nets for module ports
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0]sum;
    wire cout; 
  
    integer i, j; // used for verification
    
    // Instantiate the module
    ripple_adder_4bit_structural RIPPLE_ADD_4BIT(
        .a(a),
        .b(b),
        .carry_in(cin),
        .sum(sum),
        .carry_out(cout)
        );
  
    // Generate stimulus and monitor module ports
    initial begin
      $monitor("a=%b, b=%b, carry_in=%0b, sum=%0d, carry_out=%b", a, b, cin, sum, cout);
    end  
  
    initial begin
        #1; a = 4'b0000; b = 4'b0000; cin = 0;
        #1; a = 4'b0000; b = 4'b0000; cin = 1;
        #1; a = 4'b0001; b = 4'b0001; cin = 0;
        #1; a = 4'b0001; b = 4'b0001; cin = 1;
        #1; a = 4'd3;    b = 4'd6;    cin = 0;
        // Change the values of a and b and observe the effects
      
        for (i=0; i<2; i=i+1) begin
            for (j=0; j<2; j=j+1) begin
                #1 a = i; b = j; cin = 0;
            end
        end
        // Change the loops limits observe the effects

    end
  
endmodule


