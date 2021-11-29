library verilog;
use verilog.vl_types.all;
entity Data_Mem is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Memwf           : in     vl_logic;
        MemRead         : in     vl_logic;
        add             : in     vl_logic_vector(31 downto 0);
        Memwdata        : in     vl_logic_vector(31 downto 0);
        R               : out    vl_logic_vector(31 downto 0)
    );
end Data_Mem;
