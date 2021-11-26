`timescale 1ns/1ns

module ARM_datapath(input clk ,rst);

  wire status_enable, flush;
  wire [3: 0] status_exe_out, status_reg;
  wire hazard_detected = 1'b0;
  
  /*
  StatusRegister statusRegister(.clk(clk),
                                .rst(rst),
                                .enable(status_enable),
                                .status_in(status_exe_out),
                                .status_out(status_reg));
  */

  wire branch_if_in = 1'b0;
  assign flush = branch_if_in;

  wire [31: 0] instruction_if_out, pc_out_if;
  wire [31:0] branch_address_exe_out = 32'b0;
  IF_Stage if_stage(.clk(clk),
                  .rst(rst),
                  .freeze(hazard_detected),
                  .Branch_taken(branch_if_in),
                  .BranchAddr(branch_address_exe_out),
                  .Instruction(instruction_if_out),
                  .PC_if(pc_out_if));

  wire [31: 0] pc_in_id, pc_id_out, instruction_id_in;
  IF_IDReg if_id (.clk(clk),
              .rst(rst),
              .pc_in(pc_out_if),
              .instruction_in(instruction_if_out),
              .pc(pc_in_id),
              .instruction(instruction_id_in));
              
  wire wb_en_id_in, status_en_id_out, mem_read_id_out, mem_write_id_out,
       branch_id_out, I_id_out, two_src;
  wire [3: 0] dest_id_in, alu_command_id_out, dest_id_out, src1, src2;
  wire [11: 0] shifter_operand_id_out;
  wire [23: 0] b_signed_imm_id_out;
  wire [31: 0] wb_data_id_in, reg1_id_out, reg2_id_out;  
  
  IDSTAGE idSTAGE(.clk(clk),
                  .rst(rst),
                  .write_back_en(wb_en_id_in),
                  .hazard(hazard_detected),
                  .pc_in(pc_in_id),
                  .instruction(instruction_id_in),
                  .reg_data_wb(wb_data_id_in),
                  .dest_wb(dest_id_in),
                  .status(status_reg),
                  .pc(pc_id_out),
                  .reg1(reg1_id_out),
                  .reg2(reg2_id_out),
                  .aluCommand(alu_command_id_out),
                  .dest(dest_id_out),
                  .src1(src1),
                  .src2(src2),
                  .status_en(status_en_id_out),
                  .mem_read(mem_read_id_out),
                  .mem_write(mem_write_id_out),
                  .wb_en(wb_en_id_out),
                  .branch(branch_id_out),
                  .I(I_id_out),
                  .two_src(two_src),
                  .b_signed_imm(b_signed_imm_id_out),
                  .shifter_operand(shifter_operand_id_out));

  wire mem_read_exe_in, mem_write_exe_in, wb_en_id_mem;
  wire [3: 0] alu_command_exe_in, dest_id_mem, status_exe_in, src1_exe_in, src2_exe_in;
  wire [11: 0] shifter_operand_exe_in;
  wire [23: 0] b_signed_imm_exe_in;
  wire[31: 0] pc_exe_in, pc_out_exe, reg1_exe_in, reg2_exe_in;

  ID_EXEReg id_exe(.clk(clk),
                .rst(rst),
                .flush(flush),
                .status_en_in(status_en_id_out),
                .mem_read_in(mem_read_id_out),
                .mem_write_in(mem_write_id_out),
                .wb_en_in(wb_en_id_out),
                .branch_in(branch_id_out),
                .I_in(I_id_out),
                .pc_in(pc_id_out),
                .reg1_in(reg1_id_out),
                .reg2_in(reg2_id_out),
                .aluCommand_in(alu_command_id_out),
                .dest_in(dest_id_out),
                .status_in(status_reg),
                .src1_in(src1),
                .src2_in(src2),
                .b_signed_imm_in(b_signed_imm_id_out),
                .shifter_operand_in(shifter_operand_id_out),
                .status_en_out(status_enable),
                .mem_read_out(mem_read_exe_in),
                .mem_write_out(mem_write_exe_in),
                .wb_en_out(wb_en_id_mem),
                .branch_out(branch_if_in),
                .I_out(I_exe_in),
                .pc_out(pc_exe_in),
                .reg1_out(reg1_exe_in),
                .reg2_out(reg2_exe_in),
                .aluCommand_out(alu_command_exe_in),
                .dest_out(dest_id_mem),
                .status_out(status_exe_in),
                .src1_out(src1_exe_in),
                .src2_out(src2_exe_in),
                .b_signed_imm_out(b_signed_imm_exe_in),
                .shifter_operand_out(shifter_operand_exe_in));




  wire [31: 0] pc_mem_out, instruction_mem_out;
  
  EXE_MEMReg exe_mem(.clk(clk),
                .rst(rst),
                .pc_in(pc_exe_out),
                .instruction_in(instruction_exe_out),
                .pc(pc_mem_out),
                .instruction(instruction_mem_out));

  
  wire [31: 0] pc_wb_out, instruction_wb_out;
  
  MEM_WBReg mem_wb(.clk(clk),
                .rst(rst),
                .pc_in(pc_mem_out),
                .instruction_in(instruction_mem_out),
                .pc(pc_wb_out),
                .instruction(instruction_wb_out));



endmodule

