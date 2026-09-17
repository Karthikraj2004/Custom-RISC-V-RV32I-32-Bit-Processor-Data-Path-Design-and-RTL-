`timescale 1ns/1ps

module ALU_design_tb;

    logic [2:0] alu_Op;

    logic [31:0] reg1;
    logic [31:0] reg2;

    logic [31:0] alu_result;
    logic zero_flag;

    ALU_design uut (
        .alu_Op(alu_Op),
        .reg1(reg1),
        .reg2(reg2),
        .alu_result(alu_result),
        .zero_flag(zero_flag)
    );

    initial begin

        // ADD
        alu_Op = 3'b000;
        reg1 = 32'd10;
        reg2 = 32'd5;
        #10;

        // SUB
        alu_Op = 3'b001;
        reg1 = 32'd10;
        reg2 = 32'd5;
        #10;

        // AND
        alu_Op = 3'b010;
        reg1 = 32'hFFFF0000;
        reg2 = 32'h0F0F0F0F;
        #10;

        // OR
        alu_Op = 3'b011;
        reg1 = 32'hFFFF0000;
        reg2 = 32'h0F0F0F0F;
        #10;

        // ADD = 0
        alu_Op = 3'b000;
        reg1 = 32'd0;
        reg2 = 32'd0;
        #10;

        $finish;

    end

endmodule