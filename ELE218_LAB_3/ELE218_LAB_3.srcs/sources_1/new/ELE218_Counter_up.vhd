----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2022 12:14:32
-- Design Name: 
-- Module Name: ELE218_Counter_up - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_Counter_up is
 GENERIC( N:INTEGER :=8);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           L : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end ELE218_Counter_up;

architecture Behavioral of ELE218_Counter_up is
signal Count: integer range 0 to 15;
begin
PROCESS( Resetn, clk)
  BEGIN
    IF Resetn = '0' THEN
        Count <= 0;
    ELSIF clk'EVENT AND clk ='1' THEN
      IF L = '1' THEN
           Count <= to_integer(unsigned(R));
      elsIF E = '1' THEN
           Count <= Count + 1;
      END IF;
   END IF;
 END PROCESS; 
Q <= std_logic_vector (to_unsigned(Count,Q'length));
end Behavioral;
