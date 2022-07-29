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
 -- PORT MAP ( R => , Resetn=>  ,   E =>  ,clk=> , Q => ); 
 PORT ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
        Resetn : in STD_LOGIC;
        E : in STD_LOGIC;
        clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (N-1 downto 0));
END COMPONENT;


COMPONENT ELE218_Control is
    Port ( Control : in STD_LOGIC_VECTOR (31 downto 0);
           clk : in STD_LOGIC;
           OutControl : out STD_LOGIC_VECTOR (5 downto 0);
           inControl : out STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;
    
COMPONENT ELE218_TriN is
    GENERIC(N : INTEGER:= 8);
    Port ( Din : in STD_LOGIC_VECTOR (N-1 downto 0);
           Dout : out STD_LOGIC_VECTOR (N-1 downto 0);
           E : in STD_LOGIC);
 END COMPONENT;  
 
 COMPONENT ELE218_AddressDecoder is
    Port ( Address : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RW_Bus : out STD_LOGIC_VECTOR (9 downto 0));
END COMPONENT; 
COMPONENT ELE218_Prescaler is
    Port ( R : in STD_LOGIC_VECTOR (15 downto 0);
           L : in STD_LOGIC;
           E : in STD_LOGIC;
           Resetn: in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_e : out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT; 

COMPONENT ELE218_UpDownCounter is
    GENERIC( N:INTEGER := 8);
    Port ( R : in STD_LOGIC_VECTOR (N-1 downto 0);
           Rin : in STD_LOGIC;
           Clock : in STD_LOGIC;
           Count : in STD_LOGIC;
           UP_DOWN : in STD_LOGIC;
           clear: in STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (N-1 downto 0));
END COMPONENT;

--PORT MAP (CounterValue =>, AutoReloadValue =>, CompeareValue =>, OutControl =>, AutoClear =>, PWMOut =>, )
COMPONENT CompareAndOutControl is
    generic( N:integer := 8);
    Port ( CounterValue : in STD_LOGIC_VECTOR (N-1 downto 0);
           AutoReloadValue : in STD_LOGIC_VECTOR (N-1 downto 0);
           CompeareValue : in STD_LOGIC_VECTOR (N-1 downto 0);
           OutControl : in STD_LOGIC;
           AutoClear : out STD_LOGIC;
           PWMOut : out STD_LOGIC);
end COMPONENT;

END ELE218_Components;       
