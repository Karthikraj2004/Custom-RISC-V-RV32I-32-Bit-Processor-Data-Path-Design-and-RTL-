module top_level (
    input logic clk, rst
);

    //PC instantiation
    logic pc_write_enable, EX_Mem_Branch, EX_Mem_ALU_Zero;
    logic [31:0] pc_new_in, pc_new_out;
    
    PC pc_module (
        .clk(clk),
        .rst(rst),
        .pc_write_enable(pc_write_enable),
        .next_pc(pc_new_in),
        .pc(pc_new_out)
    );

    //PC Adder Logic
    logic [31:0] pc_adder_out;
    logic [31:0] EX_Mem_pc_out, EX_Mem_Imm, Branch_Target;

    //PC incremnter logic
    assign pc_adder_out = pc_new_out + 4;
    //Branch Target Logic
    assign Branch_Target = EX_Mem_pc_out + EX_Mem_Imm;
    //PC next address selection
    assign pc_new_in = (EX_Mem_Branch && EX_Mem_ALU_Zero) ? Branch_Target : pc_adder_out;

    //Branch Flush Signal
    logic branch_flush;
    assign branch_flush = EX_Mem_Branch && EX_Mem_ALU_Zero;
    //End of PC logic

    //Instruction Memory (IM) instantiation

    //Output instruction from IM
    logic [31:0] instruction;
    InstructionMem im_module (
        .pc(pc_new_out),
        .instruction(instruction)
    );

    //IF/ID Register instantiation
    logic IF_ID_write;
    logic [31:0] IF_ID_pc_out, IF_ID_instruction_out;

    IF_ID_Register if_id_module (
        .clk(clk),
        .rst(rst),
        .ID_IF_write(IF_ID_write),
        .flush(branch_flush),
        .pc_in(pc_new_out),
        .instruction_in(instruction),
        .pc_out(IF_ID_pc_out),
        .instruction_out(IF_ID_instruction_out)
    );

    //ImmGen Instantiation
    logic [31:0] ImmGen_imm_out;
    ImmGen immgen_module (
        .instruction(IF_ID_instruction_out),
        .imm_out(ImmGen_imm_out)
    );

    //Control Unit (CU) instantiation
    logic ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, CU_Branch, Uses_rs2;
    logic [2:0] ALUOp;
    CU cu_module (
        .opcode(IF_ID_instruction_out[6:0]),
        .funct3(IF_ID_instruction_out[14:12]),
        .funct7(IF_ID_instruction_out[31:25]),
        .RegWrite(RegWrite),
        .MemtoReg(MemtoReg),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(CU_Branch),
        .Uses_rs2(Uses_rs2),
        .ALUOp(ALUOp)
    );

    //Hazard Detection Unit (HDU) instantiation
    logic Hazard_Flush;
    //logic [4:0] ID_EX_rd_out;

    HDU hdu_module (
        .rs1(IF_ID_instruction_out[19:15]),
        .rs2(IF_ID_instruction_out[24:20]),
        .rd(ID_EX_rd_out), // This line might need adjustment if ID_EX_rd_out is not properly declared
        .MemRead(ID_EX_MemRead_out),
        .RS2_Use(Uses_rs2),
        .pc_write(pc_write_enable),
        .flush(Hazard_Flush),
        .IF_ID_write(IF_ID_write)
    );
    //End of Hazard Detection Unit (HDU) instantiation

    //Register File (RF) instantiation
    logic [31:0] RF_data1_out, RF_data2_out, RF_Write_Data;
    logic [4:0] Mem_WB_rd;
    Register reg_module (
        .clk(clk),
        .rst(rst),
        .reg1(IF_ID_instruction_out[19:15]),
        .reg2(IF_ID_instruction_out[24:20]),
        .WriteReg(Mem_WB_rd),
        .WriteData(RF_Write_Data),
        .RegWrite(MEM_WB_RegWrite_out),
        .data1(RF_data1_out),
        .data2(RF_data2_out)
    );
    //End of Register File (RF) instantiation

    //ID/EX Register instantiation
    logic [2:0] ID_EX_ALUOp_out;
    logic [31:0] ID_EX_pc_out, ID_EX_data1_out, ID_EX_data2_out, ID_EX_imm_out;
    logic [4:0] ID_EX_rs1_out, ID_EX_rs2_out, ID_EX_rd_out;
    logic ID_EX_RegWrite_out, ID_EX_MemtoReg_out, ID_EX_ALUSrc_out, ID_EX_MemRead_out, ID_EX_MemWrite_out, ID_EX_Branch_out, ID_EX_Uses_rs2_out;
    ID_EX_Register id_ex_module (
        .clk(clk),
        .rst(rst),
        .HDU_flush(Hazard_Flush),
        .Branch_flush(branch_flush),
        .pc_in(IF_ID_pc_out),
        .data1_in(RF_data1_out),
        .data2_in(RF_data2_out),
        .imm_in(ImmGen_imm_out),
        .rs1_in(IF_ID_instruction_out[19:15]),
        .rs2_in(IF_ID_instruction_out[24:20]),
        .rd_in(IF_ID_instruction_out[11:7]),
        .RegWrite_in(RegWrite),
        .MemtoReg_in(MemtoReg),
        .ALUSrc_in(ALUSrc),
        .MemRead_in(MemRead),
        .MemWrite_in(MemWrite),
        .Branch_in(CU_Branch),
        .Uses_rs2_in(Uses_rs2),
        .ALUOp_in(ALUOp),
        .ALUOp_out(ID_EX_ALUOp_out),
        .pc_out(ID_EX_pc_out),
        .data1_out(ID_EX_data1_out),
        .data2_out(ID_EX_data2_out),
        .imm_out(ID_EX_imm_out),
        .rs1_out(ID_EX_rs1_out),
        .rs2_out(ID_EX_rs2_out),
        .rd_out(ID_EX_rd_out),
        .RegWrite_out(ID_EX_RegWrite_out),
        .MemtoReg_out(ID_EX_MemtoReg_out),
        .ALUSrc_out(ID_EX_ALUSrc_out),
        .MemRead_out(ID_EX_MemRead_out),
        .MemWrite_out(ID_EX_MemWrite_out),
        .Branch_out(ID_EX_Branch_out),
        .Uses_rs2_out(ID_EX_Uses_rs2_out)
    );
    //End of ID/EX Register instantiation

    //Forwarding Muxes and ALUSrc Mux instantiation
    logic [31:0] EX_Mem_Data, ALU_input1, Forwarding_Mux2_out, ALU_input2;
    logic [1:0] ForwardA, ForwardB;

    assign ALU_input1 = (ForwardA == 2'b00) ? ID_EX_data1_out :
                        (ForwardA == 2'b01) ? RF_Write_Data :
                        (ForwardA == 2'b10) ? EX_Mem_Data : 32'b0;

                    

    assign Forwarding_Mux2_out = (ForwardB == 2'b00) ? ID_EX_data2_out  :
                                 (ForwardB == 2'b01) ? RF_Write_Data  :
                                 (ForwardB == 2'b10) ? EX_Mem_Data  :   32'b0;

    assign ALU_input2 = (ID_EX_ALUSrc_out) ? ID_EX_imm_out    :   Forwarding_Mux2_out;

    //Forwarding Muxes and ImmMux Instatiation End 

    //ALU instantiation 
    logic [31:0] ALU_result;
    logic ALU_Zero_Flag;

    ALU_design alu_module (
        .alu_Op(ID_EX_ALUOp_out),
        .reg1(ALU_input1),
        .reg2(ALU_input2),
        .alu_result(ALU_result),
        .zero_flag(ALU_Zero_Flag)
    );

    //ALU instantiation End

    //EX_Mem instantiation start 
    //NOTE: EX_MEM_Data, EX_MEM_Branch, EX_MEM_ALU_Zero, EX_MEM_pc_out, EX_Mem_Imm already declared above 
    logic [31:0] EX_Mem_data2_out;
    logic [4:0] EX_Mem_rd_out;
    logic EX_Mem_RegWrite_out, EX_Mem_MemtoReg_out, EX_Mem_MemRead_out, EX_Mem_MemWrite_out;

    EX_Mem_Reg ex_mem_module (
        .clk(clk),
        .rst(rst),
        .Branch(ID_EX_Branch_out),
        .Zero_Flag(ALU_Zero_Flag),
        .pc_in(ID_EX_pc_out),
        .Imm_in(ID_EX_imm_out),
        .ALU_result_in(ALU_result),
        .data2_in(Forwarding_Mux2_out),
        .rd_in(ID_EX_rd_out),
        .RegWrite_in(ID_EX_RegWrite_out),
        .MemtoReg_in(ID_EX_MemtoReg_out),
        .MemRead_in(ID_EX_MemRead_out),
        .MemWrite_in(ID_EX_MemWrite_out),
        .pc_out(EX_Mem_pc_out),
        .Imm_out(EX_Mem_Imm),
        .ALU_result_out(EX_Mem_Data),
        .data2_out(EX_Mem_data2_out),
        .rd_out(EX_Mem_rd_out),
        .RegWrite_out(EX_Mem_RegWrite_out),
        .MemtoReg_out(EX_Mem_MemtoReg_out),
        .MemRead_out(EX_Mem_MemRead_out),
        .MemWrite_out(EX_Mem_MemWrite_out),
        .Branch_out(EX_Mem_Branch)
    );

    //EX_Mem instantiation end

    //Forwarding Unit instantiation
    //NOTE: ForwardA, ForwardB already declared above
    logic [4:0] MEM_WB_rd;
    logic MEM_WB_RegWrite_out;
    
    FDU fdu_module (
        .ID_EX_rs1(ID_EX_rs1_out),
        .ID_EX_rs2(ID_EX_rs2_out),
        .EX_MEM_rd(EX_Mem_rd_out),
        .EX_MEM_RegWrite(EX_Mem_RegWrite_out),
        .MEM_WB_rd(MEM_WB_rd),
        .MEM_WB_RegWrite(MEM_WB_RegWrite_out),
        .ForwardA(ForwardA),
        .ForwardB(ForwardB)
    );

    //Forwarding Unit instantiation end

    //Data Memory (DM) instantiation
    logic [31:0] DM_ReadData_out;

    DataMem dm_module (
        .clk(clk),
        .rst(rst),
        .MemWrite(EX_Mem_MemWrite_out),
        .MemRead(EX_Mem_MemRead_out),
        .WriteData(EX_Mem_data2_out),
        .Address(EX_Mem_Data[4:0]),
        .ReadData(DM_ReadData_out)
    );

        
    //Data Memory (DM) instantiation end

    //Mem_WB Register instantiation
    //Note : MEM_WB_rd, MEM_WB_RegWrite_out already declared above
    logic [31:0] MEM_WB_pc_out, MEM_WB_Imm_out, MEM_WB_ReadData_out, MEM_WB_ALU_result_out;
    logic [4:0] MEM_WB_rd_out;
    logic MEM_WB_MemtoReg_out;

    Mem_WB_Reg mem_wb_module (
        .clk(clk),
        .rst(rst),
        .pc_in(EX_Mem_pc_out),
        .Imm_in(EX_Mem_Imm),
        .ReadData_in(DM_ReadData_out),
        .ALU_result_in(EX_Mem_Data),
        .rd_in(EX_Mem_rd_out),
        .RegWrite_in(EX_Mem_RegWrite_out),
        .MemtoReg_in(EX_Mem_MemtoReg_out),
        .pc_out(MEM_WB_pc_out),
        .Imm_out(MEM_WB_Imm_out),
        .ReadData_out(MEM_WB_ReadData_out),
        .ALU_result_out(MEM_WB_ALU_result_out),
        .rd_out(MEM_WB_rd),
        .RegWrite_out(MEM_WB_RegWrite_out),
        .MemtoReg_out(MEM_WB_MemtoReg_out)
    );

    //Mem_WB Register instantiation end
    assign RF_Write_Data = (MEM_WB_MemtoReg_out) ? MEM_WB_ReadData_out  :   MEM_WB_ALU_result_out;


endmodule