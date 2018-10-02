#!/bin/bash

base=$(cd $(dirname $0) && pwd)

rsync -a "$base"/.[a-z0-9]* --exclude='.git' --exclude='.gitignore' --exclude='.gitmodules' $HOME

# dconf dump /org/gnome/terminal/ > gnome-terminal.dconf
dconf load /org/gnome/terminal/ < $base/gnome-terminal.dconf

if [ -f $HOME/.bashrc ]; then
    if ! grep -wq bash_improve $HOME/.bashrc; then
        echo '. $HOME/.bash_improve' >> $HOME/.bashrc
    fi
else
    if ! grep -wq bash_improve $HOME/.bash_profile; then
        echo '. $HOME/.bash_improve' >> $HOME/.bash_profile
    fi
fi
