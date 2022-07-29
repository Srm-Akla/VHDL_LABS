----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2020 12:21:12
-- Design Name: 
-- Module Name: ELE218_AddressDecoder - Behavioral
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

entity ELE218_AddressDecoder is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RW_Bus : out STD_LOGIC_VECTOR (9 downto 0));
end ELE218_AddressDecoder;

architecture Behavioral of ELE218_AddressDecoder is
-- Adresse dekoding
CONSTANT Control_R     : std_logic_vector ( 8 downto 0) := '1' & X"00"; 
CONSTANT Control_W     : std_logic_vector ( 8 downto 0) := '0' & X"00";
CONSTANT Counter_R     : std_logic_vector ( 8 downto 0) := '1' & X"04"; 
CONSTANT Counter_W     : std_logic_vector ( 8 downto 0) := '0' & X"04";
CONSTANT AutoReload_R  : std_logic_vector ( 8 downto 0) := '1' & X"08"; 
CONSTANT AutoReload_W  : std_logic_vector ( 8 downto 0) := '0' & X"08";
CONSTANT Compare_R     : std_logic_vector ( 8 downto 0) := '1' & X"0C"; 
CONSTANT Compare_W     : std_logic_vector ( 8 downto 0) := '0' & X"0C";
CONSTANT Prescaler_R   : std_logic_vector ( 8 downto 0) := '1' & X"10"; 
CONSTANT Prescaler_W   : std_logic_vector ( 8 downto 0) := '0' & X"10";
begin

-- Convertere Out_reg to OutCtrBus             
WITH RW & Address SELECT
     RW_Bus  <=  "0000000001" WHEN  Control_W,
                 "0000000010" WHEN  Control_R,
                 "0000000100" WHEN  Counter_W,
                 "0000001000" WHEN  Counter_R,
                 "0000010000" WHEN  AutoReload_W,
                 "0000100000" WHEN  AutoReload_R,
                 "0001000000" WHEN  Compare_W,
                 "0010000000" WHEN  Compare_R,
                 "0100000000" WHEN  Prescaler_W,
                 "1000000000" WHEN  Prescaler_R,
                 
                 "0000000000" WHEN OTHERS;  
end Behavioral;