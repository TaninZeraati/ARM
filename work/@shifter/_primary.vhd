library verilog;
use verilog.vl_types.all;
entity Shifter is
    port(
        Val_Rm          : in     vl_logic_vector(31 downto 0);
        operand_of_shift: in     vl_logic_vector(11 downto 0);
        immediate       : in     vl_logic;
        mem_type        : in     vl_logic;
        second_value    : out    vl_logic_vector(31 downto 0)
    );
end Shifter;
