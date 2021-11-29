library verilog;
use verilog.vl_types.all;
entity StatusRegister is
    port(
        newStatus       : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        status          : out    vl_logic_vector(3 downto 0)
    );
end StatusRegister;
