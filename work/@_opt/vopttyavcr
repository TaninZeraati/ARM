library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        mode            : in     vl_logic_vector(1 downto 0);
        op_code         : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        alu_command     : out    vl_logic_vector(3 downto 0);
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        wb_en           : out    vl_logic;
        branch          : out    vl_logic;
        status_en       : out    vl_logic
    );
end ControlUnit;
