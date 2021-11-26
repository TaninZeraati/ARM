library verilog;
use verilog.vl_types.all;
entity Instrcution_set is
    port(
        address         : in     vl_logic_vector(31 downto 0);
        instructionOut  : out    vl_logic_vector(31 downto 0)
    );
end Instrcution_set;
