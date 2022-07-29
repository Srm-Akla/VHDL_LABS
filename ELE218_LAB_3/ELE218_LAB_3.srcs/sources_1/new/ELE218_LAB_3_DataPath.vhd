----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2022 09:04:38
-- Design Name: 
-- Module Name: ELE218_LAB_3_DataPath - Behavioral
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

entity ELE218_LAB_3_DataPath is
    Port ( Clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           LA : in STD_LOGIC;
           EA : in STD_LOGIC;
           LB : in STD_LOGIC;
           EB : in STD_LOGIC;
           z : out STD_LOGIC;
           A0 : out STD_LOGIC;
           Done : out STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (7 downto 0);
           Count_out : out STD_LOGIC_VECTOR (7 downto 0));
end ELE218_LAB_3_DataPath;

architecture Behavioral of ELE218_LAB_3_DataPath is

signal Shift_Q: std_logic_vector (7 downto 0);

signal zero: std_logic_vector (7 downto 0):= (others => '0');

begin

Shift_A: ELE218_ShiftR
        PORT MAP(R => Data_in, Resetn => resetn, E => EA, L => LA, W => '0', clk => Clk, Q => Shift_Q);
Count_B: ELE218_Counter_up
        PORT MAP(R => zero, Resetn => resetn, E => EB, L => LB, clk => Clk, Q => Count_out);

z <= '1' when Shift_Q =x"00" else '0';
A0 <= Shift_Q(0);

end Behavioral;
