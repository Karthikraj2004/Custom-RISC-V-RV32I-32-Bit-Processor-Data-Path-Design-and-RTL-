module IF_ID_Register (
    input logic clk, rst, ID_IF_write,
    input logic [31:0] pc_in, instruction_in,
    output logic [31:0] pc_out, instruction_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_out <= 32'b0;
            instruction_out <= 32'b0;
        end else if (ID_IF_write) begin
            pc_out <= pc_in;
            instruction_out <= instruction_in;
        end
    end

endmodule 