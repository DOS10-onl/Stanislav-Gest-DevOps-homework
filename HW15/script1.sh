#! /bin/bash
#input for keyboard
read -p "enter number 1: " num1  
read -p "enter number 2: " num2        
#multiply and echo to output 
ans=$((num1*num2))
echo "multiply of num1 and num2: " $ans 
# even or odd
if (($ans %2 == 0))
then 
    echo "$ans is even (0)"
else 
    echo "$ans is odd (1)"
fi