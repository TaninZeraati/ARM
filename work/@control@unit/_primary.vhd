library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        mode            : in     vl_logic_vector(1 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        EXE_CMD         : out    vl_logic_vector(3 downto 0);
        memory_read_en  : out    vl_logic;
        memory_write_en : out    vl_logic;
        WB_Enable       : out    vl_logic;
        B               : out    vl_logic;
        \S\             : out    vl_logic;
        Rn_is_valid     : out    vl_logic
    );
end ControlUnit;
