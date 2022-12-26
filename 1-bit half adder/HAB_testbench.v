module testbench();
  
    // Declare variables and nets for module ports
    reg a;
    reg b;
    wire sum;
    wire carry;  
  
    // Instantiate the module
    half_adder_behavioral HALF_ADD(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
        );
  
    // Generate stimulus and monitor module ports
    initial begin
        $monitor("a=%b, b=%b, sum=%b, carry=%b", a, b, sum, carry);
    end  
  
    initial begin
        #1; a = 0; b = 0;
        #1; a = 0; b = 1;
        #1; a = 1; b = 0;
        #1; a = 1; b = 1;
        #1; a = 0; b = 0;
        #1; a = 1; b = 1;
    end
  
endmodule