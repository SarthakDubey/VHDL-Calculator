library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.decoder.all;
use WORK.calc_const.all;


ENTITY calculator is
		port(
			--Inputs
			 DIN1 		:	in std_logic_vector(DIN1_WIDTH	-	1 downto 0);
			 DIN2 		:	in std_logic_vector(DIN2_WIDTH	-	1 downto 0);
			 operation 	:	in std_logic_vector(OP_WIDTH	-	1 downto 0);
			 --Outputs
			 DOUT			:	out std_logic_vector(DOUT_WIDTH	-	1 downto 0);
			 sign			:	out std_logic
			);
END ENTITY calculator;		 

architecture behavioral of calculator is
	SIGNAL a: INTEGER;
	SIGNAL b: INTEGER;
	SIGNAL result: INTEGER;
	CONSTANT c: INTEGER :=0;
begin
	
	a<=to_integer(signed(DIN1));
	b<=to_integer(signed(DIN2));
	PROCESS(a,b,result,operation)
	begin
		if operation = "00" then
			result <= (a+b);
		elsif operation= "01" then
			result<=(a-b);
		elsif operation= "10" then
			result<=(a*b);
		else
			result<=c;
		end if;
		if result>c then
			sign<='0';
		else
			sign<='1';
		end if;
			DOUT<=std_logic_vector(abs(to_signed(result,12)));
	END PROCESS;
			   
end architecture behavioral;