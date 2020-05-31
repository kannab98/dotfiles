#!/bin/bash

killall -q nm-applet

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done


nm-applet &
