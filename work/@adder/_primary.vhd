library verilog;
use verilog.vl_types.all;
entity Adder is
    generic(
        n               : vl_notype
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 5;
end Adder;
