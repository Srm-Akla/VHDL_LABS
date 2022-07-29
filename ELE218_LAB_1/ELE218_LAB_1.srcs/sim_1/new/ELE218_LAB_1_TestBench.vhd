----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 14:26:28
-- Design Name: 
-- Module Name: ELE218_LAB_1_TestBench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_LAB_1_TestBench is
constant M: integer:=8;
--  Port ( );
end ELE218_LAB_1_TestBench;

architecture Behavioral of ELE218_LAB_1_TestBench is
signal Data_Bus_tb : STD_LOGIC_VECTOR (M-1 downto 0):=(others => '0'); --(N-1 downto 0):=(others => '0');
signal Control_Bus_tb : STD_LOGIC_VECTOR (7 downto 0):=x"00";
signal Adresse_Bus_tb : STD_LOGIC_VECTOR (7 downto 0):=x"00";
signal Clk_tb: STD_LOGIC:='0';
signal resetn_tb: STD_LOGIC:='0';

component ELE218_LAB
    Port ( Data_Bus : inout STD_LOGIC_VECTOR (M-1 downto 0);
           Control_Bus : in STD_LOGIC_VECTOR (7 downto 0);
           Adresse_Bus : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           resetn : in STD_LOGIC);
end component;


begin
UUT: ELE218_LAB
port map( 
            data_bus => data_bus_tb, 
            clk => clk_tb, 
            Control_Bus => Control_Bus_tb, 
            Adresse_Bus => Adresse_Bus_tb, 
            resetn => resetn_tb);

process
begin
wait for 5 ns;
Clk_tb <= not Clk_tb;
end process;

process
begin 
wait for 100 ns;  --wait for clk edge to be sure input signal is syncron with clk
wait until rising_edge(Clk_tb);
-- Setup
resetn_tb <= '1';
Adresse_Bus_tb(7 downto 0) <= x"00"; --R0
Control_Bus_tb(0) <= '0';
Data_Bus_tb(M-1 downto 0) <= x"03";


wait until rising_edge(Clk_tb);
Control_Bus_tb(1) <= '1'; -- Writing R0

wait for 20 ns;
Data_Bus_tb(M-1 downto 0) <= x"05";
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(2) <= '1'; -- Writing R1

wait for 20 ns;
Data_Bus_tb(M-1 downto 0) <= x"02";
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(2) <= '0'; -- Writing R2
Adresse_Bus_tb(3) <= '1';

wait for 20 ns;
Data_Bus_tb(M-1 downto 0) <= x"03";
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(2) <= '1'; -- Writing R3

wait for 20 ns;
Data_Bus_tb <= (others => 'Z');
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading R0
Adresse_Bus_tb(2) <= '0';
Adresse_Bus_tb(3) <= '0';

wait for 20 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(2) <= '1'; -- Reading R1

wait for 20 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(2) <= '0'; -- Reading R2
Adresse_Bus_tb(3) <= '1';

wait for 20 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(2) <= '1'; -- Reading R3

wait for 100 ns; -- Lab 2

wait for 20 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0';
Data_Bus_tb(M-1 downto 0) <= x"00";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Control_Bus_tb(1) <= '1'; -- Writing R0 "00"

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "00"
Adresse_Bus_tb(4) <= '1'; 

wait for 20 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "B-A"
Data_Bus_tb(M-1 downto 0) <= x"01"; 

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "B-A"
Adresse_Bus_tb(4) <= '1';

wait for 30 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "A-B"
Data_Bus_tb(M-1 downto 0) <= x"02";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "A-B"
Adresse_Bus_tb(4) <= '1';

wait for 30 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "A+B"
Data_Bus_tb(M-1 downto 0) <= x"03";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "A+B"
Adresse_Bus_tb(4) <= '1'; 

wait for 30 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "A XOR B"
Data_Bus_tb(M-1 downto 0) <= x"04";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "A XOR B"
Adresse_Bus_tb(4) <= '1';

wait for 30 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "A OR B"
Data_Bus_tb(M-1 downto 0) <= x"05";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "A OR B"
Adresse_Bus_tb(4) <= '1';

wait for 30 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "A AND B"
Data_Bus_tb(M-1 downto 0) <= x"06";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "A AND B"
Adresse_Bus_tb(4) <= '1';

wait for 30 ns;
wait until rising_edge(Clk_tb);
Adresse_Bus_tb(7 downto 0) <= x"00"; 
Control_Bus_tb(0) <= '0'; -- Writing R0 "FF"
Data_Bus_tb(M-1 downto 0) <= x"07";

wait for 30 ns;
wait until rising_edge(Clk_tb);
Data_Bus_tb <= (others => 'Z');
Control_Bus_tb(0) <= '1'; -- Reading Alu "FF"
Adresse_Bus_tb(4) <= '1';

wait;

end process;

end Behavioral;
