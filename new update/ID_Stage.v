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
                output Two_src,hasRn);
    
    wire [1:0] mode;            
    wire [3:0] cond,opcode,Rn,Rm,_src2,_EXE_CMD;
    wire s,_MEM_R_EN,_MEM_W_EN,_WB_EN,_B,_S,res,resORhazard,nimm,__MEM_R_EN;
    
    assign mode=Instruction[27:26];
    assign cond=Instruction[31:28];
    assign opcode=Instruction[24:21];
    assign Rn=Instruction[19:16]; assign Rm=Instruction[3:0]; assign Dest=Instruction[15:12];
    assign s=Instruction[20]; assign imm=Instruction[25];
    assign Shift_operand=Instruction[11:0];
    assign Signed_imm_24=Instruction[23:0];
    assign src1=Rn; assign src2=_src2;
    assign __MEM_W_EN=MEM_W_EN;
    
    Mux#(4) _m(Rm,Dest,_MEM_W_EN,_src2); 
                
    RegisterFile rf(clk,rst,Rn,_src2,Dest_wb,Result_WB,writeBackEn,Val_Rn,Val_Rm);
    ControlUnit cu(mode,opcode,s,_EXE_CMD,_MEM_R_EN,_MEM_W_EN,_WB_EN,_B,_S,hasRn);
    ConditionCheck cc(cond,SR,res);
    Mux#(9) m(9'b000000000,{_EXE_CMD,_MEM_R_EN,_MEM_W_EN,_WB_EN,_B,_S},resORhazard,{EXE_CMD,MEM_R_EN,MEM_W_EN,WB_EN,B,S});
    not n(nimm,imm);
    or o(Two_src,nimm,__MEM_W_EN); 
    and a(resORhazard,res,!hazard);  
      
endmodule