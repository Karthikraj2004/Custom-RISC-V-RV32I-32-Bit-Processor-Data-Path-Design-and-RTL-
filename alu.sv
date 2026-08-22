typedef enum logic [2:0] {
    ALU_ADD = 3'b000,
    ALU_SUB = 3'b001,
    ALU_AND = 3'b010,
    ALU_OR  = 3'b011
} alu_op_t; // "_t" stands for type

module ALU_design (
    input  alu_op_t      alu_Op,
    input  logic [31:0]  reg1,
    input  logic [31:0]  reg2,
    output logic [31:0]  alu_result,
    output logic         zero_flag
);

    always_comb begin
        alu_result = '0; // Default value to prevent latch creation

        case (alu_Op)
            ALU_ADD: begin
                alu_result = reg1 + reg2;
            end

            ALU_SUB: begin
                alu_result = reg1 - reg2;
            end

            ALU_AND: begin
                alu_result = reg1 & reg2;
            end

            ALU_OR: begin
                alu_result = reg1 | reg2;
            end

            default: begin
                alu_result = '0;
            end
        endcase
    end

    assign zero_flag = (alu_result == '0);

endmodule