
library ieee;
use ieee.std_logic_1164.all;

entity ALU is
generic(N : integer := 16);
port(
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: std_logic;
    sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);

end entity ALU;

architecture ALU_arch of ALU is

-- declare any used components

component partA is
generic(N : integer := 16);
port(
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end component;

component partB is
generic(N : integer := 16);
port(
    A, B: in std_logic_vector(N-1 downto 0);
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end component;

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

component partD is
generic(N : integer := 16);
port(
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
	sel: in std_logic_vector(3 downto 0);
	F: out std_logic_vector(N-1 downto 0);
	Cout: out std_logic
);
end component;


-- declare any Intermediate signals

-- F signals for all parts
signal fA, fB, fC, fD: std_logic_vector(N-1 downto 0);
-- Cout signals for all parts
signal CoutA, CoutB, CoutC, CoutD: std_logic;


begin

-- Component port Mapping
cirA: partA port map(A => A, B => B, Cin => Cin, sel => sel, F => fA, Cout => coutA);
cirB: partB port map(A => A, B => B,             sel => sel, F => fB, Cout => CoutB);
cirC: partC port map(A => A, B => B, Cin => Cin, sel => sel, F => fC, Cout => CoutC);
cirD: partD port map(A => A, B => B, Cin => Cin, sel => sel, F => fD, Cout => CoutD);


F <= fA when sel(3 downto 2) = "00" -- part A
else fB when sel(3 downto 2) = "01" -- part B
else fC when sel(3 downto 2) = "10" -- part C
else fD when sel(3 downto 2) = "11" -- part D
else (others => '0');

Cout <= CoutA when sel(3 downto 2) = "00"
else CoutB when sel(3 downto 2) = "01"
else CoutC when sel(3 downto 2) = "10"
else CoutD when sel(3 downto 2) = "11"
else '0';

end architecture ALU_arch;