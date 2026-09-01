module HDU (
    input logic [4:0] rs1, rs2, rd,
    input logic MemRead, RS2_Use,
    output logic pc_write, flush, ID_IF_write
);

    always_comb begin 
        pc_write = 1;
        flush = 0;
        ID_IF_write = 1;
        if ((rs1 == rd || rs2 == rd) && MemRead == 1 && RS2_Use == 1 && (rd != 5'b00000)) begin
            pc_write = 0;
            flush = 1;
            ID_IF_write = 0;
        end  
    end

endmodule