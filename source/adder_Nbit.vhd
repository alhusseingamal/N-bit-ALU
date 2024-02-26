
library ieee;
use ieee.std_logic_1164.all;

entity adder_Nbit is
generic(N : integer := 16);
port
(
    A, B: in std_logic_vector(N-1 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(N-1 downto 0);
    Cout: out std_logic
);
end entity adder_Nbit;

architecture adder_Nbit_arch of adder_Nbit is

-- declare any used components
component CSA_4bit is
port(
    A, B: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    Cout: out std_logic
);
end component;

component RCA_4bit is
port(
    A, B: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    Cout: out std_logic
);
end component;

component FA is
port(
    A, B, Cin : in std_logic;
    S, Cout: out std_logic
);
end component;

-- declare any Intermediate signals

-- We use N/4 CSA's and N%4 FA's
constant CSA_4bit_Count: integer := N / 4;
constant FA_Count: integer := N mod 4;

-- An array for storing the carries: Temp(0) = Cin, Temp(i, i~=0) = Carry out of adder i, Cout(i) = Cin(i+1)
signal Temp : std_logic_vector(CSA_4bit_Count + FA_Count downto 0);

begin

Temp(0) <= Cin;

loop1:
for i in 0 to (CSA_4bit_Count - 1)
generate
    CSA_intance: CSA_4bit port map (A => A((4-1)+i*4 downto i*4), B => B((4-1)+i*4 downto i*4), Cin => Temp(i),
    S => S((4-1)+i*4 downto i*4), Cout => Temp(i+1));
end generate;

loop2:
for i in 0 to (FA_Count - 1)
generate  -- CSA_4bit_Count is added here as an offset
    FA_instance: FA port map (A => A(CSA_4bit_Count*4 + i), B => B(CSA_4bit_Count*4 + i),
    Cin => Temp(CSA_4bit_Count+i), S => S(CSA_4bit_Count*4 + i), Cout => Temp(CSA_4bit_Count+i+1));
end generate;

Cout <= Temp(CSA_4bit_Count+FA_Count); -- the final carry is the Cout of the last adder

end architecture adder_Nbit_arch;