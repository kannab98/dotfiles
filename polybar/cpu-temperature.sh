#!/bin/sh
function max() {
    for i in $temperature; do 
        if (($i>max)); then 
            max=$i; 
        fi;
    done;
}

function icon() {
    max = $1

    if ((max<40)); then
       echo 
    elif ((max<60)); then
       echo 
    elif ((max<90)); then
       echo 
    elif ((max<100)); then
       echo 
    fi;

}

temperature=$(sensors | grep Core | awk '{print substr($3, 2, length($3)-5)}' | tr "\\n" " " )

max $temperature

echo $(icon $max)"  "$(echo $max | sed 's/ /°C  /g'  | sed 's/  $//')°C


