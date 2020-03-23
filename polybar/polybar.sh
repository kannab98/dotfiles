#!/bin/bash

# Завершить текущие экземпляры polybar
killall -q polybar

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [ "XDG_CURRENT_DESKTOP" = "i3" ]; then
            MONITOR=$m polybar --reload bottom &
            MONITOR=$m polybar --reload top &
        else
            MONITOR=$m polybar --reload only-top&
        fi;
    done;
fi;
