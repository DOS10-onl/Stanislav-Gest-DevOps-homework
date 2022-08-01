#! /bin/bash

#define array
#array=($1 $2 $3 $4 $5)
#difine array via read - to more easy access from script4
read -p " === enter 5 parameters === " n1 n2 n3 n4 n5

array=($n1 $n2 $n3 $n4 $n5)
#array = read $1 $2 $3 $4 $5 

#one line - one item
output () {
       echo "Array items:" 
       for item in ${array[*]}
       do
           printf " %s\n" $item
       done
}

#print 
output $array