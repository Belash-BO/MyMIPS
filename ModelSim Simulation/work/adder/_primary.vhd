library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        PC              : in     vl_logic_vector(29 downto 0);
        PC_plus_4       : out    vl_logic_vector(29 downto 0)
    );
end adder;
