#!/bin/bash

monitor_internal=eDP1
monitor_external=HDMI1

external_status=$(</sys/class/drm/card0/card0-eDP-1/status)

if [ $external_status == "connected" ]; then
    xrandr --output $monitor_external --off
    xrandr --output $monitor_external --auto --above $monitor_internal
    $picom/picom.sh
    $polybar/polybar.sh
    #notify-send --urgency=low -t 3000 "HDMI connected"
    echo "HDMI connected"
else
    xrandr --output $monitor_external --off
    $picom/picom.sh
    $polybar/polybar.sh
    #notify-send --urgency=low -t 3000 "HDMI disconnected"
    echo "HDMI disconnected"
fi

