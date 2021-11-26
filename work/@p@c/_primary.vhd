library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        write_en        : in     vl_logic;
        pc_next         : in     vl_logic_vector(31 downto 0);
        PC_if           : out    vl_logic_vector(31 downto 0)
    );
end PC;
