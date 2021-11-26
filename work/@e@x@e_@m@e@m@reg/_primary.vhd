library verilog;
use verilog.vl_types.all;
entity EXE_MEMReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pc_in           : in     vl_logic_vector(31 downto 0);
        instruction_in  : in     vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end EXE_MEMReg;