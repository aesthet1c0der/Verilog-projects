module testbench();
  
    // Declare variables and nets for module ports
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;  
  
    // Instantiate the module
    full_adder_dataflow FULL_ADD(
        .a(a),
        .b(b),
        .carry_in(cin),
        .sum(sum),
        .carry_out(cout)
        );
  
    // Generate stimulus and monitor module ports
    initial begin
      $monitor("a=%b, b=%b, carry_in=%0b, sum=%b, carry_out=%b", a, b, cin, sum, cout);
    end  
  
    initial begin // the same data as in the truth table
        #1; a = 0; b = 0; cin = 0;
        #1; a = 0; b = 0; cin = 1;
        #1; a = 0; b = 1; cin = 0;
        #1; a = 0; b = 1; cin = 1;
        #1; a = 1; b = 0; cin = 0;
        #1; a = 1; b = 0; cin = 1;
        #1; a = 1; b = 1; cin = 0;
        #1; a = 1; b = 1; cin = 1;
    end
  
endmodule