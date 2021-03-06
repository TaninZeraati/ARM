library verilog;
use verilog.vl_types.all;
entity Shifter is
    port(
        Val_Rm          : in     vl_logic_vector(31 downto 0);
        Shift_operand   : in     vl_logic_vector(11 downto 0);
        imm             : in     vl_logic;
        memory_type_instruction: in     vl_logic;
        alu_b           : out    vl_logic_vector(31 downto 0)
    );
end Shifter;
