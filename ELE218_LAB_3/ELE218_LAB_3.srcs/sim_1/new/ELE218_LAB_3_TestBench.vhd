----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2022 10:38:34
-- Design Name: 
-- Module Name: ELE218_LAB_3_TestBench - Behavioral
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

entity ELE218_LAB_3_TestBench is
--  Port ( );
end ELE218_LAB_3_TestBench;

architecture Behavioral of ELE218_LAB_3_TestBench is
signal Data_tb : STD_LOGIC_VECTOR (7 downto 0):=x"00";
signal Count_tb : STD_LOGIC_VECTOR (7 downto 0):=x"00";
signal Clk_tb: STD_LOGIC:='0';
signal Reset_n_tb: STD_LOGIC:='0';
signal Start_tb: STD_LOGIC:='0';
signal LA_tb: STD_LOGIC:='0';
signal Done_tb: STD_LOGIC:='0';

component ELE218_LAB is
    Port ( Start : in STD_LOGIC;
           Clk : in STD_LOGIC;
           LA : in STD_LOGIC;
           Reset_n : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (7 downto 0);
           Count : out STD_LOGIC_VECTOR (7 downto 0);
           Done : out STD_LOGIC);
end component;

begin
UUT: ELE218_LAB
port map(Data => Data_tb, Count => Count_tb, Clk => Clk_tb, Reset_n => Reset_n_tb, Start => Start_tb, LA => LA_tb, Done => Done_tb);
            
process
begin
wait for 5 ns;
Clk_tb <= not Clk_tb; --Setter klokken pulsen
end process;

process
begin 


wait for 100 ns; --venter 100 ns for systemet til å stabilisere seg
wait until rising_edge(Clk_tb);
Reset_n_tb <= '1'; --Setter reset til 1
Start_tb <= '1';
LA_tb <= '1';
Data_tb(7 downto 0) <= x"07"; --Setter data inn til 7 som vil gi oss 3 bit
wait for 30 ns;
wait until rising_edge(Clk_tb);
LA_tb <= '0';
Start_tb <= '0';
wait for 100 ns;
wait until rising_edge(Clk_tb);
LA_tb <= '1';
Start_tb <= '1';
Data_tb(7 downto 0) <= x"08"; --Setter data inn til 8 som vil gi oss 1 bit
wait for 30 ns;
wait until rising_edge(Clk_tb);
LA_tb <= '0';
Start_tb <= '0';
wait for 100 ns;
wait until rising_edge(Clk_tb);
LA_tb <= '1';
Start_tb <= '1';
Data_tb(7 downto 0) <= x"2f"; --Setter data inn til 2f som vil gi oss 5 bit
wait for 30 ns;
wait until rising_edge(Clk_tb);
LA_tb <= '0';
Start_tb <= '0';


wait;

end process;

end Behavioral;
