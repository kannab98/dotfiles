#!/bin/sh

dotfiles=~/.dotfiles

check_files() {

if [ -f "$HOME/.config/i3/config" ]; then

    read -p "Create backup files if they exists?[y/n]" -n 1 -r $REPLY
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        backup=1
    else
        backup=0
    fi
fi
    
}

link(){
     ln -sf $1 $2 
}

link 1 2
