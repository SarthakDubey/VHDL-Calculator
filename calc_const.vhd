library IEEE;
use IEEE.std_logic_1164.all;
package calc_const is
	
	constant DIN1_WIDTH	:	natural	:=	8;
	constant DIN2_WIDTH	:	natural	:=	4;
	constant OP_WIDTH		:	natural	:=	2;
	constant DOUT_WIDTH	:	natural	:=	12;
	-- For each module, which you want to add to this package, you will
	-- place their COMPONENT declarations here one by one, in this case we
	-- just have one module
end package calc_const;
package body calc_const is
--Subroutine declarations (if there are any such as functions and procedures)
-- go here
end package body calc_const;