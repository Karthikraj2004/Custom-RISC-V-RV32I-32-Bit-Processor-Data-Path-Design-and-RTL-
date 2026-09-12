`timescale 1ns/1ps

module CU_tb;

    logic [6:0] opcode;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic ALUSrc;
    logic MemtoReg;
    logic RegWrite;
    logic MemRead;
    logic MemWrite;
    logic Branch;
    logic Uses_rs2;
    logic [2:0] ALUOp;

    CU dut (
        .opcode    (opcode),
        .funct3    (funct3),
        .funct7    (funct7),
        .ALUSrc    (ALUSrc),
        .MemtoReg  (MemtoReg),
        .RegWrite  (RegWrite),
        .MemRead   (MemRead),
        .MemWrite  (MemWrite),
        .Branch    (Branch),
        .Uses_rs2  (Uses_rs2),
        .ALUOp     (ALUOp)
    );

    initial begin

        // Test 1: R-type ADD
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b1 &&
            ALUSrc   === 1'b0 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b000
        )
            $display("TEST 1 PASSED: R-type ADD");
        else begin
            $display("TEST 1 FAILED: R-type ADD");
            print_signals();
        end

        // Test 2: R-type SUB
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0100000;
        #1;

        if (
            RegWrite === 1'b1 &&
            ALUSrc   === 1'b0 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b001
        )
            $display("TEST 2 PASSED: R-type SUB");
        else begin
            $display("TEST 2 FAILED: R-type SUB");
            print_signals();
        end

        // Test 3: R-type AND
        opcode = 7'b0110011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b1 &&
            ALUSrc   === 1'b0 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b010
        )
            $display("TEST 3 PASSED: R-type AND");
        else begin
            $display("TEST 3 FAILED: R-type AND");
            print_signals();
        end

        // Test 4: R-type OR
        opcode = 7'b0110011;
        funct3 = 3'b110;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b1 &&
            ALUSrc   === 1'b0 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b011
        )
            $display("TEST 4 PASSED: R-type OR");
        else begin
            $display("TEST 4 FAILED: R-type OR");
            print_signals();
        end

        // Test 5: I-type ADDI
        opcode = 7'b0010011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b1 &&
            ALUSrc   === 1'b1 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b0 &&
            ALUOp    === 3'b000
        )
            $display("TEST 5 PASSED: I-type ADDI");
        else begin
            $display("TEST 5 FAILED: I-type ADDI");
            print_signals();
        end

        // Test 6: LOAD
        opcode = 7'b0000011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b1 &&
            ALUSrc   === 1'b1 &&
            MemtoReg === 1'b1 &&
            MemRead  === 1'b1 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b0 &&
            ALUOp    === 3'b000
        )
            $display("TEST 6 PASSED: LOAD");
        else begin
            $display("TEST 6 FAILED: LOAD");
            print_signals();
        end

        // Test 7: STORE
        opcode = 7'b0100011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b0 &&
            ALUSrc   === 1'b1 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b1 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b000
        )
            $display("TEST 7 PASSED: STORE");
        else begin
            $display("TEST 7 FAILED: STORE");
            print_signals();
        end

        // Test 8: BRANCH
        opcode = 7'b1100011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b0 &&
            ALUSrc   === 1'b0 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b1 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b001
        )
            $display("TEST 8 PASSED: BRANCH");
        else begin
            $display("TEST 8 FAILED: BRANCH");
            print_signals();
        end

        // Test 9: Invalid opcode
        opcode = 7'b1111111;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #1;

        if (
            RegWrite === 1'b0 &&
            ALUSrc   === 1'b0 &&
            MemtoReg === 1'b0 &&
            MemRead  === 1'b0 &&
            MemWrite === 1'b0 &&
            Branch   === 1'b0 &&
            Uses_rs2 === 1'b1 &&
            ALUOp    === 3'b000
        )
            $display("TEST 9 PASSED: Invalid opcode");
        else begin
            $display("TEST 9 FAILED: Invalid opcode");
            print_signals();
        end

        $display("");
        $display("========================================");
        $display("          CONTROL UNIT TEST             ");
        $display("              COMPLETE                  ");
        $display("========================================");

        $finish;
    end

    task print_signals;
        begin
            $display("  RegWrite = %b", RegWrite);
            $display("  ALUSrc   = %b", ALUSrc);
            $display("  MemtoReg = %b", MemtoReg);
            $display("  MemRead  = %b", MemRead);
            $display("  MemWrite = %b", MemWrite);
            $display("  Branch   = %b", Branch);
            $display("  Uses_rs2 = %b", Uses_rs2);
            $display("  ALUOp    = %b", ALUOp);
        end
    endtask

endmodule