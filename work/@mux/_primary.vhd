library verilog;
use verilog.vl_types.all;
entity Mux is
    generic(
        n               : integer := 9
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        selector        : in     vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end Mux;
