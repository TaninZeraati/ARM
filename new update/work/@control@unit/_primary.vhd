library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        mode            : in     vl_logic_vector(1 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        EXE_CMD         : out    vl_logic_vector(3 downto 0);
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        WB_Enable       : out    vl_logic;
        B               : out    vl_logic;
        \S\             : out    vl_logic;
        hasRn           : out    vl_logic
    );
end ControlUnit;
