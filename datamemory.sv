module DataMem (
    input logic clk, MemWrite, MemRead, rst,
    input logic [31:0] WriteData,
    input logic [4:0] Address,
    output logic [31:0] ReadData
);

    logic [31:0] mem[0:31];


    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            ReadData <= 32'b0;
        end else if (MemWrite) begin
            mem[Address] <= WriteData;
        end else if (MemRead) begin
            ReadData <= mem[Address];
        end
    end

endmodule