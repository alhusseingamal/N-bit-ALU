
Library ieee;
use ieee.std_logic_1164.all;


entity partB is
generic(N : integer := 16);
port(
	A, B: in std_logic_vector(N-1 downto 0);
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end partB;

architecture partB_arch of partB is

-- place any signals or components here

begin
	F <= A or B when sel = "0100" -- OR
	else A and B when sel = "0101" -- AND
	else A nor B when sel = "0110" -- NOR
	else not A when sel = "0111" -- NOT A
	else x"0000";
	Cout <= '0';
end partB_arch;
