module EX_Mem_Reg (
    input logic clk, rst,
    input logic [31:0] ALU_result_in, data2_in,
    input logic [4:0] rd_in,
    input logic RegWrite_in, MemtoReg_in, MemRead_in, MemWrite_in,
    output logic [31:0] ALU_result_out, data2_out,
    output logic [4:0] rd_out,
    output logic RegWrite_out, MemtoReg_out, MemRead_out, MemWrite_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            ALU_result_out <= 32'b0;
            data2_out <= 32'b0;
            rd_out <= 5'b0;
            RegWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
        end else begin
            ALU_result_out <= ALU_result_in;
            data2_out <= data2_in;
            rd_out <= rd_in;
            RegWrite_out <= RegWrite_in;
            MemtoReg_out <= MemtoReg_in;
            MemRead_out <= MemRead_in;
            MemWrite_out <= MemWrite_in;
        end
    end
endmodule