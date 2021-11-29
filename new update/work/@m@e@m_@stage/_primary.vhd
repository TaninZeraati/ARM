library verilog;
use verilog.vl_types.all;
entity MEM_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        MEMread         : in     vl_logic;
        MEMwrite        : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        data            : in     vl_logic_vector(31 downto 0);
        MEMresult       : out    vl_logic_vector(31 downto 0)
    );
end MEM_Stage;
