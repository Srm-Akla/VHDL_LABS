----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 12:06:37
-- Design Name: 
-- Module Name: ELE218_ALU - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_ALU is
    GENERIC(N : INTEGER:= 8);
    Port ( sel : in STD_LOGIC_VECTOR (2 downto 0);
           A : in STD_LOGIC_VECTOR (N-1 downto 0);
           B : in STD_LOGIC_VECTOR (N-1 downto 0);
           F : out STD_LOGIC_VECTOR (N-1 downto 0));
end ELE218_ALU;

architecture Behavioral of ELE218_ALU is

begin
PROCESS(sel,A,B)
BEGIN
  CASE sel IS
     WHEN "000" =>  F <=x"00";
     WHEN "001" =>  F <=B - A;
     WHEN "010" =>  F <=A - B;
     WHEN "011" =>  F <=A + B;
     WHEN "100" =>  F <=A XOR B;
     WHEN "101" =>  F <=A OR B;
     WHEN "110" =>  F <=A AND B;
     WHEN OTHERS => F <=x"FF";
  END CASE; 
END PROCESS;    

end Behavioral;
