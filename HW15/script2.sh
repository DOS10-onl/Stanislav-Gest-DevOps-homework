#! /bin/bash

tree_main () {

    for pathname in "$1"/*; do
        if [ -d "$pathname" ]; then
            tree_main "$pathname"
        else
            printf '%s\n' "$pathname"
        fi
    done
}

echo "Enter directory in format /HW15"
read dir
tree_main /home/stas/homework/Stanislav-Gest-DevOps-homework/$dir