
library ieee;
use ieee.std_logic_1164.all;

entity FA is
port(A, B, Cin: in std_logic;
    S, Cout: out std_logic
);
end FA;

architecture FA_arch of FA is
begin
    S <= A xor B xor Cin;
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);
end FA_arch;