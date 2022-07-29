----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.02.2022 14:08:20
-- Design Name: 
-- Module Name: ELE218_LAB_3_DataPath - Behavioral
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
use work.ELE218_Components.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ELE218_LAB_5_DataPath is
    GENERIC( N:INTEGER :=8); 
    Port ( clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           LA : in STD_LOGIC;
           EA : in STD_LOGIC;
           LB : in STD_LOGIC;
           EB : in STD_LOGIC;
           EC : in STD_LOGIC;
           ED : in STD_LOGIC;       
           SDA_out : out STD_LOGIC;
           SDA : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (N-1 downto 0);
           Z : out STD_LOGIC;
           RW : out STD_LOGIC;
           adress_right: out STD_LOGIC;
           Data_word_done: out STD_LOGIC;
           Data_RX : out STD_LOGIC_VECTOR (N-1 downto 0);
           Count_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end ELE218_LAB_5_DataPath;

 
architecture Behavioral of ELE218_LAB_5_DataPath is
signal Shift_Q: STD_LOGIC_VECTOR (N-1 downto 0);
signal Zero: STD_LOGIC_VECTOR (N-1 downto 0):=(others => '0');
signal slave_adress : std_LOGIC_VECTOR( 6 downto 0):="0000101";
signal Count :  STD_LOGIC_VECTOR (N-1 downto 0);
signal reg_addres_C_Q : STD_LOGIC_VECTOR (N-1 downto 0):="10000000";
signal data_rx_D_Q : STD_LOGIC_VECTOR (N-1 downto 0);
signal data_tx_D_Q : STD_LOGIC_VECTOR (N-1 downto 0);
begin
   

Shift_A: ELE218_ShiftL 
         Generic map( N => N)
         PORT MAP ( R => Data_in , Resetn => resetn , E => EA , L => LA , W =>SDA, clk => clk , Q => shift_Q);
         
 Count_B: ELE218_Counter_up
          Generic map( N => N)
          PORT MAP ( R => Zero , Resetn => resetn , E =>EB , L => LB , clk => clk , Q => Count);   
          
Adrres_C: ELE218_RegNE
      Generic map( N => N)
      PORT MAP ( R => shift_Q , Resetn => resetn , E => EC , clk => clk , Q => reg_addres_C_Q);
      
data_rx_D: ELE218_RegNE
      Generic map( N => N)
      PORT MAP ( R => shift_Q , Resetn => resetn , E => ED , clk => clk , Q => data_rx_D_Q); 
      
         
   SDA_out <=shift_Q(7);
   RW <= reg_addres_C_Q(0);
   Data_rx <= data_rx_D_Q;
   Count_out <= count; 
   adress_right <= '1' when reg_addres_C_Q(7 downto 1) = slave_adress else '0';
   Data_word_done <= '1' when Count = x"08" else '0';                 
end Behavioral;
