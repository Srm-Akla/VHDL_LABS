----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2022 07:48:20
-- Design Name: 
-- Module Name: ELE218_LAB_5_Nyttige_signaler - Behavioral
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

entity ELE218_LAB_5_Nyttige_signaler is
    Port ( clk : in STD_LOGIC;
           SDA : in STD_LOGIC;
           SCL : in STD_LOGIC;
           SDA_synk: out STD_LOGIC;
           SCL_N_edge : out STD_LOGIC;
           SCL_P_edge : out STD_LOGIC;
           START_sig : out STD_LOGIC;
           STOP_sig : out STD_LOGIC;
           Running_sig : out STD_LOGIC);
end ELE218_LAB_5_Nyttige_signaler;

architecture Behavioral of ELE218_LAB_5_Nyttige_signaler is
signal SDA_1,SDA_2,SDA_3: STD_LOGIC;
signal SCL_1,SCL_2,SCL_3: STD_LOGIC;
signal START, STOP: STD_LOGIC;
begin

synkInnSignal: Process (clk)
Begin
if(clk'event and clk = '1') then
SDA_1 <= SDA after 2ns;
SCL_1 <= SCL after 2ns;
SDA_2 <= SDA_1 after 2ns;
SCL_2 <= SCL_1 after 2ns;
SDA_3 <= SDA_2 after 2ns;
SCL_3 <= SCL_2 after 2ns;
end if;
end Process;

Running_logic: Process(START,STOP,clk)
BEGIN
if(clk'event and clk = '1') then
if (START = '1') then
Running_sig <= '1';  -- Her må du legge til kode for å gennerere Running_sig riktig
end if;
if (STOP = '1') then
Running_sig <= '0';  -- Her må du legge til kode for å gennerere Running_sig riktig
end if;
end if;
END Process;

START_sig <= START;
STOP_sig <= STOP; 

START <= NOT (SDA_2) and SDA_3 and SCL_2; --'0';  --Her må du legge til kode for å detektere START

STOP <= NOT (SDA_3) and SDA_2 and SCL_2; --'0';  --Her må du legge til kode for å detektere STOP

SCL_P_edge <= SCL_2 and NOT (SCL_3); --'0';  --Her må du legge til kode for å detektere SCL_P_edge
SCL_N_edge <= SCL_3 and NOT (SCL_2); --'0';  --Her må du legge til kode for å detektere SCL_N_edge

synkronisering: Process (SDA_2, SDA_3, clk)  -- kode for å synkronisere SDA  kanskje trenger en process!
begin  
        if (clk'event and clk = '1') then 
        if SDA_2 = '1' and SDA_3 = '0' then
        SDA_synk <= '1';
        elsif SDA_2 = '0' and SDA_3 = '1' then SDA_synk <= '0';   
        end if; 
        end if; 
    end process; 
end Behavioral;
