#!/bin/bash
SECRET=$((RANDOM % 100 + 1))
MAX_ATTEMPTS=5
 
echo "  Welcome to the Guessing Game!"
echo "  Guess a number between 1-100"
for ((attempt=1; attempt<=MAX_ATTEMPTS; attempt++)); do
    echo ""
    echo "Attempt $attempt of $MAX_ATTEMPTS:"
    read -p "Your guess: " guess
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        ((attempt--))
        continue
    fi
 
    if [[ $guess -eq $SECRET ]]; then
        echo ""
        echo "You guessed the right number."
        exit 0
    elif [[ $guess -gt $SECRET ]]; then
        echo "Too high. Try lower."
    else
        echo "Too low. Try higher."
    fi
done
 
echo ""
echo "You've run out of attempts. The correct number was $SECRET"
exit 0
 
