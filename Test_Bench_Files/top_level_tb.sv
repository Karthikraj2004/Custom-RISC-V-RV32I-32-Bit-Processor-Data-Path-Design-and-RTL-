
`timescale 1ns/1ps

module top_level_tb;

    // Clock and reset
    logic clk;
    logic rst;

    // Instantiate CPU
    top_level dut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Test
    initial begin
      

    // CHECKS START HERE

        // Load program into Instruction Memory
        // $readmemh("program_alu.mem", dut.im_module.mem);

        // // Reset CPU
        // rst = 1'b1;

        // // Hold reset for two clock cycles
        // #20;

        // // Release reset
        // rst = 1'b0;

        // // Allow program to execute
        // #150;

        // // Display test header
        // $display("");
        // $display("========================================");
        // $display("           BASIC ALU TEST");
        // $display("========================================");
        // $display("");

        // // Check x1
        // if (dut.reg_module.Reg[1] === 32'd5)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 5, got %0d", dut.reg_module.Reg[1]);

        // // Check x2
        // if (dut.reg_module.Reg[2] === 32'd10)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 10, got %0d", dut.reg_module.Reg[2]);

        // // Check x3
        // if (dut.reg_module.Reg[3] === 32'd15)
        //     $display("PASS: x3 = %0d", dut.reg_module.Reg[3]);
        // else
        //     $display("FAIL: x3 expected 15, got %0d", dut.reg_module.Reg[3]);

        // // Check x4
        // if (dut.reg_module.Reg[4] === 32'd5)
        //     $display("PASS: x4 = %0d", dut.reg_module.Reg[4]);
        // else
        //     $display("FAIL: x4 expected 5, got %0d", dut.reg_module.Reg[4]);

        // // Check x5
        // if (dut.reg_module.Reg[5] === 32'd0)
        //     $display("PASS: x5 = %0d", dut.reg_module.Reg[5]);
        // else
        //     $display("FAIL: x5 expected 0, got %0d", dut.reg_module.Reg[5]);

        // // Check x6
        // if (dut.reg_module.Reg[6] === 32'd15)
        //     $display("PASS: x6 = %0d", dut.reg_module.Reg[6]);
        // else
        //     $display("FAIL: x6 expected 15, got %0d", dut.reg_module.Reg[6]);

        // $display("");
        // $display("========================================");

        // // Overall PASS/FAIL
        // if ((dut.reg_module.Reg[1] === 32'd5)  &&
        //     (dut.reg_module.Reg[2] === 32'd10) &&
        //     (dut.reg_module.Reg[3] === 32'd15) &&
        //     (dut.reg_module.Reg[4] === 32'd5)  &&
        //     (dut.reg_module.Reg[5] === 32'd0)  &&
        //     (dut.reg_module.Reg[6] === 32'd15)) begin

        //     $display("           ALU TEST PASSED");

        // end
        // else begin

        //     $display("           ALU TEST FAILED");

        // end

        // $display("========================================");
        // $display("");

        // Display test header
        // $display("");
        // $display("========================================");
        // $display("        LOAD/STORE TEST");
        // $display("========================================");
        // $display("");

        // // Check x1 = 42
        // if (dut.reg_module.Reg[1] === 32'd42)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 42, got %0d", dut.reg_module.Reg[1]);

        // // Check memory[5] = 42
        // if (dut.dm_module.mem[5] === 32'd42)
        //     $display("PASS: memory[5] = %0d", dut.dm_module.mem[5]);
        // else
        //     $display("FAIL: memory[5] expected 42, got %0d", dut.dm_module.mem[5]);

        // // Check x2 = 42
        // if (dut.reg_module.Reg[2] === 32'd42)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 42, got %0d", dut.reg_module.Reg[2]);

        // $display("");
        // $display("========================================");

        // // Overall PASS/FAIL
        // if ((dut.reg_module.Reg[1] === 32'd42) &&
        //     (dut.dm_module.mem[5] === 32'd42) &&
        //     (dut.reg_module.Reg[2] === 32'd42)) begin

        //     $display("        LOAD/STORE TEST PASSED");

        // end
        // else begin

        //     $display("        LOAD/STORE TEST FAILED");

        // end

        // $display("========================================");
        // $display("");

        

        // $readmemh("program_load_use_hazard.mem", dut.im_module.mem);

        // rst = 1'b1;

        // #20;

        // rst = 1'b0;

        // // Initialize memory after reset
        // dut.dm_module.mem[5] = 32'd42;

        // #150;

        // $display("");
        // $display("========================================");
        // $display("        LOAD-USE HAZARD TEST");
        // $display("========================================");
        // $display("");

        // if (dut.reg_module.Reg[1] === 32'd42)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 42, got %0d", dut.reg_module.Reg[1]);

        // if (dut.reg_module.Reg[2] === 32'd84)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 84, got %0d", dut.reg_module.Reg[2]);

        // $display("");
        // $display("========================================");

        // if ((dut.reg_module.Reg[1] === 32'd42) &&
        //     (dut.reg_module.Reg[2] === 32'd84)) begin

        //     $display("       LOAD-USE HAZARD TEST PASSED");

        // end
        // else begin

        //     $display("       LOAD-USE HAZARD TEST FAILED");

        // end

        // $display("========================================");
        // $display("");


        // $readmemh("program_forward_exmem.mem", dut.im_module.mem);

        // rst = 1'b1;

        // #20;

        // rst = 1'b0;

        // #150;

        // $display("");
        // $display("========================================");
        // $display("       EX/MEM FORWARDING TEST");
        // $display("========================================");
        // $display("");

        // // x1 = 5
        // if (dut.reg_module.Reg[1] === 32'd5)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 5, got %0d", dut.reg_module.Reg[1]);

        // // x2 = 10
        // if (dut.reg_module.Reg[2] === 32'd10)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 10, got %0d", dut.reg_module.Reg[2]);

        // // x3 = 15
        // if (dut.reg_module.Reg[3] === 32'd15)
        //     $display("PASS: x3 = %0d", dut.reg_module.Reg[3]);
        // else
        //     $display("FAIL: x3 expected 15, got %0d", dut.reg_module.Reg[3]);

        // // x4 = 10
        // if (dut.reg_module.Reg[4] === 32'd10)
        //     $display("PASS: x4 = %0d", dut.reg_module.Reg[4]);
        // else
        //     $display("FAIL: x4 expected 10, got %0d", dut.reg_module.Reg[4]);

        // $display("");
        // $display("========================================");

        // if ((dut.reg_module.Reg[1] === 32'd5) &&
        //     (dut.reg_module.Reg[2] === 32'd10) &&
        //     (dut.reg_module.Reg[3] === 32'd15) &&
        //     (dut.reg_module.Reg[4] === 32'd10)) begin

        //     $display("       EX/MEM FORWARDING TEST PASSED");

        // end
        // else begin

        //     $display("       EX/MEM FORWARDING TEST FAILED");

        // end

        // $display("========================================");
        // $display("");

        // $readmemh("program_forward_memwb.mem", dut.im_module.mem);

        // rst = 1'b1;

        // #20;

        // rst = 1'b0;

        // #150;

        // $display("");
        // $display("========================================");
        // $display("       MEM/WB FORWARDING TEST");
        // $display("========================================");
        // $display("");

        // // Check x1 = 5
        // if (dut.reg_module.Reg[1] === 32'd5)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 5, got %0d", dut.reg_module.Reg[1]);

        // // Check x2 = 10
        // if (dut.reg_module.Reg[2] === 32'd10)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 10, got %0d", dut.reg_module.Reg[2]);

        // // Check x3 = 15
        // if (dut.reg_module.Reg[3] === 32'd15)
        //     $display("PASS: x3 = %0d", dut.reg_module.Reg[3]);
        // else
        //     $display("FAIL: x3 expected 15, got %0d", dut.reg_module.Reg[3]);

        // // Check x5 = 7
        // if (dut.reg_module.Reg[5] === 32'd7)
        //     $display("PASS: x5 = %0d", dut.reg_module.Reg[5]);
        // else
        //     $display("FAIL: x5 expected 7, got %0d", dut.reg_module.Reg[5]);

        // // Check x4 = 10
        // if (dut.reg_module.Reg[4] === 32'd10)
        //     $display("PASS: x4 = %0d", dut.reg_module.Reg[4]);
        // else
        //     $display("FAIL: x4 expected 10, got %0d", dut.reg_module.Reg[4]);

        // $display("");
        // $display("========================================");

        // if ((dut.reg_module.Reg[1] === 32'd5) &&
        //     (dut.reg_module.Reg[2] === 32'd10) &&
        //     (dut.reg_module.Reg[3] === 32'd15) &&
        //     (dut.reg_module.Reg[5] === 32'd7) &&
        //     (dut.reg_module.Reg[4] === 32'd10)) begin

        //     $display("       MEM/WB FORWARDING TEST PASSED");

        // end
        // else begin

        //     $display("       MEM/WB FORWARDING TEST FAILED");

        // end

        // $display("========================================");
        // $display("");

        // $stop;

        // $readmemh("program_branch.mem", dut.im_module.mem);

        // rst = 1'b1;

        // #20;

        // rst = 1'b0;

        // #150;

        // $display("");
        // $display("========================================");
        // $display("           BRANCH TEST");
        // $display("========================================");
        // $display("");

        // // x1
        // if (dut.reg_module.Reg[1] === 32'd5)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 5, got %0d", dut.reg_module.Reg[1]);

        // // x2
        // if (dut.reg_module.Reg[2] === 32'd5)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 5, got %0d", dut.reg_module.Reg[2]);

        // // x3 must remain 0 because its instruction was flushed
        // if (dut.reg_module.Reg[3] === 32'd0)
        //     $display("PASS: x3 = %0d (wrong-path instruction flushed)", dut.reg_module.Reg[3]);
        // else
        //     $display("FAIL: x3 expected 0, got %0d", dut.reg_module.Reg[3]);

        // // x4 must become 42
        // if (dut.reg_module.Reg[4] === 32'd42)
        //     $display("PASS: x4 = %0d (branch target executed)", dut.reg_module.Reg[4]);
        // else
        //     $display("FAIL: x4 expected 42, got %0d", dut.reg_module.Reg[4]);

        // $display("");
        // $display("========================================");

        // if ((dut.reg_module.Reg[1] === 32'd5) &&
        //     (dut.reg_module.Reg[2] === 32'd5) &&
        //     (dut.reg_module.Reg[3] === 32'd0) &&
        //     (dut.reg_module.Reg[4] === 32'd42)) begin

        //     $display("           BRANCH TEST PASSED");

        // end
        // else begin

        //     $display("           BRANCH TEST FAILED");

        // end

        // $display("========================================");
        // $display("");

        // $stop;
         // ========================================
        // INITIALIZE
        // ========================================

        // clk = 0;
        // rst = 1;

        // // Load integration-test machine code
        // $readmemh("integration_test.mem", dut.im_module.mem);

        // // Hold reset for two clock cycles
        // #20;
        // rst = 0;

        // // ========================================
        // // RUN PROGRAM
        // // ========================================

        // #250;

        //  // ========================================
        // // INTEGRATION TEST
        // // ========================================

        // $display("");
        // $display("========================================");
        // $display("       CPU INTEGRATION TEST");
        // $display("========================================");
        // $display("");

        // // x1 = 5
        // if (dut.reg_module.Reg[1] == 32'd5)
        //     $display("PASS: x1 = %0d", dut.reg_module.Reg[1]);
        // else
        //     $display("FAIL: x1 expected 5, got %0d",
        //              dut.reg_module.Reg[1]);

        // // x2 = 10
        // if (dut.reg_module.Reg[2] == 32'd10)
        //     $display("PASS: x2 = %0d", dut.reg_module.Reg[2]);
        // else
        //     $display("FAIL: x2 expected 10, got %0d",
        //              dut.reg_module.Reg[2]);

        // // x3 = 15
        // if (dut.reg_module.Reg[3] == 32'd15)
        //     $display("PASS: x3 = %0d", dut.reg_module.Reg[3]);
        // else
        //     $display("FAIL: x3 expected 15, got %0d",
        //              dut.reg_module.Reg[3]);

        // // x4 = 10
        // if (dut.reg_module.Reg[4] == 32'd10)
        //     $display("PASS: x4 = %0d", dut.reg_module.Reg[4]);
        // else
        //     $display("FAIL: x4 expected 10, got %0d",
        //              dut.reg_module.Reg[4]);

        // // x5 = 10 (loaded from memory)
        // if (dut.reg_module.Reg[5] == 32'd10)
        //     $display("PASS: x5 = %0d", dut.reg_module.Reg[5]);
        // else
        //     $display("FAIL: x5 expected 10, got %0d",
        //              dut.reg_module.Reg[5]);

        // // x6 = 20 (load-use hazard)
        // if (dut.reg_module.Reg[6] == 32'd20)
        //     $display("PASS: x6 = %0d", dut.reg_module.Reg[6]);
        // else
        //     $display("FAIL: x6 expected 20, got %0d",
        //              dut.reg_module.Reg[6]);

        // // x7 = 25
        // if (dut.reg_module.Reg[7] == 32'd25)
        //     $display("PASS: x7 = %0d", dut.reg_module.Reg[7]);
        // else
        //     $display("FAIL: x7 expected 25, got %0d",
        //              dut.reg_module.Reg[7]);

        // // x8 = 99
        // // BEQ should NOT be taken
        // if (dut.reg_module.Reg[8] == 32'd99)
        //     $display("PASS: x8 = %0d (not-taken branch continued)",
        //              dut.reg_module.Reg[8]);
        // else
        //     $display("FAIL: x8 expected 99, got %0d",
        //              dut.reg_module.Reg[8]);

        // // x9 = 42
        // if (dut.reg_module.Reg[9] == 32'd42)
        //     $display("PASS: x9 = %0d", dut.reg_module.Reg[9]);
        // else
        //     $display("FAIL: x9 expected 42, got %0d",
        //              dut.reg_module.Reg[9]);

        // // memory[0] = 10
        // if (dut.dm_module.mem[0] == 32'd10)
        //     $display("PASS: memory[0] = %0d",
        //              dut.dm_module.mem[0]);
        // else
        //     $display("FAIL: memory[0] expected 10, got %0d",
        //              dut.dm_module.mem[0]);

        // // ========================================
        // // OVERALL RESULT
        // // ========================================

        // if ((dut.reg_module.Reg[1] == 32'd5)  &&
        //     (dut.reg_module.Reg[2] == 32'd10) &&
        //     (dut.reg_module.Reg[3] == 32'd15) &&
        //     (dut.reg_module.Reg[4] == 32'd10) &&
        //     (dut.reg_module.Reg[5] == 32'd10) &&
        //     (dut.reg_module.Reg[6] == 32'd20) &&
        //     (dut.reg_module.Reg[7] == 32'd25) &&
        //     (dut.reg_module.Reg[8] == 32'd99) &&
        //     (dut.reg_module.Reg[9] == 32'd42) &&
        //     (dut.dm_module.mem[0] == 32'd10)) begin

        //     $display("");
        //     $display("========================================");
        //     $display("       INTEGRATION TEST PASSED");
        //     $display("========================================");

        // end else begin

        //     $display("");
        //     $display("========================================");
        //     $display("       INTEGRATION TEST FAILED");
        //     $display("========================================");

        // end

        // $stop;

        clk = 0;
        rst = 1;

        $readmemh("branch_forward_test.mem", dut.im_module.mem);

        // Reset
        #20;
        rst = 0;

        // Allow program to execute
        #150;

        // ========================================
        // BRANCH + FORWARDING TEST
        // ========================================

        $display("");
        $display("========================================");
        $display("   BRANCH + FORWARDING TEST");
        $display("========================================");
        $display("");

        // x1 = 5
        if (dut.reg_module.Reg[1] === 32'd5)
            $display("PASS: x1 = 5");
        else
            $display("FAIL: x1 expected 5, got %0d",
                     dut.reg_module.Reg[1]);

        // x2 = 5
        if (dut.reg_module.Reg[2] === 32'd5)
            $display("PASS: x2 = 5");
        else
            $display("FAIL: x2 expected 5, got %0d",
                     dut.reg_module.Reg[2]);

        // x3 = 10
        if (dut.reg_module.Reg[3] === 32'd10)
            $display("PASS: x3 = 10");
        else
            $display("FAIL: x3 expected 10, got %0d",
                     dut.reg_module.Reg[3]);

        // x4 must remain 0 because BEQ skips it
        if (dut.reg_module.Reg[4] === 32'd0)
            $display("PASS: x4 = 0 (wrong-path instruction flushed)");
        else
            $display("FAIL: x4 expected 0, got %0d",
                     dut.reg_module.Reg[4]);

        // x5 = 42 at branch target
        if (dut.reg_module.Reg[5] === 32'd42)
            $display("PASS: x5 = 42 (branch target executed)");
        else
            $display("FAIL: x5 expected 42, got %0d",
                     dut.reg_module.Reg[5]);

        // ========================================
        // OVERALL RESULT
        // ========================================

        if ((dut.reg_module.Reg[1] === 32'd5)  &&
            (dut.reg_module.Reg[2] === 32'd5)  &&
            (dut.reg_module.Reg[3] === 32'd10) &&
            (dut.reg_module.Reg[4] === 32'd0)  &&
            (dut.reg_module.Reg[5] === 32'd42)) begin

            $display("");
            $display("========================================");
            $display("   BRANCH + FORWARDING TEST PASSED");
            $display("========================================");

        end
        else begin

            $display("");
            $display("========================================");
            $display("   BRANCH + FORWARDING TEST FAILED");
            $display("========================================");

        end

        $display("");

        $stop;



    end

endmodule

