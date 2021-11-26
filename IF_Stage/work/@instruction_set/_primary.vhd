library verilog;
use verilog.vl_types.all;
entity Instruction_set is
    port(
        address         : in     vl_logic_vector(31 downto 0);
        instructionOut  : out    vl_logic_vector(31 downto 0)
    );
end Instruction_set;
