library verilog;
use verilog.vl_types.all;
entity Val2Generator is
    port(
        Val_Rm          : in     vl_logic_vector(31 downto 0);
        Shift_operand   : in     vl_logic_vector(11 downto 0);
        imm             : in     vl_logic;
        MEM             : in     vl_logic;
        Val2            : out    vl_logic_vector(31 downto 0)
    );
end Val2Generator;
