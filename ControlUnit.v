module ControlUnit(input [1:0] mode,
                   input [3:0] opcode,
                   input s,
                   output reg [3:0] EXE_CMD,
                   output reg memory_read_en,memory_write_en,WB_Enable,B,S,Rn_is_valid);
  
  always@(*)begin
    if(mode==2'b00) begin
      if(opcode==4'b1101) begin  
        EXE_CMD=4'b0001;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b0;
      end
      else if(opcode==4'b1111) begin
        EXE_CMD=4'b1001;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b0;
      end
      else if(opcode==4'b0100) begin
        EXE_CMD=4'b0010;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b0101) begin
        EXE_CMD=4'b0011;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b0010) begin
        EXE_CMD=4'b0100;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b0110) begin
        EXE_CMD=4'b0101;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b0000) begin
        EXE_CMD=4'b0110;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b1100) begin
        EXE_CMD=4'b0111;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b0001) begin
        EXE_CMD=4'b1000;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=s;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b1010) begin
        EXE_CMD=4'b0100;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b0;
        B=1'b0;
        S=1'b1;
        Rn_is_valid=1'b1;
      end
      else if(opcode==4'b1000) begin
        EXE_CMD=4'b0110;
        memory_read_en=1'b0;
        memory_write_en=1'b0;
        WB_Enable=1'b0;
        B=1'b0;
        S=1'b1;
        Rn_is_valid=1'b1;
      end
    end
    else if(mode==2'b01 && opcode==4'b0100) begin
      if(s==1'b1) begin
        EXE_CMD=3'b0010;
        memory_read_en=1'b1;
        memory_write_en=1'b0;
        WB_Enable=1'b1;
        B=1'b0;
        S=1'b0;
        Rn_is_valid=1'b1;
      end
      else if(s==1'b0) begin
        EXE_CMD=3'b0010;
        memory_read_en=1'b0;
        memory_write_en=1'b1;
        WB_Enable=1'b0;
        B=1'b0;
        S=1'b0;
        Rn_is_valid=1'b1;
      end
    end
    else if(mode==2'b10) begin
      memory_read_en=1'b0;
      memory_write_en=1'b0;
      WB_Enable=1'b0;
      B=1'b1;
      S=1'b0;
      Rn_is_valid=1'b0;
    end
  end
  
endmodule
