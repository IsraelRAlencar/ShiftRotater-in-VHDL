library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
    port (
        i0, i1: in std_logic;
        sel: in std_logic;
        s: out std_logic
    );
end entity;

architecture behavioral of mux2 is
begin
    s <= i0 when sel = '0' else i1;
end architecture;
