----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2021 16:53:58
-- Design Name: 
-- Module Name: CompareAndOutControl - Behavioral
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

entity CompareAndOutControl is
    generic( N:integer := 8);
    Port ( CounterValue : in STD_LOGIC_VECTOR (N-1 downto 0);
           AutoReloadValue : in STD_LOGIC_VECTOR (N-1 downto 0);
           CompeareValue : in STD_LOGIC_VECTOR (N-1 downto 0);
           OutControl : in STD_LOGIC;
           AutoClear : out STD_LOGIC;
           PWMOut : out STD_LOGIC);
end CompareAndOutControl;

architecture Behavioral of CompareAndOutControl is

begin

AutoClear <= '1' when AutoReloadValue = CounterValue else '0';

process(CounterValue,OutControl)
begin
if ( OutControl = '1') then
    if(CompeareValue > CounterValue) then PWMOut <= '1';
    else PWMOut <= '0';
    end if;

else 
 PWMOut <= '0';
 end if;

end process;
end Behavioral;
