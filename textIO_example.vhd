library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;

entity exampleIO is
end entity;

architecture standardIO of exampleIO is
begin
  process is
    variable my_line : line;   
    variable filename : string(1 to 10); 
    variable f_status: file_open_status;
    file testfile: text;
    
    begin
      write(my_line, string'("Beginning to test..."));
      writeline(output, my_line);
      readline(input, my_line);
      read(my_line, filename);
      write (my_line, string'(" ... see what I can write..."));
      writeline (output, my_line);
      file_open(f_status, testfile, filename, write_mode);
      write(my_line, string'("the name of the file is "));
      write(my_line, filename);
      writeline(testfile, my_line);
  wait;
  end process;
end architecture standardIO; 

architecture UsingTextFiles of exampleIO is
begin
  process is
     variable my_line : line; 
     file infile: text open read_mode is "my_inputFile.txt";
     file outfile: text open write_mode is "my_outputFile.txt"; 
     
    variable num : integer;
       
    begin
      write(my_line, string'("Beginning to test..."));
      writeline(outfile, my_line);
      while not (endfile(infile)) loop
        readline(infile, my_line);
        read(my_line, num);
        if num /= 0 then 
          write(output, string'(" not zero "));
          write(my_line, num);
          writeline (outfile, my_line);
        end if;
      end loop;
      write(my_line, string'("Finishing the test..."));
      writeline(outfile, my_line);
      
  wait;
  end process;
end architecture UsingTextFiles; 

architecture stdLogic of exampleIO is
  
begin

process is

   variable temp1 : std_logic_vector(1 downto 0);
   variable my_line : line; 
     file infile: text open read_mode is "my_stdLogicFile.txt";
     file outfile: text open write_mode is "my_outstdLogicFile.txt"; 
       
    begin
      write(my_line, string'("Beginning to test std logic IO..."));
      writeline(outfile, my_line);
      while not (endfile(infile)) loop
        readline(infile, my_line);
        read(my_line, temp1);
        if temp1(0) /= '0' then 
          write(output, string'(" not zero "));
          write(my_line, temp1);
          writeline (outfile, my_line);
        end if;
      end loop;
      write(my_line, string'("Finishing the test for std logic..."));
      writeline(outfile, my_line);
      
  wait;
  end process; 
end architecture stdLogic;