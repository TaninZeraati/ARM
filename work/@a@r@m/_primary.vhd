library verilog;
use verilog.vl_types.all;
entity ARM is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IF_Stage_pc     : out    vl_logic_vector(31 downto 0)
    );
end ARM;
