module ImmGen (
    input logic [31:0] instruction,
    output logic [31:0] imm
);

    typedef enum logic[6:0] {
        IMM_ADDI = 7'b0010011,
        IMM_LW  = 7'b0000011,
        IMM_SW  = 7'b0100011,
        IMM_BEQ = 7'b1100011
    } opcode_t;

    always_comb begin 
        opcode_t opcode_var;
        opcode_var = opcode_t'(instruction[6:0]);

        case(opcode_var)
            IMM_ADDI: begin
                imm = {{20{instruction[31]}}, instruction[31:20]}; // Sign-extend 12-bit immediate
            end

            IMM_LW: begin
                imm = {{20{instruction[31]}}, instruction[31:20]}; // Sign-extend 12-bit immediate
            end

            IMM_SW: begin
                imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // Sign-extend 12-bit immediate
            end

            IMM_BEQ: begin
                imm = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // Sign-extend 13-bit immediate and shift left by 1
            end

            default: begin
                imm = 32'b0; // Default case to prevent latches
            end
        endcase
    end

endmodule 

