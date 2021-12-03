library verilog;
use verilog.vl_types.all;
entity EXE_Stage is
    port(
        clk             : in     vl_logic;
        EXE_CMD         : in     vl_logic_vector(3 downto 0);
        MEM_R_EN        : in     vl_logic;
        MEM_W_EN        : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        Val_Rn          : in     vl_logic_vector(31 downto 0);
        Val_Rm          : in     vl_logic_vector(31 downto 0);
        imm             : in     vl_logic;
        Shift_operand   : in     vl_logic_vector(11 downto 0);
        Signed_imm_24   : in     vl_logic_vector(23 downto 0);
        SR              : in     vl_logic_vector(3 downto 0);
        ALU_result      : out    vl_logic_vector(31 downto 0);
        Br_addr         : out    vl_logic_vector(31 downto 0);
        status          : out    vl_logic_vector(3 downto 0)
    );
end EXE_Stage;
