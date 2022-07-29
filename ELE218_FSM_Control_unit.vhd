----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2020 10:35:55
-- Design Name: 
-- Module Name: ELE218_FSM_Control_unit - Behavioral
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

entity ELE218_FSM_Control_unit is
    Port ( Clk: in STD_LOGIC;
           Reset_b: in STD_LOGIC;
           Start: in STD_LOGIC;
           A0: in STD_LOGIC;
           z: in STD_LOGIC;
           EA : out STD_LOGIC;
           EB : out STD_LOGIC;
           LB : out STD_LOGIC;
           Done : out STD_LOGIC);
end ELE218_FSM_Control_unit;

architecture Behavioral of ELE218_FSM_Control_unit is
type state_type is (S_idle, S_Shift, S_Done);
signal state, next_state: state_type;
begin

-- Next process
process (Clk, Reset_b)
  begin
    if( Reset_b = '0') then state <= S_idle;
    elsif(Clk'event and Clk = '1') then  state <= next_state;
    end if;
  end process;
  
  
  -- State Transition Logic
  process (z, Start, state)
   begin
    next_state <= state;
    case state is
    
     when S_idle => if Start ='1' then next_state <= S_Shift;
        else next_state <= S_idle; end if;
        
     when S_Shift => if z ='1' then  next_state <= S_Done;
                    else next_state <= S_Shift; 
                 end if;   
                   
     when S_Done => if Start ='1' then  next_state <= S_Done;
                    else next_state <= S_Idle; 
                 end if;  
                
     
     When others => next_state <= S_idle;  
    end case; 
    end process;
       


--Output Logic

       process (A0, state)
        begin
        LB <= '0'; EA <= '0'; EB <= '0'; Done <= '0';
 
        case state is
    
        when S_idle => LB <= '1';
      
        
       when S_Shift => EA <= '1'; 
                  if A0 = '1' then EB <= '1';
                  else EB <= '0';  
                  end if;
       
       
      When S_Done => Done <= '1';
     
    -- When others => next_state <= S_idle;  
    end case; 
  
       end process;
  
  
  end Behavioral;
