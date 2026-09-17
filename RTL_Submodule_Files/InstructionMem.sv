module InstructionMem (
    input logic [31:0] pc,
    output logic [31:0] instruction
);

    logic [31:0] mem[0:31];

    assign instruction = mem[pc[6:2]]; // Assuming word-aligned addresses

endmodule 