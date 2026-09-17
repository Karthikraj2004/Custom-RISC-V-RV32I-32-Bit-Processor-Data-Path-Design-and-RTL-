module Mem_WB_Reg (
    input logic clk, rst,
    input logic [31:0] pc_in, Imm_in,ReadData_in, ALU_result_in,
    input logic [4:0] rd_in,
    input logic RegWrite_in, MemtoReg_in,
    output logic [31:0] pc_out, Imm_out, ReadData_out, ALU_result_out,
    output logic [4:0] rd_out,
    output logic RegWrite_out, MemtoReg_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_out <= 32'b0;
            Imm_out <= 32'b0;
            ReadData_out <= 32'b0;
            ALU_result_out <= 32'b0;
            rd_out <= 5'b0;
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
        end else begin
            pc_out <= pc_in;
            Imm_out <= Imm_in;
            ReadData_out <= ReadData_in;
            ALU_result_out <= ALU_result_in;
            rd_out <= rd_in;
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
        end
    end
endmodule