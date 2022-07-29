----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2022 14:32:25
-- Design Name: 
-- Module Name: ELE218_ShiftR - Behavioral
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

entity ELE218_ShiftL is
 GENERIC( N:INTEGER :=4);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           L : in STD_LOGIC;
           W : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end ELE218_ShiftL;

architecture Behavioral of ELE218_ShiftL is
signal Q_int: STD_LOGIC_VECTOR (N-1 downto 0);
begin
PROCESS( Resetn, clk)
  BEGIN
    IF Resetn = '0' THEN
        Q_int <= ( OTHERS => '0');
    ELSIF clk'EVENT AND clk ='1' THEN
      IF L = '1' THEN
           Q_int <= R;
           
      elsIF E = '1' THEN
           Q_int <=  Q_int(N-2 downto 0)& W ;
      END IF;
   END IF;
 END PROCESS; 
 
Q <= Q_int;

end Behavioral;
