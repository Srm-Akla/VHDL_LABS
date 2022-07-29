----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2021 18:24:46
-- Design Name: 
-- Module Name: ELE218_LAB_1_control - Behavioral
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

entity ELE218_LAB_control is      
    Port ( Control : in STD_LOGIC_VECTOR (7 downto 0);
           Adresse : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           OutControl : out STD_LOGIC_VECTOR (6 downto 0);
           inControl : out STD_LOGIC_VECTOR (3 downto 0));
end ELE218_LAB_control;

architecture Behavioral of ELE218_LAB_control is

begin

process(Control, Adresse)
begin

--Inn to Register control
    case Control(1 downto 0) & Adresse(4 downto 0) is
    when "1000000" => InControl <= "0001"; --Write into #R0
    when "1000100" => InControl <= "0010"; --Write into #R1
    when "1001000" => InControl <= "0100"; --Write into #R2 
    when "1001100" => InControl <= "1000"; --Write into #R3
    when others   => InControl <= "0000"; 
    end case;
    
 --Out from Register control
    case Control(1 downto 0) & Adresse(4 downto 0) is
    when "1100000" => OutControl <= "0100001"; --Read from #R0
    when "1100100" => OutControl <= "0100010"; --Read from #R1
    when "1101000" => OutControl <= "0100100"; --Read from #R2 
    when "1101100" => OutControl <= "0101000"; --Read from #R3
    when "1110000" => OutControl <= "1100000"; --Read from #Alu
    when others   => OutControl <= "0010000"; 
    end case;
end process;
end Behavioral;
