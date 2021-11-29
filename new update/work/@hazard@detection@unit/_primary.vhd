library verilog;
use verilog.vl_types.all;
entity HazardDetectionUnit is
    port(
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        Two_Src         : in     vl_logic;
        hasRn           : in     vl_logic;
        Exe_Dest        : in     vl_logic_vector(3 downto 0);
        Exe_WB_EN       : in     vl_logic;
        Mem_Dest        : in     vl_logic_vector(3 downto 0);
        Mem_WB_EN       : in     vl_logic;
        Hazard_Detected : out    vl_logic
    );
end HazardDetectionUnit;
