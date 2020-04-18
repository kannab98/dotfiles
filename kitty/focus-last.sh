#!/usr/bin/env bash
last=


xprop -root -spy _NET_ACTIVE_WINDOW | while :
do
    read line
    echo $line

    #[[ -z "$last" ]] || i3-msg "[id=$last] mark _last"
    last=$(echo "$line" | awk -F' ' '{printf $NF}')
    title=$(wmctrl -l | grep ${last:0:2}0${last:2}   |  awk -F' ' '{printf $NF}')
    full=$(wmctrl -l | grep ${last:0:2}0${last:2})
    echo $title > ~/.dotfiles/kitty/title

done

