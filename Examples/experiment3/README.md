# Game Of Nim

## Overview  
You will design a simple two-player game, Nim. Your program will implement the game which have the same rule and same game process.  

## Notes  
Rule In our variation of Nim, the game board consists of three rows of rocks. Row A contains 3 rocks, Row B contains 5 rocks, and Row C contains 8 rocks.  

The rules are as follows:  
1. Each player takes turns removing one or more rocks from a single row.  
2. A player cannot remove rocks from more than one row in a single turn.  
3. The game ends when a player removes the last rock from the game board. The player who removes the last rock loses.  

## Hints And Suggestions  
1. Remember, all input and output functions use ASCII characters. You are responsible for making any conversions that are necessary.  
2. For character input from the keyboard in this assignment, you should use TRAP x20 (GETC). To echo the characters onto the screen, you should follow each TRAP x20 with a TRAP x21 (OUT). Recall that TRAP x23 displays a banner to prompt the person at the keyboard to input a character. You do not need that banner since your program has its own style of prompt. Therefore you should use TRAP x20 which does the same as TRAP x23 except it does not print a banner on the screen to prompt for input.  
3. You should use subroutines where appropriate.  
4. In each subroutine you write, you should save and restore any registers that you use. This will avoid a major headache during debugging.  
5. A legitimate turn must contain the row, specified as A, B, or C (i.e., capital letter) followed by a number that is not larger than the number of rocks still remaining in that row. 