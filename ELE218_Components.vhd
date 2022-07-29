----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2020 14:42:28
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


COMPONENT ELE218_FSM_Control_unit is
    Port ( Clk: in STD_LOGIC;
           Reset_b: in STD_LOGIC;
           Start: in STD_LOGIC;
           A0: in STD_LOGIC;
           z: in STD_LOGIC;
           EA : out STD_LOGIC;
           EB : out STD_LOGIC;
           LB : out STD_LOGIC;
           Done : out STD_LOGIC);
 END COMPONENT;  
 
COMPONENT ELE218_ShiftR is
    GENERIC( N:INTEGER :=8);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           L : in STD_LOGIC;
           W : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0)); 
 END COMPONENT; 
 --PORT MAP(R => , Resetn => , E => , L => , W => , clk => , Q => );
COMPONENT ELE218_Counter_up is
 GENERIC( N:INTEGER :=8);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Resetn : in STD_LOGIC;
           E : in STD_LOGIC;
           L : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
END COMPONENT;  
--PORT MAP (Clk => , resetn => , LA => , EA => , LB => , EB => , Data_in => , z => , A0 => , Done => , Count out => )
COMPONENT ELE218_LAB_3_DataPath is
    Port ( Clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           LA : in STD_LOGIC;
           EA : in STD_LOGIC;
           LB : in STD_LOGIC;
           EB : in STD_LOGIC;
           Data_in : in STD_LOGIC_VECTOR (7 downto 0);
           z : out STD_LOGIC;
           A0 : out STD_LOGIC;
           Done : out STD_LOGIC;
           Count_out : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

END ELE218_Components;       
