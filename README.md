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

### Bugs Found and Fixes
Bug: Data write back was happening at same time as access, causing previous data being used, not the most updated recent data.
Fix: Code changed to check for WriteReg == reg1, and if condition met do data == reg[WriteReg]


## Load and Store 

### Assembly Code For Test
<img width="227" height="102" alt="image" src="https://github.com/user-attachments/assets/30c3fa5e-f557-417b-849e-8be807b2917d" />

### Assembly Machine Code 
<img width="172" height="95" alt="image" src="https://github.com/user-attachments/assets/cf2951fe-749e-4f41-977a-9105543ff6b2" />

### Test Script and Waveform Results 
<img width="436" height="268" alt="Load_Store_Script" src="https://github.com/user-attachments/assets/24f18b85-7c53-4b6c-b318-bd83ab75d3d3" />

<img width="1409" height="1207" alt="Load_Store_Waveforms" src="https://github.com/user-attachments/assets/24ecd6ab-b1d9-419f-a81f-ff3d8545c2c8" />

### Bugs Found and Fixes
Bug: old ReadData being seen because DataMem read was asynchronous: it was available only after MEM/WB captured value.
Fix: MemRead was made synchronous.


## Load Use Hazard Test

### Assembly Code For Test
<img width="122" height="48" alt="image" src="https://github.com/user-attachments/assets/5a0250ae-0687-4549-88a5-2f20151c4da3" />

NOTE: 42 was preloaded onto DataMem[5]

### Assembly Machine Code 
<img width="154" height="76" alt="image" src="https://github.com/user-attachments/assets/f48d689a-6665-497a-b7c6-a50e6bbb5307" />

### Test Script and Waveform Results 
<img width="444" height="283" alt="Load_Use_Hazard_Script" src="https://github.com/user-attachments/assets/eb15aa1f-ec76-4afd-bc2c-97d825834ec6" />

<img width="1370" height="1151" alt="Load_Use_Hazard_Waveform" src="https://github.com/user-attachments/assets/1ab8402c-5129-4f9b-b30b-28679848f55b" />

### Bugs Found and Fixes
No bugs found.


## Forwarding Verification
For this test, 2 sub-tests were conducted:
 - Test 1, EX/MEM to EX forwarding
 - Test 2, MEM/WB forwarding

## Forwarding Verification Test 1: EX/MEM Forwarding 

### Assembly Code For Test
<img width="228" height="125" alt="image" src="https://github.com/user-attachments/assets/11894a6f-4515-4e3d-a36f-f42ab9ba6d98" />

NOTE: in the above code, X3 from the add x3, x1, x2 instruction needs to be forwarded from EX/MEM register so that sub x4, x3, x1  instruction can use.

### Assembly Machine Code 
<img width="128" height="126" alt="image" src="https://github.com/user-attachments/assets/81fb0199-c513-443f-818c-7e358cd877e6" />

### Test Script and Waveform Results 
<img width="469" height="308" alt="EX_MEM_Forwarding_Script" src="https://github.com/user-attachments/assets/870306c4-4ec1-4abd-b6dd-6124d11fdc49" />

<img width="1296" height="1156" alt="EX_MEM_Forwarding_Waveform" src="https://github.com/user-attachments/assets/2fd47193-dff3-438e-afc5-655b3a8a14d1" />

### Bugs Found and Fixes
No bugs found.


## Forwarding Verification Test 2: MEM/WB Forwarding 

### Assembly Code For Test
<img width="231" height="163" alt="image" src="https://github.com/user-attachments/assets/f7cdcb3a-0a09-4051-89df-569ceae592d8" />

NOTE: in the above code, X3 from the add x3, x1, x2 instruction needs to be forwarded from MEM/WB register so that sub x4, x3, x1  instruction can use x3.

### Assembly Machine Code 
<img width="130" height="159" alt="image" src="https://github.com/user-attachments/assets/92c09eb3-cba8-4ee6-b930-c8e09e3489e4" />

### Test Script and Waveform Results 
<img width="462" height="378" alt="MEM_WB_FORWARD_Script" src="https://github.com/user-attachments/assets/6ef430c2-33f7-4155-9190-a41d241a4add" />

<img width="1388" height="1177" alt="MEM_WB_Forward_Waveform" src="https://github.com/user-attachments/assets/7ff91887-48f0-4d80-a45d-e3331d7de53c" />

### Bugs Found and Fixes
No bugs found.


## Branching Verfication

### Assembly Code For Test
<img width="124" height="88" alt="image" src="https://github.com/user-attachments/assets/03b9fa09-2609-4aeb-80fa-b055130d353f" />

NOTE: in the above code, addi x3, x0, 99 must be skipped due to beq x1, x2, +8 instruction executing.

### Assembly Machine Code 
<img width="67" height="89" alt="image" src="https://github.com/user-attachments/assets/5adf853b-717d-413d-bc36-22d6496c34ca" />

### Test Script and Waveform Results 


### Bugs Found and Fixes
Bug: x3 expected 0, but got 99. This was because addi x3, x0, 99 already had entered the ID/EX register by the time branch flush had become 1 which means that the register value for x3 had already been changed before the branch flush signal could reach the registers and void the numbers. The fix was to re-write the branching logic to use ALU_Zero which updated synchronously (instead of EX/MEM_ALU_Zero which updated asynchronously) and send the branching signal from ID/EX instead of EX/MEM, that way the instruction coming after the branch could immediately be flushed once the branch is detected and ALU_Zero is true.


## Combined/Integrated Program

### Assembly Code For Test
<img width="423" height="196" alt="image" src="https://github.com/user-attachments/assets/a4252733-f6f1-42ba-bee2-9588c70aace3" />

### Assembly Machine Code 
<img width="81" height="216" alt="image" src="https://github.com/user-attachments/assets/00d0b660-c17c-477c-9612-814f9d8d9030" />


### Test Script and Waveform Results 


### Bugs Found and Fixes
No bugs found.


## BEQ Dependence on ALU Forwarding Test

### Assembly Code For Test
<img width="220" height="177" alt="image" src="https://github.com/user-attachments/assets/7d0293e1-7d09-44b6-819f-cd581570aefd" />

NOTE: In the code above, the beq x3, x3, +8 instruction has an immediate dependency on x3 from the add x3, x1, x2 instruction, necessitating the need for forwarding to make the updated x3 value available for the beq instruction.

### Assembly Machine Code 
<img width="117" height="183" alt="image" src="https://github.com/user-attachments/assets/3c95c94d-b218-477a-b9ee-02bb5fd5ba4e" />

### Test Script and Waveform Results 


### Bugs Found and Fixes
No bugs found.



















