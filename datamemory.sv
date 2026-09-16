module DataMem (
    input logic clk, MemWrite, MemRead, rst,
    input logic [31:0] WriteData,
    input logic [4:0] Address,
    output logic [31:0] ReadData
);

    logic [31:0] mem[0:31];


    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int i = 0; i < 32; i++) begin
                mem[i] <= 32'b0;
            end
        end else if (MemWrite) begin
            mem[Address] <= WriteData;
        end
    end

    assign ReadData = MemRead ? mem[Address] : 32'b0;

endmodule