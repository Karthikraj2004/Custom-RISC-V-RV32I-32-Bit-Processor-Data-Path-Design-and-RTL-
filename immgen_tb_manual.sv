`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2026 03:12:08 PM
// Design Name: 
// Module Name: immgen_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module immgen_tb ; 

  logic [31:0] instruction ; 
  logic [31:0] imm ; 
  
  ImmGen immgen_dut(
   .instruction(instruction), 
   .imm(imm)
  ); 
  
  initial begin 
  
  // 1st test case with I-type
  instruction = 32'b0 ;
  instruction[31:20] = 12'd7 ;
  instruction[6:0] = 7'b0010011;
  #10; 
  
  // 2nd test case with negative I-type
  instruction = 32'b0 ; 
  instruction[31:20] = -12'sd8 ;
  instruction[6:0] = 7'b0010011;
  #10 ; 
  
  // 3rd test case for LW instruction using I-type format
  instruction = 32'b0 ; 
  instruction[31:20] = 12'd10 ; 
  instruction[6:0] = 7'b0000011 ; 
  #10; 
  
  // 4th test case for SW instruction using S-type format 
  instruction = 32'b0 ; 
  instruction[31:25] = 7'b0000001 ; 
  instruction[11:7] = 5'b10010 ;
  instruction[6:0] = 7'b0100011 ; 
  #10; 
  
  //5th test case for SW instruction using negative SW immediate (-50)
  instruction = 32'b0 ; 
  instruction[31:25] = 7'b1111110 ; 
  instruction[11:7] = 5'b01110 ;
  instruction[6:0] = 7'b0100011 ; 
  #10; 
  
  //6th test case: BEQ with branch offset = +100
  instruction = 32'b0 ; 
  instruction[31] = 1'b0 ; 
  instruction[7] = 1'b0 ; 
  instruction[30:25] = 6'b000011; 
  instruction[11:8] = 4'b0010; 
  instruction[6:0]   = 7'b1100011;
  #10; 
  
  //7th test case : default testing 
  instruction = 32'hFFFF_FFFF ; 
  instruction[6:0] = 7'b1111000 ; 
  #10 ; 
  
  end
  
  
endmodule
