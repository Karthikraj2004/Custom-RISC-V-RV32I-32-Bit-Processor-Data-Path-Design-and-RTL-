module EX_Mem_Reg (
    input logic clk, rst, Branch, Zero_Flag,
    input logic [31:0] pc_in, Imm_in, ALU_result_in, data2_in,
    input logic [4:0] rd_in,
    input logic RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in,
    output logic [31:0] pc_out, Imm_out, ALU_result_out, data2_out,
    output logic [4:0] rd_out,
    output logic RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out, Branch_out, ALU_Zero
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_out <= 32'b0;
            Imm_out <= 32'b0;
            ALU_result_out <= 32'b0;
            data2_out <= 32'b0;
            rd_out <= 5'b0;
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
            Branch_out <= 1'b0;
            ALU_Zero <= 1'b0;
        end else begin
            pc_out <= pc_in;
            Imm_out <= Imm_in;
            ALU_result_out <= ALU_result_in;
            ALU_Zero <= Zero_Flag;
            data2_out <= data2_in;
            rd_out <= rd_in;
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            MemRead_out <= MemRead_in;
            MemWrite_out <= MemWrite_in;
            Branch_out <= Branch;
        end
    end
endmodule