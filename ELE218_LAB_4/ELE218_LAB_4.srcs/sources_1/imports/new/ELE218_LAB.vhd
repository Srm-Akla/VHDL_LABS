----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 11:20:39
-- Design Name: 
-- Module Name: ELE218_LAB - Behavioral
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

entity ELE218_LAB is
    Port ( Data_bus : inout STD_LOGIC_VECTOR (31 downto 0);
           Control_bus : in STD_LOGIC_VECTOR (31 downto 0);
           Clk : in STD_LOGIC);
end ELE218_LAB;

architecture Behavioral of ELE218_LAB is
signal InControlBus : STD_LOGIC_VECTOR(3 downto 0);
signal OutControlBus : STD_LOGIC_VECTOR(5 downto 0);
signal P_DataBus: STD_LOGIC_VECTOR(31 downto 0);
signal Reg_R0_Q: STD_LOGIC_VECTOR(31 downto 0);
signal Reg_R1_Q: STD_LOGIC_VECTOR(31 downto 0);
signal Reg_R2_Q: STD_LOGIC_VECTOR(31 downto 0);
signal Reg_R3_Q: STD_LOGIC_VECTOR(31 downto 0);
signal Resetn: STD_LOGIC;
signal Control_1 : STD_LOGIC_VECTOR (31 downto 0);
signal Control_2 : STD_LOGIC_VECTOR (31 downto 0);
signal Data_bus_1 : STD_LOGIC_VECTOR (31 downto 0);
signal Data_bus_2 : STD_LOGIC_VECTOR (31 downto 0);

begin
Resetn<= '1';

PROCESS(clk)
begin
 IF clk'EVENT AND clk ='1' THEN Control_1<= Control_bus; Control_2<= Control_1; Data_bus_1<= Data_bus; Data_bus_2<= Data_bus_1;
 end if;
END PROCESS; 



Reg_R0: ELE218_RegNE GENERIC MAP ( N => 32)
       PORT MAP ( R =>P_DataBus, E => InControlBus(0), clk => clk, Q => Reg_R0_Q, Resetn => Resetn);
       
Reg_R1: ELE218_RegNE GENERIC MAP ( N => 32)
       PORT MAP ( R =>P_DataBus, E => InControlBus(1), clk => clk, Q => Reg_R1_Q, Resetn => Resetn);

Reg_R2: ELE218_RegNE GENERIC MAP ( N => 32)
       PORT MAP ( R =>P_DataBus, E => InControlBus(2), clk => clk, Q => Reg_R2_Q, Resetn => Resetn);
       
Reg_R3: ELE218_RegNE GENERIC MAP ( N => 32)
       PORT MAP ( R =>P_DataBus, E => InControlBus(3), clk => clk, Q => Reg_R3_Q, Resetn => Resetn); 
       
Cont   : ELE218_Control
        PORT MAP ( Control =>Control_2, clk => clk , OutControl => OutControlBus, inControl =>InControlBus);  
        
 Tri_Ro : ELE218_TriN GENERIC MAP ( N => 32)
         PORT MAP (   Din => Reg_R0_Q, Dout => P_DataBus, E=>OutControlBus(0)); 
 Tri_R1 : ELE218_TriN GENERIC MAP ( N => 32)
         PORT MAP (   Din => Reg_R1_Q, Dout => P_DataBus, E=>OutControlBus(1));   
 Tri_R2 : ELE218_TriN GENERIC MAP ( N => 32)
         PORT MAP (   Din => Reg_R2_Q, Dout => P_DataBus, E=>OutControlBus(2));
 Tri_R3 : ELE218_TriN GENERIC MAP ( N => 32)
         PORT MAP (   Din => Reg_R3_Q, Dout => P_DataBus, E=>OutControlBus(3));  
 Tri_Din : ELE218_TriN GENERIC MAP ( N => 32)
         PORT MAP (   Din => Data_bus_2, Dout => P_DataBus, E=>OutControlBus(4));   
 Tri_Dout: ELE218_TriN GENERIC MAP ( N => 32)
         PORT MAP (   Din =>P_DataBus, Dout => Data_bus, E=>OutControlBus(5));                                       

end Behavioral;
