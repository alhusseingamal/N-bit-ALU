
library ieee;
use ieee.std_logic_1164.all;

entity CSA_4bit_tb is
end CSA_4bit_tb;


architecture CSA_4bit_tb of CSA_4bit_tb is

component CSA_4bit is
port(A, B: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    Cout: out std_logic
);
end component;

-- I/O signals
-- Inputs

signal A: std_logic_vector(3 downto 0) := (others => '0');
signal B: std_logic_vector(3 downto 0) := (others => '0');
signal Cin: std_logic := '0';

-- Outputs
signal Cout: std_logic := '0';
signal S: std_logic_vector(3 downto 0) := (others => '0');

begin

dut: CSA_4bit port map (A => A, B => B, Cin => Cin, S => S, Cout => Cout);

stimulus:
process begin
-- hold reset state for 2 ps.

wait for 2 ps;
A <= "0110";
B <= "1100";
 
wait for 2 ps;
A <= "1111";
B <= "1100";
 
wait for 2 ps;
A <= "1111";
B <= "0000";

wait for 2 ps;
A <= "0000";
B <= "0000";

wait for 2 ps;
A <= "0110";
B <= "0111";
 
wait for 2 ps;
A <= "0110";
B <= "1110";
 
wait for 2 ps;
A <= "1111";
B <= "1111";

wait for 2 ps;
A <= "1000";
B <= "1001";

wait for 2 ps;
A <= "1011";
B <= "1011";

wait for 2 ps;
A <= "1011";
B <= "1011";
Cin <= '1';

wait for 2 ps;
A <= "1101";
B <= "1110";

wait for 2 ps;
A <= "0011";
B <= "1110";

wait for 2 ps;
A <= "0011";
B <= "0001";

wait for 2 ps;
A <= "0100";
B <= "0011";

wait for 2 ps;
A <= "0111";
B <= "1101";

wait for 2 ps;
A <= "1111";
B <= "0000";

wait for 2 ps;

wait;
end process;
end architecture CSA_4bit_tb;



