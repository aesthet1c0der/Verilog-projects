module full_adder_behavioral(
    input a,     // always wire
    input b,
	input carry_in,
    output reg sum,  // reg becoz it is used in always procedure
    output reg carry_out
    );
	always @(a or b or carry_in) begin
	sum = a^b^carry_in;
	carry_out=(a&b)|(carry_in&(a^b));
	end
endmodule