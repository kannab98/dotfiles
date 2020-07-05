#!/bin/bash

# Завершить текущие экземпляры polybar
killall -q polybar

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        #if [ $m != "VIRTUAL1" ]; then
            #if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
                #MONITOR=$m polybar --reload top &
            #else
                #MONITOR=$m polybar --reload top&
            #fi;
        #fi;
        MONITOR=$m polybar --reload top&
        #if [ $m != "HDMI-1" ]; then
        #fi
    done;
fi;
