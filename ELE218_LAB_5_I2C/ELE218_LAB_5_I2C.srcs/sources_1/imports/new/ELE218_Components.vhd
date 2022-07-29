----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.10.2020 09:36:12
-- Design Name: 
-- Module Name: ELE218_Components - Behavioral
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

PACKAGE ELE218_Components IS
--N-bit Register with Enable

COMPONENT ELE218_RegNE  is
 GENERIC( N : INTEGER:=4);
 PORT ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
        Resetn : in STD_LOGIC;
        E : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (N-1 downto 0));
END COMPONENT;



    
COMPONENT ELE218_TriN is
    GENERIC(N : INTEGER:= 8);
    Port ( Din : in STD_LOGIC_VECTOR (N-1 downto 0);
           Dout : out STD_LOGIC_VECTOR (N-1 downto 0);
           E : in STD_LOGIC);
 END COMPONENT;   
 
 -- PORT MAP ( clk => , Reset_b => , Start => , Stop =>, Data_Done =>,  R_W => ,  EA => , EB => ,EC =>,  LB => , done =>);
COMPONENT ELE218_FSM_Control_unit is
    Port ( Clk: in STD_LOGIC;
           Reset_b: in STD_LOGIC;
           Start: in STD_LOGIC;
           Stop: in STD_LOGIC;
           Data_done: in STD_LOGIC;
           SCK_P_edge: in STD_LOGIC;
           SCK_N_edge: in STD_LOGIC;
           R_W: in STD_LOGIC;
           adress_right: in STD_LOGIC;
           EA : out STD_LOGIC;
           LA : out STD_LOGIC;
           EB : out STD_LOGIC;
           EC : out STD_LOGIC;
           ED : out STD_LOGIC;
           LB : out STD_LOGIC;
           ACK : out STD_LOGIC;
           Writing : out STD_LOGIC;
           Done : out STD_LOGIC);
           
end COMPONENT;
-- PORT MAP ( R => , Resetn => , E => , L => , W => , clk => , Q => );
COMPONENT ELE218_ShiftL is
 GENERIC( N:INTEGER :=4);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           L : in STD_LOGIC;
           W : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end COMPONENT;

-- PORT MAP ( R => , Resetn => , E => , L => , clk => , Q => );
COMPONENT ELE218_Counter_up is
 GENERIC( N:INTEGER :=8);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           L : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end COMPONENT;
-- Port map ( clk => , resetn => , LA=> , EA => , LB => , EB => , EC =>, SDL => , Data_in => , Z => ,adress_right => ,Data_word_done =>, Data_RX =>, Count_out => );
COMPONENT ELE218_LAB_5_DataPath is
   GENERIC( N:INTEGER :=4);
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
           Data_in : in STD_LOGIC_VECTOR (N -1 downto 0);
           Z : out STD_LOGIC;
           RW : out STD_LOGIC;
           adress_right: out STD_LOGIC;
           Data_word_done: out STD_LOGIC;
           Data_RX : out STD_LOGIC_VECTOR (N-1 downto 0);
           Count_out : out STD_LOGIC_VECTOR (N -1 downto 0));
           
end COMPONENT;
-- PORT MAP ( clk =>, SDA =>, SCL =>, SDA_synk =>, SCL_N_edge => , SCL_P_edge => , START_sig =>, STOP_sig => , Running_sig =>);
COMPONENT ELE218_LAB_5_Nyttige_signaler is
    Port ( clk : in STD_LOGIC;
           SDA : in STD_LOGIC;
           SCL : in STD_LOGIC;
           SDA_synk:out STD_LOGIC;
           SCL_N_edge : out STD_LOGIC;
           SCL_P_edge : out STD_LOGIC;
           START_sig : out STD_LOGIC;
           STOP_sig : out STD_LOGIC;
           Running_sig : out STD_LOGIC);
end COMPONENT;
           


END ELE218_Components;       
