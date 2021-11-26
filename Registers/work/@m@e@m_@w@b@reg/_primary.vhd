library verilog;
use verilog.vl_types.all;
entity MEM_WBReg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wb_en_in        : in     vl_logic;
        mem_read_in     : in     vl_logic;
        dest_in         : in     vl_logic_vector(3 downto 0);
        alu_result_in   : in     vl_logic_vector(31 downto 0);
        mem_data_in     : in     vl_logic_vector(31 downto 0);
        wb_en_out       : out    vl_logic;
        mem_read_out    : out    vl_logic;
        dest_out        : out    vl_logic_vector(3 downto 0);
        mem_data_out    : out    vl_logic_vector(31 downto 0);
        alu_result_out  : out    vl_logic_vector(31 downto 0)
    );
end MEM_WBReg;
