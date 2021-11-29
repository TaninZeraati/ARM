library verilog;
use verilog.vl_types.all;
entity Mux is
    generic(
        b               : integer := 9
    );
    port(
        A               : in     vl_logic_vector;
        \B\             : in     vl_logic_vector;
        s               : in     vl_logic;
        w               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of b : constant is 1;
end Mux;
