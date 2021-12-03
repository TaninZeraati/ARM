module HazardDetectionUnit(input [3:0] src1,src2,
                            input Two_Src,Rn_is_valid,
                            input [3:0] Exe_Dest,
                            input Exe_WB_EN,
                            input [3:0] Mem_Dest,
                            input Mem_WB_EN,
                            output Hazard_Detected);
                            
  reg execution_stage_hazard,memory_stage_hazard;
  
  always@(*) begin
    execution_stage_hazard=1'b0;
    memory_stage_hazard=1'b0;
    
    if(Exe_WB_EN) begin
      if((src1==Exe_Dest && Rn_is_valid) || (src2==Exe_Dest && Two_Src))
        execution_stage_hazard=1'b1;
    end
    
    if(Mem_WB_EN) begin
      if((src1==Mem_Dest && Rn_is_valid) || (src2==Mem_Dest && Two_Src))
        memory_stage_hazard=1'b1;
    end
  end
  
  or _or(Hazard_Detected,execution_stage_hazard,memory_stage_hazard);
  
endmodule