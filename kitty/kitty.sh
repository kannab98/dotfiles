#!/bin/bash

title=$(cat ~/.dotfiles/kitty/title)
cwd=~/
if [[ $title = VIM* ]]; then
    #name=$(echo $serverlist | rev | cut -d ' ' -f 1 | rev)
    cwd=$(vim --servername $title --remote-expr "execute(\"pwd\")")
fi

tmpfile=~/.dotfiles/kitty/kittytmp
if [ -S $tmpfile ]; then
    kitty @ --to unix:$tmpfile new-window --window-type os --cwd $cwd
else
    killall -q kitty
    while pgrep -u $UID -x kitty >/dev/null; do sleep 1; done
    kitty --detach --listen-on unix:$tmpfile
fi
