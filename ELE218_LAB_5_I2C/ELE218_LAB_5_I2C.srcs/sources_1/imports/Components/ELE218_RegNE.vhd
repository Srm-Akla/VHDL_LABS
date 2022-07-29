----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2020 09:19:40
-- Design Name: 
-- Module Name: ELE218_RegNE - Behavioral
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

entity ELE218_RegNE is
    GENERIC( N:INTEGER :=4);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end ELE218_RegNE;

architecture Behavioral of ELE218_RegNE is

begin
PROCESS( Resetn, clk)
  BEGIN
    IF Resetn = '0' THEN
        Q <= ( OTHERS => '0');
    ELSIF clk'EVENT AND clk ='1' THEN
      IF E = '1' THEN
           Q <= R;
      END IF;
   END IF;
 END PROCESS; 

end Behavioral;
