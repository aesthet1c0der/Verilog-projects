`timescale 1us/1ns
module tb_ALU();
    parameter BUS_WIDTH = 8;
    reg  [3:0] opcode;
    reg [BUS_WIDTH-1:0] a, b;
    reg carry_in;
    wire [BUS_WIDTH-1:0] y;
    wire carry_out;
    wire borrow;
    wire zero;
    wire parity;
    wire invalid_op; 
    ALU
    #(.BUS_WIDTH(BUS_WIDTH))
    ALU0
   (.a(a),
   .b(b),
   .carry_in(carry_in),
   .opcode(opcode),
   .y(y),
   .carry_out(carry_out),
   .borrow(borrow),
   .zero(zero),
   .parity,
   .invalid_op(invalid_op));
    initial begin
        $monitor($time, " opcode = %d, a = %d, b = %d, y = %d, carry_out=%b, borrow=%b, zero=%b, parity=%b, invalid_op=%b", 
	                  opcode, a, b, y, carry_out, borrow, zero, parity, invalid_op);
        #1; opcode = 0; // 
        // Test OP_ADD
        #1 opcode = 1; a = 9; b = 33; carry_in = 0; 
        // Test OP_ADD_CARRY
        #1 opcode = 2; a = 9; b = 33; carry_in = 1; 
        // Test OP_SUB
        #1 opcode = 3; a = 65; b = 64; carry_in = 0; 
        #1 opcode = 3; a = 65; b = 66; carry_in = 0; 
        // Test OP_INC
        #1 opcode = 4; a = 233; b = 69; carry_in = 1; 
        // Test OP_DEC
        #1 opcode = 5; a = 0; b = 3; carry_in = 0; 
        // Test OP_AND
        #1 opcode = 6; a = 8'b0000_0010; b = 8'b0000_0011; 
        // Test OP_NOT
        #1 opcode = 7; a = 8'b1111_1111;  
        // Test OP_ROL
        #1 opcode = 8; a = 8'b0000_0001; 
        // Test OP_ROR
        #1 opcode = 9; a = 8'b1000_0000;
        #1 $stop;
    end
  
endmodule 
