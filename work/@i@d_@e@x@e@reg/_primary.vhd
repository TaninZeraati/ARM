library verilog;
use verilog.vl_types.all;
entity ID_EXEReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        flush           : in     vl_logic;
        status_en_in    : in     vl_logic;
        mem_read_in     : in     vl_logic;
        mem_write_in    : in     vl_logic;
        wb_en_in        : in     vl_logic;
        branch_in       : in     vl_logic;
        I_in            : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        reg1_in         : in     vl_logic_vector(31 downto 0);
        reg2_in         : in     vl_logic_vector(31 downto 0);
        aluCommand_in   : in     vl_logic_vector(3 downto 0);
        dest_in         : in     vl_logic_vector(3 downto 0);
        status_in       : in     vl_logic_vector(3 downto 0);
        src1_in         : in     vl_logic_vector(3 downto 0);
        src2_in         : in     vl_logic_vector(3 downto 0);
        b_signed_imm_in : in     vl_logic_vector(23 downto 0);
        shifter_operand_in: in     vl_logic_vector(11 downto 0);
        status_en_out   : out    vl_logic;
        mem_read_out    : out    vl_logic;
        mem_write_out   : out    vl_logic;
        wb_en_out       : out    vl_logic;
        branch_out      : out    vl_logic;
        I_out           : out    vl_logic;
        pc_out          : out    vl_logic_vector(31 downto 0);
        reg1_out        : out    vl_logic_vector(31 downto 0);
        reg2_out        : out    vl_logic_vector(31 downto 0);
        aluCommand_out  : out    vl_logic_vector(3 downto 0);
        dest_out        : out    vl_logic_vector(3 downto 0);
        status_out      : out    vl_logic_vector(3 downto 0);
        src1_out        : out    vl_logic_vector(3 downto 0);
        src2_out        : out    vl_logic_vector(3 downto 0);
        b_signed_imm_out: out    vl_logic_vector(23 downto 0);
        shifter_operand_out: out    vl_logic_vector(11 downto 0)
    );
end ID_EXEReg;