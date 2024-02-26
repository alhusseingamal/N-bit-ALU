LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity FA_tb is
end FA_tb;

architecture FA_tb OF FA_tb is
 -- Component Declaration for the Unit Under Test (UUT)
    component FA is
    port(A, B, Cin : in std_logic;
        S, Cout: out std_logic
    );
    end component;

    -- I/O signals
    --Inputs
    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal Cin : std_logic := '0';
    --Outputs
    signal S : std_logic;
    signal Cout : std_logic;

    begin
    -- Instantiate the Unit Under Test (UUT)
    dut: FA PORT MAP (A => A, B => B, Cin => Cin, S => S, Cout => Cout);

    -- generate test stimulus
    stimulus:
    process begin
    -- hold reset state for 2 ps.
    wait for 2 ps;

    -- insert stimulus here
    A <= '1';
    B <= '0';
    Cin <= '0';
    wait for 2 ps;

    A <= '0';
    B <= '1';
    Cin <= '0';
    wait for 2 ps;

    A <= '1';
    B <= '1';
    Cin <= '0';
    wait for 2 ps;

    A <= '0';
    B <= '0';
    Cin <= '1';
    wait for 2 ps;

    A <= '1';
    B <= '0';
    Cin <= '1';
    wait for 2 ps;

    A <= '0';
    B <= '1';
    Cin <= '1';
    wait for 2 ps;

    A <= '1';
    B <= '1';
    Cin <= '1';
    wait for 2 ps;

    end process;

END architecture FA_tb;

