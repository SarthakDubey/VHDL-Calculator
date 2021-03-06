library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;
use STD.textio.all;
use WORK.calc_const.all;

entity calculator_tb is
end entity;

architecture UsingTextFiles of calculator_tb is
COMPONENT calculator is
    port(
      --Inputs
       DIN1     : in std_logic_vector(DIN1_WIDTH  - 1 downto 0);
       DIN2     : in std_logic_vector(DIN2_WIDTH  - 1 downto 0);
       operation  : in std_logic_vector(OP_WIDTH  - 1 downto 0);
      --Outputs
       DOUT     : out std_logic_vector(DOUT_WIDTH - 1 downto 0);
       sign     : out std_logic
      );
END COMPONENT calculator; 
SIGNAL snum1 : integer;
SIGNAL snum2 : integer;
SIGNAL sop : std_logic_vector(OP_WIDTH  - 1 downto 0);
 
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
		  
      

  --wait;
  end process readtext;
  
  writetext: process is
    variable my_line : line;
    file outfile: text open write_mode is "my_outputFile.txt";
    variable num : integer;
    begin
    write(my_line, string'("Beginning to test..."));
    writeline(outfile, my_line);

    write(my_line, string'("Finishing the test..."));
    writeline(outfile, my_line);
    end process writetext;
end architecture UsingTextFiles; 
