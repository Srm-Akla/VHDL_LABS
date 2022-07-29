----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2020 11:20:32
-- Design Name: 
-- Module Name: ELE218_TriN - Behavioral
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

entity ELE218_TriN is
    GENERIC(N : INTEGER:= 8);
    Port ( Din : in STD_LOGIC_VECTOR (N-1 downto 0);
           Dout : out STD_LOGIC_VECTOR (N-1 downto 0);
           E : in STD_LOGIC);
end ELE218_TriN;

architecture Behavioral of ELE218_TriN is
begin
Dout <= ( OTHERS => 'Z') WHEN E = '0' ELSE Din;

end Behavioral;
