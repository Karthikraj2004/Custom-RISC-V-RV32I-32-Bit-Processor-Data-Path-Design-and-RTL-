module ID_EX_Reg (
    input logic clk, rst, flush,
    input logic [31:0] pc_in, data1_in, data2_in, imm_in,
    input logic [4:0] rs1_in, rs2_in, rd_in,
    input logic RegWrite_in, MemtoReg_in, ALUSrc_in, MemRead_in, MemWrite_in, Branch_in, Uses_rs2_in,
    input logic [2:0] ALUOp_in,
    output logic [31:0] pc_out, data1_out, data2_out, imm_out,
    output logic RegWrite_out, MemtoReg_out, ALUSrc_out, MemRead_out, MemWrite_out, Branch_out, Uses_rs2_out,
    output logic [4:0] rs1_out, rs2_out, rd_out,
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_out <= 32'b0;
            data1_out <= 32'b0;
            data2_out <= 32'b0;
            imm_out <= 32'b0;
            rs1_out <= 5'b0;
            rs2_out <= 5'b0;
            rd_out <= 5'b0;
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            ALUSrc_out <= 1'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
            Branch_out <= 1'b0;
            Uses_rs2_out <= 1'b0;
        end else if (flush) begin
            pc_out <= 32'b0;
            data1_out <= 32'b0;
            data2_out <= 32'b0;
            imm_out <= 32'b0;
            rs1_out <= 5'b0;
            rs2_out <= 5'b0;
            rd_out <= 5'b0;
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            ALUSrc_out <= 1'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
            Branch_out <= 1'b0;
            Uses_rs2_out <= 1'b0;
        end else begin
            pc_out <= pc_in;
            data1_out <= data1_in;
            data2_out <= data2_in;
            imm_out <= imm_in;
            rs1_out <= rs1_in;
            rs2_out <= rs2_in;
            rd_out <= rd_in;
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            ALUSrc_out <= ALUSrc_in;
            MemRead_out <= MemRead_in;
            MemWrite_out <= MemWrite_in;
            Branch_out <= Branch_in;
            Uses_rs2_out <= Uses_rs2_in;
        end 
    end

endmodule 


