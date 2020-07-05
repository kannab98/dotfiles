#!/bin/sh

link(){
     echo "Create symlink $1 -> /$1" 
     #ln -sf $1  
}

list(){
    if [ -d $1 ]; then
        for i in $1/*; do
            list $i
        done
    else
        echo $i
    fi
}

files=$(list etc )
files="${files:0}"
for file in $files; do
    link $file
done
