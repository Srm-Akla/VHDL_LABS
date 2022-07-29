----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2020 12:40:55
-- Design Name: 
-- Module Name: ELE218_Prescaler - Behavioral
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
use work.ELE218_Components.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_Prescaler is
    Port ( R : in STD_LOGIC_VECTOR (15 downto 0);
           L : in STD_LOGIC;
           E : in STD_LOGIC;
           Resetn: in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_e : out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end ELE218_Prescaler;

architecture Behavioral of ELE218_Prescaler is
signal precount: STD_LOGIC_VECTOR (15 downto 0); 
signal Qint: STD_LOGIC_VECTOR (15 downto 0);
signal clk_e_int: STD_LOGIC;
begin

PrescalerReg:  ELE218_RegNE GENERIC MAP ( N => 16)
       PORT MAP ( R =>R, E => L, clk => clk, Q => Qint, Resetn => Resetn);

PROCESS( Resetn, clk)
  BEGIN
    IF Resetn = '0' THEN
        precount <= ( OTHERS => '0');
        clk_e_int <='0';
    ELSIF clk'EVENT AND clk ='1' THEN
     IF E = '1' THEN
      IF precount = Qint THEN
           precount <= ( OTHERS => '0');
           clk_e_int <='1';
           ELSE 
           precount <= precount +1;
           clk_e_int <='0';
      END IF;
     END IF;
   END IF;
 END PROCESS; 
clk_e <= clk_e_int;
Q <= Qint;
end Behavioral;



