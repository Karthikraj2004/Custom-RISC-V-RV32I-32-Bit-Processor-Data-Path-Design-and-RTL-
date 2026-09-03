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







