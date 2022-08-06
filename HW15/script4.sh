#! /bin/bash
dir=(/home/stas/homework/Stanislav-Gest-DevOps-homework/HW15)

while [ 1 = 1 ]
do 
echo "Choose which script from HW do you want to start 1,2 or 3. enter 0 to exit?"
read num 
    case $num in
        "1")
        source $dir/script1.sh
        ;;
        "2")
        source $dir/script2.sh
        ;;
        "3")
        source $dir/script3.sh
        ;;
        "0")
        break
        ;;
        *)
        echo "Wrong input"
        ;;
    esac
done