# 8085-pseudo-random-generator
Code that pseudo-creates random numbers on conditions. Plays a sound on each condition, displays the number and prints the period of the generator.

Reads a number from the keyboard with a subroutine written 0133H (already on the EPROM).
If the number between 0x0-0xF or is the number 0x17 it produces a sound of 1KHz by sending a 1KHz square wave using the SOD, else plays 2KHz.
1KHz is considered correct and 2KHz incorrect.
If the number is correct, the generator produces a new number, the period counter is increased, and the new number is displayed for 1 second on the 7 segment displays.
The process is repeated until the first number (seed) is generated.

Thanks to Ioannis Konstantinidis and Panayotis Mitropoulos for the assignment.
