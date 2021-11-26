library verilog;
use verilog.vl_types.all;
entity HazardDetectionUnit is
    port(
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        Exe_Dest        : in     vl_logic_vector(3 downto 0);
        Mem_Dest        : in     vl_logic_vector(3 downto 0);
        Exe_WB_EN       : in     vl_logic;
        Mem_WB_EN       : in     vl_logic;
        two_src         : in     vl_logic;
        mem_read_en     : in     vl_logic;
        ignore          : in     vl_logic;
        hazard_detected : out    vl_logic
    );
end HazardDetectionUnit;
