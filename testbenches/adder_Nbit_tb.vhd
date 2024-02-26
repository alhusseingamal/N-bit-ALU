

library ieee;
use ieee.std_logic_1164.all;

entity adder_Nbit_tb is
end adder_Nbit_tb;


architecture adder_Nbit_tb of adder_Nbit_tb is
constant N: integer := 16;

component adder_Nbit is
generic(N : integer := 16);
port(A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end component;

-- I/O signals
-- Inputs

signal A: std_logic_vector(N-1 downto 0) := (others => '0');
signal B: std_logic_vector(N-1 downto 0) := (others => '0');
signal Cin: std_logic := '0';

-- Outputs
signal Cout: std_logic := '0';
signal S: std_logic_vector(N-1 downto 0) := (others => '0');

begin

dut: adder_Nbit generic map (N => N) port map (A => A, B => B, Cin => Cin, S => S, Cout => Cout);

stimulus:
process begin
-- hold reset state for 2 ps.

wait for 2 ps;
A <= x"A010";
B <= x"B100";
 
wait for 2 ps;
A <= x"FFE1";
B <= x"CB90";
 
wait for 2 ps;
A <= x"1111";
B <= x"0000";

wait for 2 ps;
A <= x"0000";
B <= x"0000";
 
wait for 2 ps;
A <= x"0000";
B <= x"FFFF";
 
wait for 2 ps;
A <= x"FFFF";
B <= x"0000";

wait for 2 ps;
A <= x"1000";
B <= x"1001";

wait for 2 ps;
A <= x"1111";
B <= x"1111";

wait for 2 ps;
A <= x"BACD";
B <= x"AAA1";

wait for 2 ps;
A <= x"ABCD";
B <= x"EABC";

wait for 2 ps;
A <= x"A0A0";
B <= x"CCCC";

wait for 2 ps;
A <= x"1011";
B <= x"1011";

wait for 2 ps;
A <= x"FFFF";
B <= x"FFFF";

wait for 2 ps;
A <= x"FFFF";
B <= x"FFFF";
Cin <= '1';

wait for 2 ps;
A <= x"BCBC";
B <= x"CDCD";

wait for 2 ps;
A <= x"A7B6";
B <= x"C4D3";

wait for 2 ps;
A <= x"E0A1";
B <= x"9876";

wait for 2 ps;
A <= x"5432";
B <= x"10FE";

wait for 2 ps;
A <= x"0111";
B <= x"1101";

wait for 2 ps;
A <= x"1111";
B <= x"0000";

wait for 2 ps;
A <= x"EEEE";
B <= x"FFFF";

wait for 2 ps;

end process;
end architecture adder_Nbit_tb;



