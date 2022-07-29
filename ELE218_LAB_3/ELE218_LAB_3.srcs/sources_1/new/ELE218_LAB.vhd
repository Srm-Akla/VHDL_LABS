----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2022 10:48:13
-- Design Name: 
-- Module Name: ELE218_LAB - Behavioral
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
use work.ELE218_Components.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_LAB is
    Port ( Start : in STD_LOGIC;
           Clk : in STD_LOGIC;
           LA : in STD_LOGIC;
           Reset_n : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (7 downto 0);
           Count : out STD_LOGIC_VECTOR (7 downto 0);
           Done : out STD_LOGIC);
end ELE218_LAB;

architecture Behavioral of ELE218_LAB is

signal EA : std_logic;
signal EB : std_logic;
signal LB : std_logic;
signal A0 : std_logic;
signal z : std_logic;

begin

FSM_cont : ELE218_FSM_Control_unit
            PORT MAP (Clk => Clk, Reset_b => Reset_n, Start => Start, A0 => A0, z => z, EA => EA, EB => EB, LB => LB, Done => Done);
Data_ph : ELE218_LAB_3_DataPath 
            PORT MAP (Clk => Clk, resetn => Reset_n, LA => LA, EA => EA, LB => LB, EB => EB, Data_in => Data, z => z, A0 => A0, Count_out => Count);
            
end Behavioral;
