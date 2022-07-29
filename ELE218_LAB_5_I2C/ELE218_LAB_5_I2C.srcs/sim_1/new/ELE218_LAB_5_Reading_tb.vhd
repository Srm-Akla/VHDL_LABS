----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2022 08:53:14
-- Design Name: 
-- Module Name: ELE218_LAB_5_Reading_tb - Behavioral
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

entity ELE218_LAB_5_Reading_tb is
--  Port ( );
end ELE218_LAB_5_Reading_tb;

architecture Behavioral of ELE218_LAB_5_Reading_tb is

signal clk_tb: STD_LOGIC:='0';
signal SDA_tb: STD_LOGIC:='0';
signal SCL_tb: STD_LOGIC:='0';
signal running_tb: STD_LOGIC:='0';
signal Resetn_tb :  STD_LOGIC:='0';
signal RX_Data_tb:  STD_LOGIC_VECTOR( 7 downTo 0);

Component ELE218_LAB_5_top is
    Port ( clk : in STD_LOGIC;
           SDA : inout STD_LOGIC;
           SCL : in STD_LOGIC;
           Resetn : in STD_LOGIC;
           Running : out STD_LOGIC;
           RX_Data: out STD_LOGIC_VECTOR( 7 downTo 0));
end Component;
begin


uut: ELE218_LAB_5_top
   PORT MAP ( clk => clk_tb, SDA => SDA_tb, SCL => SCL_tb, Resetn => Resetn_tb, Running => Running_tb, RX_Data => RX_DATA_tb);
PROCESS
 BEGIN
  wait for 5 ns;
  clk_tb <= not clk_tb;
END PROCESS;

PROCESS
 BEGIN
 
  wait for 120 ns; -- Viktig vente til global reset inn FPGA is releast
  Resetn_tb <= '1';
  wait until rising_edge(clk_tb);    -- waite for clk edge to be sure input signal is synkrone with clk!!

SDA_tb <= '1';
SCL_tb <= '1';

wait for 1 us; 
SDA_tb <= '0';  -- start signal

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '1';   -- A0
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0'; 
wait for 100 ns;
SDA_tb <= '0';   --A1
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '0';   --A2
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '1';   --A3
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '0';   --A4
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '0';   --A5
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '0';   --A6
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '1';   --RW 0 = write
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= 'H';   --ack
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D0
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D1
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D2
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D3
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D4
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D5
wait for 1 us; 
SCL_tb <= '1';


wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D6
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D7
wait for 1 us; 
SCL_tb <= '1';



wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '0';   --ack
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= 'H';   --D0
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D1
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D2
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D3
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D4
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D5
wait for 1 us; 
SCL_tb <= '1';


wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '1';   --D6
wait for 1 us; 
SCL_tb <= '1';

wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= '0';   --D7
wait for 1 us; 
SCL_tb <= '1';



wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
--SDA_tb <= 'H';   --ack
wait for 1 us; 
SCL_tb <= '1';


wait for 1 us; 
SCL_tb <= '0';
wait for 100 ns;
SDA_tb <= '0';   --ack
wait for 1 us; 
SCL_tb <= '1';
wait for 100 ns;
SDA_tb <= '1';  --STOP
wait;
END PROCESS;
end Behavioral;