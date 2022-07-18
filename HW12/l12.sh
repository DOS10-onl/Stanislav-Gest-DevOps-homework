#! /bin/bash 

if [ ! -d /home/stas/examples/lesson12 ]; then
  mkdir -p /home/stas/examples/lesson12;
fi
TODAY=$(date +"Today is %A, %d of %B")
TIMENOW=$(date +"The local time is %r")
echo "1 - $TODAY $TIMENOW" >/home/stas/examples/lesson12/examplelesson12.txt
echo "2 - $TODAY $TIMENOW" >> /home/stas/examples/lesson12/examplelesson12.txt
echo "3 - $TODAY $TIMENOW" >> /home/stas/examples/lesson12/examplelesson12.txt