typedef enum logic [6:0] {
    OP_R_TYPE = 7'b0110011,
    OP_I_TYPE = 7'b0010011,
    OP_LOAD   = 7'b0000011,
    OP_STORE  = 7'b0100011,
    OP_BRANCH = 7'b1100011
} opcode_t;


module CU (
    input opcode_t opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    output logic ALUSrc,
    output logic MemtoReg,
    output logic RegWrite,
    output logic MemRead,
    output logic MemWrite,
    output logic Branch,
    output logic Uses_rs2,
    output logic [2:0] ALUOp
);

    //opcode_t opcode_var;
    //opcode_var = opcode_t'(opcode);

    always_comb begin 
        RegWrite = 1'b0;
        ALUSrc   = 1'b0;
        MemtoReg = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        Branch   = 1'b0;
        Uses_rs2 = 1'b1;
        ALUOp = 3'b000; // Default ALU operation

        case (opcode)
            OP_R_TYPE: begin
                RegWrite = 1;

                unique case ({funct7, funct3})
                    {7'b0000000, 3'b000}: ALUOp = 3'b000; // ADD
                    {7'b0100000, 3'b000}: ALUOp = 3'b001; // SUB
                    {7'b0000000, 3'b111}: ALUOp = 3'b010; // AND
                    {7'b0000000, 3'b110}: ALUOp = 3'b011; // OR
                    default:             ALUOp = 3'b000;
                endcase
            end 

            OP_I_TYPE: begin
                RegWrite = 1;
                ALUSrc = 1;
                Uses_rs2 = 1'b0;
            end

            OP_LOAD: begin
                RegWrite = 1;
                ALUSrc = 1;
                MemtoReg = 1;
                MemRead = 1;
                Uses_rs2 = 1'b0;
            end

            OP_STORE: begin
                ALUSrc = 1;
                MemWrite = 1;
            end

            OP_BRANCH: begin
                ALUOp = 3'b001;
                Branch = 1;
            end
            
        endcase
    end

endmodule 



