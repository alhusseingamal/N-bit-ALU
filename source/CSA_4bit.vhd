
library ieee;
use ieee.std_logic_1164.all;

entity CSA_4bit is
port(
    A, B: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    S: out std_logic_vector(3 downto 0);
    Cout: out std_logic
);
end entity CSA_4bit;



architecture CSA_4bit_arch of CSA_4bit is
-- declare any used components

component FA is
port(A, B, Cin: in std_logic;
    S, Cout: out std_logic
);
end component;

component mux_2x1 is
port(
	A, B, sel: in std_logic;
	C: out std_logic
);
end component;




-- declare any Intermediate signals

-- The carries out of the carry addition chains --> inputs to the carry multiplexers, multiplexed by the carry of the previous block
signal c0_0, c0_1, c1_0, c1_1, c2_0, c2_1, c3_0, c3_1: std_logic;
-- Note about Naming Convention: c2_1: the carry out of block 2 for the chain with Cin = 1

-- The sums out of the carry addtion chains --> inputs to the sum multiplexers, multiplexed by the carry of the previous block
signal s0_0, s0_1, s1_0, s1_1, s2_0, s2_1, s3_0, s3_1: std_logic;


-- outputs of the carry multiplexers
signal Cout0, Cout1, Cout2: std_logic;
-- the carry of the last block need not be saved in an Intermediate signal; it is mapped directly into the final carry of the CSA_4bit

-- Note: outputs of the sum multiplexers are saved directly into the entity's Sum vector; no need for Intermediate signal to save them in


begin

-- Component port Mapping

-- Mapping the full adders - double chain for each bit
FA0_0: FA port map (A => A(0), B=> B(0), Cin => '0', S => s0_0, Cout => c0_0);
FA0_1: FA port map (A => A(0), B=> B(0), Cin => '1', S => s0_1, Cout => c0_1);

FA1_0: FA port map (A => A(1), B=> B(1), Cin => '0', S => s1_0, Cout =>c1_0);
FA1_1: FA port map (A => A(1), B=> B(1), Cin => '1', S => s1_1, Cout => c1_1);

FA2_0: FA port map (A => A(2), B=> B(2), Cin => '0', S => s2_0, Cout => c2_0);
FA2_1: FA port map (A => A(2), B=> B(2), Cin => '1', S => s2_1, Cout => c2_1);

FA3_0: FA port map (A => A(3), B=> B(3), Cin => '0', S => s3_0, Cout => c3_0);
FA3_1: FA port map (A => A(3), B=> B(3), Cin => '1', S => s3_1, Cout => c3_1);


-- Mapping the carry multiplexers
MUX_C0: mux_2x1 port map(A => c0_0, B => c0_1, sel => Cin, C => Cout0);

MUX_C1: mux_2x1 port map(A => c1_0, B => c1_1, sel => Cout0, C => Cout1);

MUX_C2: mux_2x1 port map(A => c2_0, B => c2_1, sel => Cout1, C => Cout2);

MUX_C3: mux_2x1 port map(A => c3_0, B => c3_1, sel => Cout2, C => Cout);


-- Mapping the sum multiplexers
MUX_S0: mux_2x1 port map(A => s0_0, B => s0_1, sel => Cin, C => S(0));

MUX_S1: mux_2x1 port map(A => s1_0, B => s1_1, sel => Cout0, C => S(1));

MUX_S2: mux_2x1 port map(A => s2_0, B => s2_1, sel => Cout1, C => S(2));

MUX_S3: mux_2x1 port map(A => s3_0, B => s3_1, sel => Cout2, C => S(3));


end architecture CSA_4bit_arch;


-- Carry Select Adder (CSA)
-- Sacrifices Area for Performance
-- Suppose we want to construct a 20-bit adder (N = 20). 
-- We decided that we will split our addition into 4 sub-blocks (P = 4).
-- Each block handles 20/4 = 5 bits (K = 5);
-- P = N/K
-- Visualize our P blocks lined up next to each other from the left to right.
-- With traditional adders, a block cannot start until its previous block is done, namely the last bit in its previous block.
-- This gives a large propagation delay, where the critical path goes through all addition blocks one at a time.
-- For example, the second block (bits 5-9) cannot start until the first block (bits 0-4) is done, namely bit 4.
-- Let Cin be the carry coming from the last bit of the previous block. (i.e Cin of the 2nd block is the carry propagated from bit 4)
-- We know beforehand that the addition on bit 4 gives a carry of either 0 or 1. so the second block can have either Cin = 0 or Cin = 1
-- 
-- The CSA utilizes this fact. We let each adder block calculate the addition of its 5 bits.
-- EXCEPT this will be done twice; once with Cin = 0 and another with Cin = 1.
-- So, in each block we have two carry chains (of addition); one with Cin = 0 and another with Cin = 1.
-- The outputs of both chains is multiplexed with the selection bit being the actual carry coming from the previous block.
-- Now, the bits of the block are chosen, and the output of the multiplexer which is the carry of the current block is 
-- fed as the selection bit for the multiplexer of the next block. This pattern repeats for all block.
-- 
-- Critical Path: Addition chain of the first block + all multiplexers except the last one 
-- + addition chain of the last block (because we care about the last sum and it takes more time than the last carry).
-- 
-- Notice that a double chain addition is not needed neither in the first block nor in the last block.
-- 
-- 
-- Remember: P = N/K
-- Assume Tmux = Tc, Tc is the carry delay and Tmux is the mux delay
-- So tpd = K * Tc + (P - 2) * Tmux + (K - 1) * Tc + Tsum ==> delay of order O(P)
-- 
-- We can optimize this into a delay of order O(sqrt(N))
-- This is achieved by using unequal block sizes; let the block sizes be increasing.
-- We can make the block sizes increasing with the sequence: K, K+1, K+2, ..., K+P-1
-- So N = K + K+1 + K+2 + ... + K+P-1 = P(2K+P-1)/2, if P >> K then N~= P^2/2 ==> P ~= sqrt(2N)
-- So delay is O(sqrt(N))
-- 
-- Again tpd = K * Tc + (P - 2) * Tmux + (K + P - 1) * Tc + Tsum, P ~= sqrt(2N)
-- 
-- Here, we assumed that each block is only a single bit larger than its previous block. This doesn't have to be the case.
-- 
-- We define M = floor (Tmux/Tc), which is how many more bits block i+1 can have relative to block i
-- Think about the formula for M; it makes sense. 
-- i.e. if Tmux = 1.5*Tc, then M = 1; block i+1 is optimally a single bit larger than block i
-- 
-- tpd = K * Tc + (sqrt(2N)/M - 2) * Tmux + (K + P - 2) * Tc + Tsum
-- 
-- Refer to the video by Dr. Karim Ossama (Electron Tube Channel - 11.5. Carry Select Adder)