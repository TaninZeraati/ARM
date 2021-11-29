library verilog;
use verilog.vl_types.all;
entity Adder is
    generic(
        b               : vl_notype
    );
    port(
        A               : in     vl_logic_vector;
        \B\             : in     vl_logic_vector;
        W               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of b : constant is 5;
end Adder;
