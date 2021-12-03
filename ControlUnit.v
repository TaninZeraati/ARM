module ControlUnit(input [1:0] mode,
                   input [3:0] opcode,
                   input s,
                   output reg [3:0] EXE_CMD,
                   output reg mem_read_w,mem_write_w,enable_wb,B,S,Rn_valid);
  
  always@(*)begin
    if(mode==2'b00) begin  //Arithmetihc Type
      if(opcode==4'b1101) begin //MOV  
        EXE_CMD=4'b0001;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b0;
      end
      else if(opcode==4'b1111) begin  //MVN
        EXE_CMD=4'b1001;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b0;
      end
      else if(opcode==4'b0100) begin  //ADD
        EXE_CMD=4'b0010;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b0101) begin  //ADC
        EXE_CMD=4'b0011;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b0010) begin  //SUB
        EXE_CMD=4'b0100;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b0110) begin  //SBC
        EXE_CMD=4'b0101;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b0000) begin  //AND
        EXE_CMD=4'b0110;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b1100) begin  //ORR
        EXE_CMD=4'b0111;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b0001) begin  //EOR
        EXE_CMD=4'b1000;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=s;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b1010) begin  //CMP
        EXE_CMD=4'b0100;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b0;
        B=1'b0;
        S=1'b1;
        Rn_valid=1'b1;
      end
      else if(opcode==4'b1000) begin  //TST
        EXE_CMD=4'b0110;
        mem_read_w=1'b0;
        mem_write_w=1'b0;
        enable_wb=1'b0;
        B=1'b0;
        S=1'b1;
        Rn_valid=1'b1;
      end
    end
    else if(mode==2'b01 && opcode==4'b0100) begin  //Mrmory Type
      if(s==1'b1) begin  //LDR
        EXE_CMD=3'b0010;
        mem_read_w=1'b1;
        mem_write_w=1'b0;
        enable_wb=1'b1;
        B=1'b0;
        S=1'b0;
        Rn_valid=1'b1;
      end
      else if(s==1'b0) begin //STR
        EXE_CMD=3'b0010;
        mem_read_w=1'b0;
        mem_write_w=1'b1;
        enable_wb=1'b0;
        B=1'b0;
        S=1'b0;
        Rn_valid=1'b1;
      end
    end
    else if(mode==2'b10) begin //B
      mem_read_w=1'b0;
      mem_write_w=1'b0;
      enable_wb=1'b0;
      B=1'b1;
      S=1'b0;
      Rn_valid=1'b0;
    end
  end
  
endmodule