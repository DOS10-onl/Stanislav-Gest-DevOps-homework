#!/bin/bash

#count quantity of files in directory
A= find /home/stas/examples/lesson13/ -type f| wc -l
# here i'm tryed to make a beautiful output, but i forgot how to work with variable
echo " current directory consist of $A files" 
#detecting all permissions and change to 664 if was 777
find /home/stas/examples/lesson13/ -type f -perm 777 -exec chmod 644 {} \;
#find all empty files and delete it 
find /home/stas/examples/lesson13/ -type f -empty -print -delete

