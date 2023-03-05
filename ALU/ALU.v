module ALU
    #( parameter BUS_WIDTH = 8)
    (input [BUS_WIDTH-1:0] a,
     input [BUS_WIDTH-1:0] b,
     input carry_in,
     input [3:0] opcode,
     output reg [BUS_WIDTH-1:0] y,
     output reg carry_out,
     output reg borrow,
     output zero,
     output parity,
     output reg invalid_op);
    localparam OP_ADD       = 1; 
    localparam OP_ADD_CARRY = 2; 
    localparam OP_SUB = 3;       
    localparam OP_INC = 4;       
    localparam OP_DEC = 5;       
    localparam OP_AND = 6;       
    localparam OP_NOT = 7;       
    localparam OP_ROL = 8;       
    localparam OP_ROR = 9;       
    always @(*) begin
        y = 0; carry_out = 0; borrow = 0; invalid_op = 0;
        case (opcode)
            OP_ADD        :  begin y = a + b; end
            OP_ADD_CARRY  :  begin {carry_out, y} = a + b + carry_in; end
            OP_SUB        :  begin {borrow, y} = a - b; end
            OP_INC        :  begin {carry_out, y} = a + 1'b1; end
            OP_DEC        :  begin {borrow, y} = a - 1'b1; end
            OP_AND        :  begin y = a & b; end
            OP_NOT        :  begin y = ~a; end
            OP_ROL        :  begin y = {a[BUS_WIDTH-2:0], a[BUS_WIDTH-1]}; end
            OP_ROR        :  begin y = {a[0], a[BUS_WIDTH-1:1]}; end
            default: begin invalid_op = 1; y = 0; carry_out = 0; borrow = 0;  end
        endcase
    end
    assign parity = ^y;
    assign zero = (y == 0);
endmodule


