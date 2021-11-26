library verilog;
use verilog.vl_types.all;
entity IDSTAGE is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        write_back_en   : in     vl_logic;
        hazard          : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        reg_data_wb     : in     vl_logic_vector(31 downto 0);
        dest_wb         : in     vl_logic_vector(3 downto 0);
        status          : in     vl_logic_vector(3 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        reg1            : out    vl_logic_vector(31 downto 0);
        reg2            : out    vl_logic_vector(31 downto 0);
        aluCommand      : out    vl_logic_vector(3 downto 0);
        dest            : out    vl_logic_vector(3 downto 0);
        src1            : out    vl_logic_vector(3 downto 0);
        src2            : out    vl_logic_vector(3 downto 0);
        status_en       : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        wb_en           : out    vl_logic;
        branch          : out    vl_logic;
        I               : out    vl_logic;
        two_src         : out    vl_logic;
        b_signed_imm    : out    vl_logic_vector(23 downto 0);
        shifter_operand : out    vl_logic_vector(11 downto 0)
    );
end IDSTAGE;
