module FDU (
    input logic [4:0] ID_EX_rs1,
    input logic [4:0] ID_EX_rs2,
    input logic [4:0] EX_MEM_rd,
    input logic EX_MEM_RegWrite,
    input logic [4:0] MEM_WB_rd,
    input logic MEM_WB_RegWrite,
    output logic [1:0] ForwardA,
    output logic [1:0] ForwardB
);

    assign ForwardA = (EX_MEM_RegWrite && (EX_MEM_rd != 5'b00000) && (EX_MEM_rd == ID_EX_rs1)) ? 2'b10 :
                      (MEM_WB_RegWrite && (MEM_WB_rd != 5'b00000) && (MEM_WB_rd == ID_EX_rs1)) ? 2'b01 : 2'b00;

    assign ForwardB = (EX_MEM_RegWrite && (EX_MEM_rd != 5'b00000) && (EX_MEM_rd == ID_EX_rs2)) ? 2'b10 :
                      (MEM_WB_RegWrite && (MEM_WB_rd != 5'b00000) && (MEM_WB_rd == ID_EX_rs2)) ? 2'b01 : 2'b00;

endmodule

        
        