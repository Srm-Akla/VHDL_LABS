----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2022 09:11:36
-- Design Name: 
-- Module Name: ELE218_LAB_2_Start_Stop - Behavioral
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

entity ELE218_LAB_5_top is
    Port ( clk : in STD_LOGIC;
           SDA : inout STD_LOGIC;
           SCL : in STD_LOGIC;
           Resetn : in STD_LOGIC;
           Running : out STD_LOGIC;
           RX_Data: out STD_LOGIC_VECTOR( 7 downTo 0));
end ELE218_LAB_5_top;

architecture Behavioral of ELE218_LAB_5_top is
 
--signal A0_top : std_LOGIC;
signal Z_top : std_LOGIC;
signal LA_top : std_LOGIC;
signal EA_top : std_LOGIC;
signal EB_top : std_LOGIC;
signal EC_top : std_LOGIC;
signal ED_top : std_LOGIC;
signal LB_top : std_LOGIC;
signal ACK_top : std_LOGIC;
signal done_top : std_LOGIC;
signal SDA_out_top : std_LOGIC;
signal Data_done_top : std_LOGIC;
signal R_W_top : std_LOGIC:='1';
signal adress_right_top:  STD_LOGIC;
signal SCK_P_edge_top:std_LOGIC;
signal SCK_N_edge_top:std_LOGIC;
signal Start_sig_top:std_LOGIC;
signal Stop_sig_top:std_LOGIC;
signal SDA_synk_top:std_LOGIC;
signal running_top: std_logic;
signal Writing_top: std_logic;
signal Data_in_top : std_LOGIC_VECTOR( 7 downto 0):=x"aa";
signal Count_out_top : std_LOGIC_VECTOR( 7 downto 0);

signal Data_RX_top: std_LOGIC_VECTOR( 7 downto 0);
begin


RX_Data <= Data_RX_top;


FSM_Cont : ELE218_FSM_Control_unit 
           PORT MAP ( clk =>clk, Reset_b => resetn,
                       Start =>Start_sig_top,Stop => Stop_sig_top,
                       R_W => R_W_top,adress_right => adress_right_top,  
                       Data_done => Data_done_top,SCK_P_edge => SCK_P_edge_top,
                       SCK_N_edge => SCK_N_edge_top, LA => LA_top,   EA =>EA_top,
                       EB =>EB_top, EC =>EC_top, ED => ED_top, LB => LB_top, ACK => ACK_top, Writing => Writing_top,  done => done_top);



data_ph : ELE218_LAB_5_DataPath
           Generic map( N => 8)
           Port map ( clk =>clk , resetn => resetn , LA=>LA_top ,
            EA =>EA_top , LB =>LB_top , EB =>EB_top ,EC =>EC_top,ED => ED_top,SDA_out =>SDA_out_top, SDA => SDA_synk_top ,
            Data_in => Data_in_top , Z =>  Z_top, RW => R_W_top, adress_right =>adress_right_top , 
            Data_word_done =>Data_done_top, Data_rx => Data_rx_top , Count_out => Count_out_top );

ekstra_signals: ELE218_LAB_5_Nyttige_signaler
           PORT MAP ( clk => clk ,  SDA =>SDA, SCL => SCL, SCL_N_edge =>SCK_N_edge_top , 
           SCL_P_edge => SCK_P_edge_top, SDA_synk =>SDA_synk_top, START_sig => Start_sig_top, 
           STOP_sig => Stop_sig_top , Running_sig => running_top);

running <= running_top;

SDA <='0' when (ACK_top = '1' or (SDA_out_top = '0' and R_W_top = '1' and Writing_top ='1' ))  else 'Z';




end Behavioral;
