module InstructionMem (
    input logic clk,
    input logic [31:0] pc,
    input logic        imem_write_enable,
    input logic [4:0]  imem_write_addr,
    input logic [31:0] imem_write_data,
    output logic [31:0] instruction
);

    logic [31:0] mem[0:31];

    always_ff @(posedge clk) begin
        if (imem_write_enable)
            mem[imem_write_addr] <= imem_write_data;
    end

    assign instruction = mem[pc[6:2]]; // Assuming word-aligned addresses

endmodule 