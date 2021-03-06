module ID_Stage(input clk,rst,
                input [31:0] Instruction,Result_WB,
                input writeBackEn,
                input [3:0] Dest_wb,
                input hazard,
                input [3:0] SR,
                
                output WB_EN,MEM_R_EN,MEM_W_EN,B,S,
                output [3:0] EXE_CMD,
                output [31:0] Val_Rn,Val_Rm,
                output imm,
                output [11:0] Shift_operand,
                output [23:0] Signed_imm_24,
                output [3:0] Dest,src1,src2,
                output Two_src,Rn_is_valid);
    
    wire [3:0] pre_EXE_CMD;
    
    assign Dest=Instruction[15:12];
    assign s=Instruction[20];
    assign imm=Instruction[25];
    assign Shift_operand=Instruction[11:0];
    assign Signed_imm_24=Instruction[23:0];
    assign src1=Instruction[19:16];
                
    RegisterFile register_file(.clk(clk),
          .rst(rst),
          .src1(src1),
          .src2(src2),
          .Dest_wb(Dest_wb),
          .Result_WB(Result_WB),
          .writeBackEn(writeBackEn),
          .reg1(Val_Rn),
          .reg2(Val_Rm));
    ControlUnit control_unit(.mode(Instruction[27:26]),
          .opcode(Instruction[24:21]),
          .s(s),
          .EXE_CMD(pre_EXE_CMD),
          .memory_read_en(pre_MEM_R_EN),
          .memory_write_en(pre_MEM_W_EN),
          .WB_Enable(pre_WB_EN),
          .B(pre_B),
          .S(pre_S),
          .Rn_is_valid(Rn_is_valid));
    ConditionCheck condition_check(.condition(Instruction[31:28]),
          .SR(SR),
          .condition_check_result(condition_check_result));
    
    not _not(imm_not,imm);
    or _or(Two_src,imm_not,pre_MEM_W_EN); 
    and _and(control_signal_selector,condition_check_result,!hazard);
    
    Mux#(4) _mux1(.a(Instruction[3:0]),
          .b(Dest),
          .selector(pre_MEM_W_EN),
          .result(src2));
    Mux#(9) _mux2(.a(9'b000000000),
          .b({pre_EXE_CMD,pre_MEM_R_EN,pre_MEM_W_EN,pre_WB_EN,pre_B,pre_S}),
          .selector(control_signal_selector),
          .result({EXE_CMD,MEM_R_EN,MEM_W_EN,WB_EN,B,S}));
      
endmodule
