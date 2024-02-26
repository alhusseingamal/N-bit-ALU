
Library ieee;
use ieee.std_logic_1164.all;

entity partD_tb is
end entity partD_tb;

architecture partD_tb of partD_tb is
constant N: integer := 16;

component partD is

port(
	A, B: in std_logic_vector(N-1 downto 0);
	Cin: in std_logic;
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end component;

signal A : std_logic_vector (N-1 downto 0);
signal B : std_logic_vector (N-1 downto 0);
signal Cin : std_logic;
signal sel : std_logic_vector (3 downto 0);

signal F : std_logic_vector (N-1 downto 0);
signal Cout : std_logic;

begin

dut: partD port map (A, B, Cin, sel, F, Cout);

-- generate test stimulus

stimulus:
process begin

A <= x"000F";
sel <= "1100";
Cin <= '-';
wait for 2 ps;

A <= x"0F0F";
sel <= "1101";
Cin <= '0';
wait for 2 ps;

sel <= "1110";
wait for 2 ps;

A <= x"F000";
sel <= "1111";
Cin <= '-';
wait for 2 ps;

A <= x"0F00";
sel <= "1110";
Cin <= '1';
wait for 2 ps;

wait;

end process stimulus;
end architecture partD_tb;

