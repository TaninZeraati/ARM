module HazardDetectionUnit(input [3:0] src1,src2,
                            input Two_Src,hasRn,
                            input [3:0] Exe_Dest,
                            input Exe_WB_EN,
                            input [3:0] Mem_Dest,
                            input Mem_WB_EN,
                            output Hazard_Detected);
                            
  reg memHazard,exeHazard;
  
  always@(*) begin
    exeHazard=1'b0;
    memHazard=1'b0;
    if(Exe_WB_EN) begin
      if((src1==Exe_Dest && hasRn) || (src2==Exe_Dest && Two_Src))
        exeHazard=1'b1;
      //else
      //  exeHazard=1'b0;
    end
    if(Mem_WB_EN) begin
      if((src1==Mem_Dest && hasRn) || (src2==Mem_Dest && Two_Src))
        memHazard=1'b1;
      //else
      //  memHazard=1'b0;
    end
  end
  
  or o(Hazard_Detected,exeHazard,memHazard);
  
endmodule