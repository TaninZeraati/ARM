library verilog;
use verilog.vl_types.all;
entity EXE_Stage_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        WB_en_in        : in     vl_logic;
        MEM_R_EN_in     : in     vl_logic;
        MEM_W_EN_in     : in     vl_logic;
        ALU_result_in   : in     vl_logic_vector(31 downto 0);
        ST_val_in       : in     vl_logic_vector(31 downto 0);
        Dest_in         : in     vl_logic_vector(3 downto 0);
        WB_en           : out    vl_logic;
        MEM_R_EN        : out    vl_logic;
        MEM_W_EN        : out    vl_logic;
        ALU_result      : out    vl_logic_vector(31 downto 0);
        ST_val          : out    vl_logic_vector(31 downto 0);
        Dest            : out    vl_logic_vector(3 downto 0)
    );
end EXE_Stage_Reg;
