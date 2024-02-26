
Library ieee;
use ieee.std_logic_1164.all;

entity partC_tb is
end entity partC_tb;

architecture partC_tb of partC_tb is
constant N: integer := 16;

component partC is
generic(N : integer := 16);
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

dut: partC port map (A, B, Cin, sel, F, Cout);

-- generate test stimulus

stimulus:
process begin

A <= x"A00A";
sel <= "1000";
Cin <= '-';
wait for 2 ps;

A <= x"000A";
wait for 2 ps;

sel <= "1001";
A <= x"B00C";
wait for 2 ps;

A <= x"000C";
wait for 2 ps;

A <= x"A00A";
sel <= "1010";
Cin <= '0';
wait for 2 ps;

Cin <= '1';
wait for 2 ps;

A <= x"A00A";
sel <= "1011";
Cin <= '-';
wait for 2 ps;

wait;

end process stimulus;
end architecture partC_tb;
