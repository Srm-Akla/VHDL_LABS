----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2015 08:01:43
-- Design Name: 
-- Module Name: UP_DOWN_CONTER - Behavioral
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
--use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_UpDownCounter is
    GENERIC( N:INTEGER := 8);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Rin : in STD_LOGIC;
           Clock : in STD_LOGIC;
           Count : in STD_LOGIC;
           UP_DOWN : in STD_LOGIC;
           clear: in STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (N-1 downto 0));
end ele218_UpDownCounter;

architecture Behavioral of ELE218_UpDownCounter is

signal counter: integer range 0 to 2**N ;  -- Husk aå anngi range -
begin
  PROCESS (Rin,Count, Clock, clear)
   BEGIN
    IF (Clock'EVENT AND Clock = '1') THEN
      IF Count='1' THEN
        
        IF UP_DOWN = '1' THEN
             counter <= counter + 1;
        ELSE
             counter <= counter -1;     
        END IF;
      END IF; 
      IF Rin = '1' THEN
         counter <= to_integer(signed(R)); 
      END IF; 
      IF clear = '1' THEN
           counter <= 0; 
      END IF; 
    
    END IF;
     
    END PROCESS;
Q <= std_logic_vector(to_unsigned(counter,Q'length));
end Behavioral;
