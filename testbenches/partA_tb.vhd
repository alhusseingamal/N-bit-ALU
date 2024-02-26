

Library ieee;
use ieee.std_logic_1164.all;

entity partA_tb is
end entity partA_tb;

architecture partA_tb of partA_tb is
constant N: integer := 16;

component partA is
generic(N : integer := N);
port(
    A, B: in std_logic_vector(N-1 downto 0);
	Cin: in std_logic;
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end component;

-- Input Signals

signal A : std_logic_vector (N-1 downto 0);
signal B : std_logic_vector (N-1 downto 0);
signal Cin : std_logic;
signal sel : std_logic_vector (3 downto 0);


-- Output Signals
signal F : std_logic_vector (N-1 downto 0);
signal Cout : std_logic;

-- 
begin

dut: partA port map (A, B, Cin, sel, F, Cout);

-- generate test stimulus

stimulus:
process begin

Cin <= '0';



A <= x"0F0F";
B <= (others => '-');
sel <= "0000";
wait for 2 ps;


B <= x"0001";
sel <= "0001";
wait for 2 ps;


A <= x"FFFF";
sel <= "0010";
wait for 2 ps;


B <= (others => '-');
sel <= "0011";
wait for 2 ps;


Cin <= '1';



A <= x"0F0E";
B <= (others => '-');
sel <= "0000";
wait for 2 ps;



A <= x"FFFF";
B <= x"0001";
sel <= "0001";
wait for 2 ps;


A <= x"0F0F";
sel <= "0010";
wait for 2 ps;

sel <= "0011";
wait for 2 ps;


end process stimulus;
end architecture partA_tb;