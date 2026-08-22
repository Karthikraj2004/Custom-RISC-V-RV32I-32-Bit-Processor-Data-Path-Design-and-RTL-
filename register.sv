module Register (
    input logic [4:0] reg1,
    input logic [4:0] reg2,
    input logic [4:0] WriteReg,
    input logic [31:0] WriteData,
    input logic RegWrite,
    output logic [31:0] data1, data2
);

    logic [31:0] Reg[31:0];

    assign data1 = (reg1 == 5'b0) ? 32b'0 : Reg[reg1];
    assign data2 = (reg2 == 5'b0) ? 32b'0 : Reg[reg2];

    always_ff @(posedge RegWrite) begin
        if (RegWrite && WriteReg != 5'b0) begin
            Reg[WriteReg] <= WriteData;
        end
    end

endmodule

