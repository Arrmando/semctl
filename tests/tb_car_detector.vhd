--UHUUUUUUUUUUUUUUUUUUUL!!!!!!!!!!!!!!!!!!!!!!!!!!!
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_car_detector is
end entity tb_car_detector;

architecture testbench of tb_car_detector is

    constant CLK_PERIOD : time := 10 ns;
    signal clk_enable : boolean := true;

    component car_detector is
        port (
            E  	: in  std_logic;
            SET	: in  std_logic;
            CLK : in  std_logic;
            Q 	: out std_logic
        );
    end component;


    signal E_tb  	: std_logic := '0';
    signal Q_tb  	: std_logic := '0';
    signal SET_tb 	: std_logic := '0';
    signal CLK_tb 	: std_logic := '0';

begin

    uut: car_detector
        port map (
            E  	=> E_tb,
            Q 	=> Q_tb,
            SET => SET_tb,
            CLK => CLK_tb
        );


    clk_process: process
    begin
        while clk_enable loop
            CLK_tb <= '0';
            wait for CLK_PERIOD/2;
            CLK_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    test_process: process
    begin
        
        SET_tb <= '1';
        wait for 1 * CLK_PERIOD; 
        
        SET_tb <= '0';
        wait for 2 * CLK_PERIOD;
        
        SET_tb <= '1';
        wait for 1 * CLK_PERIOD;
        
        SET_tb <= '0'; 
        wait for 1 * CLK_PERIOD;
        
        SET_tb <= '1';
        wait for 4 * CLK_PERIOD; 
        
        clk_enable <= false; 
        wait;
    end process;

end architecture testbench;