#!/bin/bash

# Завершить текущие экземпляры polybar
killall -q compton

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x compton >/dev/null; do sleep 1; done

compton --config $HOME/.config/i3/compton.conf &
