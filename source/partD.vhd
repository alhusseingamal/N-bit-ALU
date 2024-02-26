
library ieee;
use ieee.std_logic_1164.all;

entity partD is
generic(N : integer := 16);
port (
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
    sel: in std_logic_vector(3 downto 0);
    F: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end entity partD;

-- sel = "1100" : F = Logic shift right A, Cout = shifted bit
-- sel = "1101" : F = Rotate right A, Cout = rotated bit
-- sel = "1110" : F = Rotate right A with carry (cin), Cout = rotated bit
-- sel = "1111" : F = Arithmetic Shift right A

architecture partD_arch of partD is

begin
    F(N-2 downto 0) <= A(N-1 downto 1) when sel = "1100"
    else A(N-1 downto 1) when sel = "1101"             
    else A(N-1 downto 1) when sel = "1110"             
    else A(N-1 downto 1) when sel = "1111"
    else (others => '0'); 

    F(N-1) <= '0' when sel = "1100"
    else A(0) when sel = "1101"
    else Cin when sel = "1110"
    else A(N-1) when sel = "1111"
    else '0';

    Cout <= A(0) when sel = "1100"
    else A(0) when sel = "1101"
    else A(0) when sel = "1110"
    else '0' when sel = "1111"
    else '0';
end architecture partD_arch;



