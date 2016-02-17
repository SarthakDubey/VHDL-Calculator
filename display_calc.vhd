library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.decoder.all;
use WORK.calc_const.all;

--Additional standard or custom libraries go here
entity display_calc is
port(
--You will replace these with your actual inputs and outputs
inputs : in std_logic;
outputs : out std_logic
);
end entity display_calc;
architecture structural of display_calc is

component calculator is
port(
			--Inputs
			 DIN1 		:	in std_logic_vector(DIN1_WIDTH	-	1 downto 0);
			 DIN2 		:	in std_logic_vector(DIN2_WIDTH	-	1 downto 0);
			 operation 	:	in std_logic_vector(OP_WIDTH	-	1 downto 0);
			 --Outputs
			 DOUT			:	out std_logic_vector(DOUT_WIDTH	-	1 downto 0);
			 sign			:	out std_logic
			);
			end component calculator;
			
component ledlcd is
port(
			data_in : in std_logic_vector(3 downto 0);
			segments_out : out std_logic_vector(6 downto 0)
			);
	end component leddcd;
	
SIGNAL snum1 : integer;
SIGNAL snum2 : integer;
SIGNAL sop : std_logic_vector(OP_WIDTH  - 1 downto 0);
SIGNAL Output : std_logic_vector(DOUT_WIDTH	-	1 downto 0);
SIGNAL sgn			:	out std_logic;
begin
  readtext: process is
     variable my_line : line; 
     file infile: text open read_mode is "cal8.in";
     
	variable num1 : integer;
	variable num2 : integer;
	variable op : character;
    begin
      
      --while not (endfile(infile)) loop
        readline(infile, my_line);
        read(my_line, num1);
		  readline(infile,my_line);
		  read(my_line, num2);
		  readline(infile,my_line);
		  read(my_line, op);
		  
        if op='+' then 
         sop<="00";
			elsif op='-' then
			sop<="01";
			else
			sop<="10";
        end if;
		  snum1<=num1;
		  snum2<=num2;
P1 : calculator port map (snum1, snum2, sop, Output, sgn); 
--Signals and components go here


--Structural design goes here
end architecture structural;