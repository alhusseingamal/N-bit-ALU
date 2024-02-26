
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity partB_tb is
end entity partB_tb;

architecture partB_tb of partB_tb is
constant N: integer := 16;

-- instantiate components under test
component partB is
generic(N : integer := N);
port(A, B: in std_logic_vector(N-1 downto 0);
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end component;

-- Input Signals
signal A : std_logic_vector (N-1 downto 0);
signal B : std_logic_vector (N-1 downto 0);
signal sel : std_logic_vector (3 downto 0);

-- Output Signals
signal F : std_logic_vector (N-1 downto 0);
signal Cout : std_logic;

-- 
begin

-- instantiate the unit under test
dut: partB generic map (N => N) port map (A, B, sel, F, Cout);

-- generate test stimulus

stimulus:
process begin


A <= x"F000";
B <= x"00B0";
sel <= "0100";
wait for 2 ps;

B <= x"000B";
sel <= "0101";
wait for 2 ps;

sel <= "0110";
B <= x"B000";
wait for 2 ps;

sel <= "0111";
wait for 2 ps;

wait;

end process stimulus;
end architecture partB_tb;

