library verilog;
use verilog.vl_types.all;
entity ID_Stage_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        WB_EN_IN        : in     vl_logic;
        MEM_R_EN_IN     : in     vl_logic;
        MEM_W_EN_IN     : in     vl_logic;
        B_IN            : in     vl_logic;
        S_IN            : in     vl_logic;
        EXE_CMD_IN      : in     vl_logic_vector(3 downto 0);
        PC_IN           : in     vl_logic_vector(31 downto 0);
        Val_Rn_IN       : in     vl_logic_vector(31 downto 0);
        Val_Rm_IN       : in     vl_logic_vector(31 downto 0);
        imm_IN          : in     vl_logic;
        Shift_operand_IN: in     vl_logic_vector(11 downto 0);
        Signed_imm_24_IN: in     vl_logic_vector(23 downto 0);
        Dest_IN         : in     vl_logic_vector(3 downto 0);
        WB_EN           : out    vl_logic;
        MEM_R_EN        : out    vl_logic;
        MEM_W_EN        : out    vl_logic;
        B               : out    vl_logic;
        S               : out    vl_logic;
        EXE_CMD         : out    vl_logic_vector(3 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        Val_Rn          : out    vl_logic_vector(31 downto 0);
        Val_Rm          : out    vl_logic_vector(31 downto 0);
        imm             : out    vl_logic;
        Shift_operand   : out    vl_logic_vector(11 downto 0);
        Signed_imm_24   : out    vl_logic_vector(23 downto 0);
        Dest            : out    vl_logic_vector(3 downto 0)
    );
end ID_Stage_Reg;
