library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        EXE_CMD         : in     vl_logic_vector(3 downto 0);
        c               : in     vl_logic;
        w               : out    vl_logic_vector(31 downto 0);
        SR              : out    vl_logic_vector(3 downto 0)
    );
end ALU;
