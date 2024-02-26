library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity partA is
generic(N : integer := 16);
port (
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
    sel: in std_logic_vector(3 downto 0);
    F: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end entity partA;

architecture partA_arch of partA is

-- declare any components
component adder_Nbit is
generic(N : integer := 16);
port(
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end component;
-- declare any Intermediate signals

signal ADDER0_A, ADDER0_B : std_logic_vector(N-1 downto 0);
signal ADDER0_Cin : std_logic;

signal dummyCout: std_logic; -- the Cout out of the adder is not used, so we just save it in this wire instead of being hanging

-- F = A for Cin = 0, F = A+1 for Cin = 1 --> F = A + Cin
-- F = A-B for Cin = 0, F = A-B-1 for Cin = 1 --> F = A-B-Cin
-- F = A-B+1 for Cin = 0, F = A+B+1 for Cin = 1
-- F = A-1 for Cin = 0, F = B-1 for Cin = 1
begin
-- Component port Mapping and processes

    Cout <= '0';
    ADDER0_A <= A when sel = "0000"
    else A when sel = "0001"
    else A when sel = "0010"
    else A when sel = "0011" and Cin = '0'
    else B when sel = "0011" and Cin = '1'
    else (others => '0');

    ADDER0_B <= (others => '0') when sel = "0000"
    else not B + std_logic_vector(to_unsigned(1, B'length)) when sel = "0001" and Cin = '0'
    else not B when sel = "0001" and Cin = '1'
    else not B + std_logic_vector(to_unsigned(1, B'length)) when sel = "0010" and Cin = '0'
    else B when sel = "0010" and Cin = '1'
    else (others => '1') when sel = "0011" and Cin = '0'
    else std_logic_vector(to_unsigned(1, B'length)) when sel = "0011" and Cin = '1'
    else (others => '0');

    ADDER0_Cin <= Cin when sel = "0000"
    else '0' when sel = "0001"
    else '1' when sel = "0010"
    else '0' when sel = "0011"
    else '0';

-- declare the component used
ADDER0: adder_Nbit port map(A => ADDER0_A, B => ADDER0_B, Cin => ADDER0_Cin, S => F, Cout => dummyCout);

end architecture partA_arch;


