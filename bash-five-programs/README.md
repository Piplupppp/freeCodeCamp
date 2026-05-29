# Build Five Programs (freeCodeCamp)

This is my project for the **Bash Scripting** module from freeCodeCamp. 
It consists of 5 interactive terminal programs written in Bash that work together in sequence.

## Files in this project:

1. **`five.sh`**: The main executable file that runs all the other scripts in order.
2. **`questionnaire.sh`**: An interactive questionnaire that prompts the user for inputs and prints a custom greeting.
3. **`countdown.sh`**: A timer that performs a countdown starting from a given numerical argument.
4. **`bingo.sh`**: A random number generator that outputs Bingo numbers (from 1 to 75).
5. **`fortune.sh`**: A "Magic 8-Ball" style fortune teller that requires a Yes/No question ending with a question mark before revealing the future.

## How to run it

If you want to try it out locally on a Linux terminal (or Git Bash), clone this repository, navigate to this folder, ensure the files have execution permissions, and run the main script:

```bash
chmod +x *.sh
./five.sh
