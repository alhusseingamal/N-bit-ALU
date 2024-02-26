
Library ieee;
use ieee.std_logic_1164.all;

entity ALU_tb is
end entity ALU_tb;

architecture ALU_tb of ALU_tb is
constant N: integer := 16;

component ALU is
generic(N : integer := N);
port(
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: std_logic;
    sel: in std_logic_vector(3 downto 0);
    F: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end component;


-- Input Signals
signal A, B: std_logic_vector (N-1 downto 0);
signal Cin: std_logic;
signal sel : std_logic_vector (3 downto 0);

-- Output Signals
signal F : std_logic_vector (N-1 downto 0);
signal Cout : std_logic;


-- 
begin

dut: ALU port map (A => A, B => B, Cin => Cin, sel => sel, F => F, Cout => Cout);

-- generate test stimulus

stimulus:
process begin

------------------------------------------partA Testing------------------------------------------------------

sel <= "0000";
Cin <= '0';
A <= x"0F0F";
B <= (others => '-');
wait for 2 ps;

sel <= "0001";
B <= x"0001";
wait for 2 ps;

sel <= "0010";
A <= x"FFFF";
wait for 2 ps;

sel <= "0011";
B <= (others => '-');
wait for 2 ps;


Cin <= '1';


sel <= "0000";
A <= x"0F0E";
B <= (others => '-');
wait for 2 ps;


sel <= "0001";
A <= x"FFFF";
B <= x"0001";
wait for 2 ps;

sel <= "0010";
A <= x"0F0F";
wait for 2 ps;

sel <= "0011";
wait for 2 ps;

------------------------------------------partB Testing------------------------------------------------------

sel <= "0100";
A <= x"F000";
B <= x"00B0";
wait for 2 ps;

sel <= "0101";
B <= x"000B";
wait for 2 ps;

sel <= "0110";
B <= x"B000";
wait for 2 ps;

sel <= "0111";
wait for 2 ps;

------------------------------------------partC Testing------------------------------------------------------

sel <= "1000";
A <= x"A00A";
Cin <= '-';
wait for 2 ps;

A <= x"000A";
wait for 2 ps;

sel <= "1001";
A <= x"B00C";
wait for 2 ps;

A <= x"000C";
wait for 2 ps;

sel <= "1010";
A <= x"A00A";
Cin <= '0';
wait for 2 ps;

Cin <= '1';
wait for 2 ps;

sel <= "1011";
A <= x"A00A";
Cin <= '-';
wait for 2 ps;

------------------------------------------partD Testing------------------------------------------------------

sel <= "1100";
A <= x"000F";
Cin <= '-';
wait for 2 ps;

sel <= "1101";
A <= x"0F0F";
Cin <= '0';
wait for 2 ps;

sel <= "1110";
wait for 2 ps;

sel <= "1111";
A <= x"F000";
Cin <= '-';
wait for 2 ps;


sel <= "1110";
A <= x"0F00";
Cin <= '1';
wait for 2 ps;

-------------------------------------------------------------------------------------------------------------

end process stimulus;
end architecture ALU_tb;