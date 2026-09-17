# Custom RISC V RV32I CPU Project
By: Riddhiman Das Roy, Karthikraj Maheshkumar

## Developmental Steps
#### 1.) Project Definition Stage 
#### 2.) Datapath Development Stage
#### 3.) RTL Design and Verification Stage
#### 4.) Physical Layout and Verification 

## Project Definition Stage and Target Technical Objectives 
 - Design a small Harvard architecture CPU from RTL -> GDS2 stage using the RISC V RV32I ISA.
 - CPU will implement 8 instructions of the RISC V RV32I ISA:
   - ADD
   - SUB
   - AND
   - OR
   - ADDI
   - LW
   - SW 
   - BEQ
     
After RTL design and verification, the processor will be implemented using 45 nm PDK. Cadence Genus, Cadence Innovus and Cadence Virtuouso will be the primary tools for synthesis and physical layout. 

## Datapath and Pipeline Stages 
The following datapath shows the pipeline stages and Hazard Detection/Forward Detection unit signals of the processor:
<img width="2122" height="1110" alt="DataPath1 drawio" src="https://github.com/user-attachments/assets/e3d956f6-5a1b-4d58-8d24-d09e3a08ace3" />

The following datapath shows the pipelined stages, HDU, FDU along with the CU signals. 
<img width="2215" height="1458" alt="DataPath1 (1)" src="https://github.com/user-attachments/assets/3878a527-9e3f-48bb-b499-bd6a7b8c4de6" />

# RTL Development and Verification
The CPU was developed using SystemVerilog, and 13 submodules were developed which were subsequently integrated in the top level testbench. The testing and verification process involved writing RISC V assembly code and uploading the equivalent machine code (which was in a .mem file) to the CPU. Various assembly instructions pertaining to the ALU operations, load, store, hazard detection, forward detection, integrated tests and ALU/branch testing. The specific RISC V assembly code, equivalent machine code and subsequent test results are detailed below:

## Basic ALU Test 

### Assembly Code For Test
<img width="198" height="165" alt="image" src="https://github.com/user-attachments/assets/3b0460df-789d-4a20-94b2-761980f13906" />

### Assembly Machine Code 
<img width="102" height="163" alt="image" src="https://github.com/user-attachments/assets/c1ea2a16-7278-48d5-9d55-bc0303c39239" />

### Test Script and Waveform Results 
<img width="397" height="719" alt="ALU_Test_Script" src="https://github.com/user-attachments/assets/2d29ecc3-a334-4dad-be17-0bbb7678bd60" />

<img width="1408" height="1216" alt="ALU_Test_Waveforms" src="https://github.com/user-attachments/assets/9ca5b246-b2d6-4c36-b727-450c4a9dacd3" />











