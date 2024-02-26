
library ieee;
use ieee.std_logic_1164.all;

entity partC is
generic(N : integer := 16);
port (
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
    sel: in std_logic_vector(3 downto 0);
    F: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end entity partC;

architecture partC_arch of partC is
begin
    F(N-1 downto 1) <= A(N-2 downto 0) when sel = "1000" -- F = Logic shift left A, Cout = shifted bit
    else A(N-2 downto 0) when sel = "1001"              -- F = Rotate left A, Cout = rotated bit
    else A(N-2 downto 0) when sel = "1010"              -- F = Rotate Left A with carry (cin), Cout = rotated bit
    else (others => '0') when sel = "1011"             -- F = 0000, Cout = 0
    else (others => '0'); 

    F(0) <= '0' when sel = "1000"
    else A(N-1) when sel = "1001"
    else Cin when sel = "1010"
    else '0' when sel = "1011"
    else '0';

    Cout <= A(N-1) when sel = "1000"
    else A(N-1) when sel = "1001"
    else A(N-1) when sel = "1010"
    else '0' when sel = "1011"
    else '0';
end architecture partC_arch;

