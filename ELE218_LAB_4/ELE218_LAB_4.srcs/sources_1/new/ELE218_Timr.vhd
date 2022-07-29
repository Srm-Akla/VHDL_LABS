----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2020 12:02:50
-- Design Name: 
-- Module Name: ELE218_Timr - Behavioral
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

entity ELE218_Timr is
      Port ( DataBus : inout STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           RW : in STD_LOGIC;
           Resetn : in STD_LOGIC;
           PWM_out : out STD_LOGIC;
           Addr : in STD_LOGIC_VECTOR (7 downto 0));
end ELE218_Timr;

architecture Behavioral of ELE218_Timr is
signal CtrBus : STD_LOGIC_VECTOR(3 downto 0);
signal RWBus : STD_LOGIC_VECTOR(9 downto 0);
signal CtrlReg_Q: STD_LOGIC_VECTOR(15 downto 0);
signal CompearReg_Q: STD_LOGIC_VECTOR(15 downto 0);
signal clk_e: STD_LOGIC;
signal clear_count: STD_LOGIC;
signal prescalReg_Q: STD_LOGIC_VECTOR(15 downto 0);
signal AutoReloadReg_Q: STD_LOGIC_VECTOR(15 downto 0);
signal timerReg_Q: STD_LOGIC_VECTOR(15 downto 0);
signal PWM_int: STD_LOGIC;
signal AutoClear: STD_LOGIC;
begin



CtrlReg:  ELE218_RegNE GENERIC MAP ( N => 16)
       PORT MAP ( R =>DataBus(15 DownTo 0), E => RWBus(0), clk => clk, Q => CtrlReg_Q, Resetn => Resetn);
  
TriCtrlReg :ELE218_TriN GENERIC MAP ( N => 16)
       PORT MAP ( Din =>CtrlReg_Q , Dout => DataBus(15 downto 0),   E =>RWBus(1));
              
CompearReg:  ELE218_RegNE GENERIC MAP ( N => 16)
       PORT MAP ( R =>DataBus(15 DownTo 0), E => RWBus(6), clk => clk, Q => CompearReg_Q, Resetn => Resetn);       
TriCompearReg :ELE218_TriN GENERIC MAP ( N => 16)
       PORT MAP ( Din => CompearReg_Q , Dout => DataBus(15 downto 0)  , E =>RWBus(7) );  
       
AutoReloadReg:  ELE218_RegNE GENERIC MAP ( N => 16)
       PORT MAP ( R =>DataBus(15 DownTo 0), E => RWBus(4), clk => clk, Q => AutoReloadReg_Q, Resetn => Resetn);       
TriAutoReloadReg :ELE218_TriN GENERIC MAP ( N => 16)
       PORT MAP ( Din => AutoReloadReg_Q , Dout => DataBus(15 downto 0)  , E =>RWBus(5) );         
              
AddresCtrl: ELE218_AddressDecoder
           PORT MAP( Address=>Addr,RW=>RW,RW_Bus=>RWBus);
           
PreReg:  ELE218_Prescaler
          PORT MAP(R=>DataBus(15 DownTo 0) ,L =>RWBus(8) , E=> CtrlReg_Q(0) , Resetn => Resetn, clk=> clk, clk_e=> clk_e, Q => prescalReg_Q ); 
TriPreReg :ELE218_TriN GENERIC MAP ( N => 16)
       PORT MAP ( Din =>prescalReg_Q ,  Dout => DataBus(15 downto 0) ,   E =>RWBus(9) );       

Counter_1 :  ELE218_UpDownCounter 
    GENERIC MAP( N => 16)
    Port map( R => DataBus(15 DownTo 0),Rin => RWBus(2), Clock=> clk, Count=> clk_e, UP_DOWN=> CtrlReg_Q(4) ,clear=>clear_count, Q=> timerReg_Q);         
TriCounter_1 :ELE218_TriN GENERIC MAP ( N => 16)
       PORT MAP ( Din =>timerReg_Q ,  Dout => DataBus(15 downto 0)  ,   E =>RWBus(3) );       
    
PWM_Logic : CompareAndOutControl  
    GENERIC MAP( N => 16) 
    PORT MAP (CounterValue => timerReg_Q, AutoReloadValue => AutoReloadReg_Q, CompeareValue => CompearReg_Q, OutControl => CtrlReg_Q(12), AutoClear => clear_count, PWMOut => PWM_int);
        
PWM_out <= PWM_int;
end Behavioral;
