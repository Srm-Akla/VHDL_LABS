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
           Stop: in STD_LOGIC;
           Data_done: in STD_LOGIC;
           SCK_P_edge: in STD_LOGIC;
           SCK_N_edge: in STD_LOGIC;
           adress_right: in STD_LOGIC;
           R_W: in STD_LOGIC;
           EA : out STD_LOGIC;
           LA : out STD_LOGIC;
           EB : out STD_LOGIC;
           EC : out STD_LOGIC;
           ED : out STD_LOGIC;
           LB : out STD_LOGIC;
           ACK : out STD_LOGIC;
           Writing : out STD_LOGIC;
           Done : out STD_LOGIC);
           
end ELE218_FSM_Control_unit;

architecture Behavioral of ELE218_FSM_Control_unit is
type state_type is (S_idle,S_Address, S_STORE_ADDR, S_WAIT_ACK, S_ACK, S_Done, S_Count, S_RW, S_Write, S_Read, S_Store_Data, S_Wait_ACK_Data, S_ACK_Data, S_check);  -- Her må dere legge til de statene dere trenger
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
  process (Stop, Start, state, Data_done,R_W, SCK_N_edge)
   begin
    next_state <= state;
    case state is
    
     when S_idle => if Start ='1' then next_state <= S_Address;  -- øbsker nok ikke å gå til S_Doen her
        else next_state <= S_idle; end if;
        
     -- leg til kode
     when S_Address => if Data_done = '1' then next_state <= S_STORE_ADDR; 
                       else next_state <= S_Address;
                       end if;
                       
    when S_STORE_ADDR => next_state <= S_WAIT_ACK;
                       
    when S_WAIT_ACK => if (SCK_N_edge = '1') then next_state <= S_ACK;
                                             else next_state <= S_WAIT_ACK;
                                             end if;
    
    when S_ACK => if (SCK_N_edge = '1') then next_state <= S_Count;
                                        else next_state <= S_ACK;
                                        end if; 
                                        if adress_right = '0' then next_state <= S_idle; 
                                        end if;                  
                  
    when S_Count => Next_state <= S_RW;
    
    when S_RW => if R_W = '0' then next_state <= S_Write; 
                 elsif R_W = '1' then next_state <= S_Read; 
                 else next_state <= S_RW; 
                 end if;                 
                  
    When S_Write => if stop ='0' then 
                    if Data_done = '1' then next_state <= S_Store_Data;
                    else next_state <= S_Write; 
                    end if; 
                    elsif stop = '1' then next_state <= S_Done; 
                    else next_state <= S_Write; 
                    end if; 
                    
     When S_read =>
     
     When S_Store_Data => Next_State <= S_Wait_ACK_Data; 
               
     When S_Wait_ACK_Data => if (SCK_N_edge = '1') then next_state <= S_ACK_Data;
                             else next_state <= S_Wait_ACK_Data;
                             end if;
                             
     When S_ACK_Data => if (SCK_N_edge = '1') then next_state <= S_check;
                        else next_state <= S_ACK_Data;
                        end if;
                        
     When S_Check => if stop = '1' then next_state <= S_Done;
                     else next_state <= S_Count;
                     end if;           
                       
    When S_Done => if Start = '1' Then next_state <= S_Done ;
                     else next_state <= S_idle; 
                    end if;
     
    -- When others => next_state <= S_idle;  
    end case; 
    end process;
       


--Output Logic

       process (SCK_P_edge,SCK_N_edge, state)
        begin
        ACK<= '0'; LA<= '0';LB<= '0'; EA <= '0'; EB <= '0';EC <= '0';ED <= '0'; Done <= '0';
 
        case state is
    
        when S_idle => LB <='1';
                                
        --leg til nye stats
        when S_Address => if SCK_P_edge <= '1' then
                           EA <= '1'; EB <= '1';
                           end if;
                           
        when S_STORE_ADDR => EC <= '1';
        
        when S_WAIT_ACK => 
        
        when S_ACK => ACK <= '1';
 
        When S_Count => LB <= '1';
       
        when S_RW =>
       
        when S_Write => if SCK_P_edge = '1' then 
                        EA <= '1'; EB <= '1';  
                        end if;
        when S_Read =>
       
        when S_Store_Data => ED <= '1';
       
        when S_Wait_ACK_Data =>
       
        when S_ACK_Data => ACK <= '1';
       
        when S_Check =>
 
        when S_Done => Done <= '1';
     
     -- When others => next_state <= S_idle;  
    end case; 
  
       end process;
  
  
  end Behavioral;
