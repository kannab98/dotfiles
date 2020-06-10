#!/bin/sh

dotfiles=~/.dotfiles
cd $dotfiles

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

#link 1 2
for j in ranger; do
    for i in $j/*; do
        echo "Create symlink $dotfiles/$i -> ~/.config/$i" 
        ln -sf ~/.dotfiles/$i ~/.config/$i
    done
done

