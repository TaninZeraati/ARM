library verilog;
use verilog.vl_types.all;
entity ID_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Instruction     : in     vl_logic_vector(31 downto 0);
        Result_WB       : in     vl_logic_vector(31 downto 0);
        writeBackEn     : in     vl_logic;
        Dest_wb         : in     vl_logic_vector(3 downto 0);
        hazard          : in     vl_logic;
        SR              : in     vl_logic_vector(3 downto 0);
        WB_EN           : out    vl_logic;
        MEM_R_EN        : out    vl_logic;
        MEM_W_EN        : out    vl_logic;
        B               : out    vl_logic;
        S               : out    vl_logic;
        EXE_CMD         : out    vl_logic_vector(3 downto 0);
        Val_Rn          : out    vl_logic_vector(31 downto 0);
        Val_Rm          : out    vl_logic_vector(31 downto 0);
        imm             : out    vl_logic;
        Shift_operand   : out    vl_logic_vector(11 downto 0);
        Signed_imm_24   : out    vl_logic_vector(23 downto 0);
        Dest            : out    vl_logic_vector(3 downto 0);
        src1            : out    vl_logic_vector(3 downto 0);
        src2            : out    vl_logic_vector(3 downto 0);
        Two_src         : out    vl_logic;
        Rn_is_valid     : out    vl_logic
    );
end ID_Stage;
