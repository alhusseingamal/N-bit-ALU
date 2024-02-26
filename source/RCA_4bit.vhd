
library ieee;
use ieee.std_logic_1164.all;

entity RCA_4bit is
port(A, B: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    Cout: out std_logic
);
end RCA_4bit;

architecture RCA_4bit_arch of RCA_4bit is

 -- Component Declaration of any entites used in the design.
component FA is
port(
    A, B, Cin : in std_logic;
    S, Cout: out std_logic
);
end component;

-- Intermediate Carry declaration
signal Cout0, Cout1, Cout2: std_logic;

begin
-- Port Mapping Full Adder 4 times
FA0: FA port map (A => A(0), B=> B(0), Cin => Cin, S => S(0), Cout => Cout0);
FA1: FA port map (A => A(1), B=> B(1), Cin => Cout0, S => S(1), Cout => Cout1);
FA2: FA port map (A => A(2), B=> B(2), Cin => Cout1, S => S(2), Cout => Cout2);
FA3: FA port map (A => A(3), B=> B(3), Cin => Cout2, S => S(3), Cout => Cout);

end RCA_4bit_arch;