
`timescale 1us/1ns
module RAB_testbench();
  
    // Declare variables and nets for module ports
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0]sum;
    wire cout; 
  
    integer i, j; // used for verification
    parameter LOOP_LIMIT = 4;
  
    // Instantiate the module
    ripple_adder_4bit_behavioral ADD_4BIT(
        .a(a),
        .b(b),
        .carry_in(cin),
        .sum(sum),
        .carry_out(cout)
        );
  
    // Generate stimulus and monitor module ports
    initial begin     
        // Change the values of LOOP_LIMIT observe the effects      
        for (i=LOOP_LIMIT; i>0; i=i-1) begin
            for (j=LOOP_LIMIT; j>0; j=j-1) begin
                a = i; b = j; cin = i%2;
				#1;
				$display($time, " a=%0d, b=%0d, carry_in=%0b, sum=%0d, carry_out=%b", 
				                  a, b, cin, sum, cout);
            end
        end
		
	    #10; $stop;
    end
  
endmodule