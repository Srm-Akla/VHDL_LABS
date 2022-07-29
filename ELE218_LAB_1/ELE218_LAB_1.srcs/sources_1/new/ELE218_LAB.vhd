----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2021 17:21:31
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
generic( N : integer:=8);
    Port ( Data_Bus : inout STD_LOGIC_VECTOR (N-1 downto 0);
           Control_Bus : in STD_LOGIC_VECTOR (7 downto 0);
           Adresse_Bus : in STD_LOGIC_VECTOR (7 downto 0);
           Clk : in STD_LOGIC;
           resetn : in STD_LOGIC);
end ELE218_LAB;

architecture Behavioral of ELE218_LAB is
signal InControlBus : std_logic_vector(3 downto 0);
signal OutControlBus : std_logic_vector(6 downto 0);
signal P_DataBus : std_logic_vector(N-1 downto 0);
Signal Reg_R0_Q : std_logic_vector(N-1 downto 0);
Signal Reg_R1_Q : std_logic_vector(N-1 downto 0);
Signal Reg_R2_Q : std_logic_vector(N-1 downto 0);
Signal Reg_R3_Q : std_logic_vector(N-1 downto 0);
Signal Alu_F : std_logic_vector(N-1 downto 0);

begin
Reg_R0: ELE218_RegNE generic map (N => N)
        port map (R => P_DataBus, E => InControlBus(0), clk => clk, Q => Reg_R0_Q, Resetn => resetn);
Reg_R1: ELE218_RegNE generic map (N => N)
        port map (R => P_DataBus, E => InControlBus(1), clk => clk, Q => Reg_R1_Q, Resetn => resetn);
Reg_R2: ELE218_RegNE generic map (N => N)
        port map (R => P_DataBus, E => InControlBus(2), clk => clk, Q => Reg_R2_Q, Resetn => resetn);
Reg_R3: ELE218_RegNE generic map (N => N)
        port map (R => P_DataBus, E => InControlBus(3), clk => clk, Q => Reg_R3_Q, Resetn => resetn);
        
Tri_R0: ELE218_TriN generic map (N => N)
        port map (Din => Reg_R0_Q, Dout => P_DataBus, E => OutControlBus(0));
Tri_R1: ELE218_TriN generic map (N => N)
        port map (Din => Reg_R1_Q, Dout => P_DataBus, E => OutControlBus(1));
Tri_R2: ELE218_TriN generic map (N => N)
        port map (Din => Reg_R2_Q, Dout => P_DataBus, E => OutControlBus(2));
Tri_R3: ELE218_TriN generic map (N => N)
        port map (Din => Reg_R3_Q, Dout => P_DataBus, E => OutControlBus(3));
Tri_R4: ELE218_TriN generic map (N => N)
        port map (Din => Data_Bus, Dout => P_DataBus, E => OutControlBus(4));
Tri_R5: ELE218_TriN generic map (N => N)
        port map (Din => P_DataBus, Dout => Data_Bus, E => OutControlBus(5));
Tri_R6: ELE218_TriN generic map (N => N)
        port map (Din => Alu_F, Dout => Data_Bus, E => OutControlBus(6));
         
Alu: ELE218_ALU
    Port map (sel => Reg_R0_Q (2 downto 0), A => Reg_R2_Q, B => Reg_R3_Q, F => Alu_F);
        
Control_logic: ELE218_LAB_control
    Port map ( Control => Control_Bus, Adresse => Adresse_Bus, clk => Clk, OutControl => OutControlBus, inControl => InControlBus);
end Behavioral;
