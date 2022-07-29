----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 11:45:41
-- Design Name: 
-- Module Name: ELE218_LAB_TestBench - Behavioral
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
use IEEE.Numeric_Std.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_LAB_TestBench is
--  Port ( );
end ELE218_LAB_TestBench;

architecture Behavioral of ELE218_LAB_TestBench is
signal Addr_tb: STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
signal RW_tb: STD_LOGIC:='0';
signal Resetn_tb :  STD_LOGIC;
signal PWM_out_tb :  STD_LOGIC;
signal clk_tb :  STD_LOGIC:='0';
signal DataBus_tb:  STD_LOGIC_VECTOR (15 downto 0);


Component ELE218_Timr is
      Port ( DataBus : inout STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           RW : in STD_LOGIC;
           Resetn : in STD_LOGIC;
           PWM_out : out STD_LOGIC;
           Addr : in STD_LOGIC_VECTOR (7 downto 0));
            
End Component;




begin
uut:  ELE218_Timr
       PORT MAP (
			DataBus => DataBus_tb,
			clk=> clk_tb,
			RW=>RW_tb,
			Resetn => Resetn_tb,
			PWM_out => PWM_out_tb,
			Addr => Addr_tb
			 );
		 


PROCESS
 BEGIN
  wait for 5 ns;
  clk_tb <= not clk_tb;
END PROCESS;

PROCESS
 BEGIN
 
 --write to registers
 Resetn_tb<='0';
  wait for 100 ns;
  Resetn_tb<='1';

 -- Write to control register
   DataBus_tb <= X"0012";
   Addr_tb <= x"00";
   RW_tb <= '0';
   wait for 100 ns;
      wait for 10 ns;
   DataBus_tb <= X"1010";
   Addr_tb <= x"00";
   RW_tb <= '0';
   wait for 100 ns;
   
   -- Write to prescaler
   wait for 10 ns;
   DataBus_tb <= X"00AA";
   Addr_tb <= x"10";
   RW_tb <= '0';
   wait for 10 ns;
   
      -- Write to Compear
   wait for 10 ns;
   DataBus_tb <= X"0004";
   Addr_tb <= x"0c";
   RW_tb <= '0';
   wait for 10 ns;
   
   -- Write to AutoReload
   wait for 10 ns;
   DataBus_tb <= X"0008";
   Addr_tb <= x"08";
   RW_tb <= '0';
   wait for 10 ns;
   
    -- Write to control register to start counting
   wait for 10 ns;
   DataBus_tb <= X"1011";
   Addr_tb <= x"00";
   RW_tb <= '0';
   wait for 10 ns;
   
    -- Read to counter register
   DataBus_tb <= (OTHERS => 'Z');
   Addr_tb <= x"04";
   RW_tb <= '1';
   wait for 100 ns;

   wait for 100 ns;
   
   

   
   
  
 
     
  wait;
      
    
END PROCESS;

end Behavioral;
