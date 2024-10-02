library ieee;
use ieee.std_logic_1164.all;

entity shiftrotater is
    port (
        din:    in std_logic_vector(3 downto 0);
        desloc: in std_logic_vector(1 downto 0);
        shift:  in std_logic;
        dout:   out std_logic_vector(3 downto 0)
    );
end entity;

architecture structural of shiftrotater is
    signal wo : std_logic_vector(3 downto 0);
    signal o : std_logic_vector(2 downto 0);
    signal i : std_logic_vector(2 downto 0);
begin

    m2x1: entity work.mux2(behavioral)
        port map(i0 => din(0), i1 => din(3), sel => desloc(0), s => wo(0));

    m2x2: entity work.mux2(behavioral)
        port map(i0 => din(1), i1 => din(0), sel => desloc(0), s => wo(1));

    m2x3: entity work.mux2(behavioral)
        port map(i0 => din(2), i1 => din(1), sel => desloc(0), s => wo(2));

    m2x4: entity work.mux2(behavioral)
        port map(i0 => din(3), i1 => din(2), sel => desloc(0), s => wo(3));

    m2x5: entity work.mux2(behavioral)
        port map(i0 => wo(3), i1 => wo(1), sel => desloc(1), s => dout(3));

    m2x6: entity work.mux2(behavioral)
        port map(i0 => wo(2), i1 => wo(0), sel => desloc(1), s => o(2));

    m2x7: entity work.mux2(behavioral)
        port map(i0 => wo(1), i1 => wo(3), sel => desloc(1), s => o(1));

    m2x8: entity work.mux2(behavioral)
        port map(i0 => wo(0), i1 => wo(2), sel => desloc(1), s => o(0));
    
    i(0) <= shift and (desloc(0) or desloc(1));
    i(1) <= shift and desloc(1);
    i(2) <= shift and (desloc(0) and desloc(1));
    
    m2o0: entity work.mux2(behavioral)
        port map(i0 => o(0), i1 => '0', sel => i(0), s => dout(0));

    m2o1: entity work.mux2(behavioral)
        port map(i0 => o(1), i1 => '0', sel => i(1), s => dout(1));

    m2o2: entity work.mux2(behavioral)
        port map(i0 => o(2), i1 => '0', sel => i(2), s => dout(2));

end architecture;
