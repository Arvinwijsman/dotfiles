#!/bin/bash

# Prompt user for input with rofi
USER_INPUT=$(rofi -dmenu -p "Enter prompt:")

# Check if input is not empty
if [ -n "$USER_INPUT" ]
then
    # Pass input to sgpt command and print output
    sgpt_output=$(sgpt "$USER_INPUT")
    echo "$sgpt_output" | rofi -dmenu -p "Output:"
fi
