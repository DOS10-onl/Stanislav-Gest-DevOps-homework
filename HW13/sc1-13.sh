#! /bin/bash 
#FOLDER = ./home/stas/examples/lesson13 
if [ ! -d /home/stas/examples/lesson13 ]; then
  mkdir -p /home/stas/examples/lesson13;
fi
echo "Hello World"> /home/stas/examples/lesson13/2strings.file
date >> /home/stas/examples/lesson13/2strings.file
echo "chmod " > /home/stas/examples/lesson13/permissions.file
chmod 777 /home/stas/examples/lesson13/permissions.file
# bash generate random 32 character alphanumeric string (lowercase only)
cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1  > /home/stas/examples/lesson13/random.file
touch  /home/stas/examples/lesson13/empty1.file /home/stas/examples/lesson13/empty2.file