library verilog;
use verilog.vl_types.all;
entity PC_Handler is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        freeze          : in     vl_logic;
        Branch_taken    : in     vl_logic;
        BranchAddr      : in     vl_logic_vector(31 downto 0);
        buffered_pc     : out    vl_logic_vector(31 downto 0)
    );
end PC_Handler;
