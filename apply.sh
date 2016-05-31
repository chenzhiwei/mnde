#!/bin/bash

base=$(cd $(dirname $0) && pwd)

rsync -a "$base"/.[a-z0-9]* --exclude='.git' --exclude='.gitignore' --exclude='.gitmodules' $HOME

if [ -f $HOME/.bashrc ]; then
    if ! grep -wq bash_improve $HOME/.bashrc; then
        echo '. $HOME/.bash_improve' >> $HOME/.bashrc
    fi
else
    if ! grep -wq bash_improve $HOME/.bash_profile; then
        echo '. $HOME/.bash_improve' >> $HOME/.bash_profile
    fi
fi

# [ -f ~/.bashrc ] && echo '. $HOME/.bash_improve' >> ~/.bashrc || echo '. $HOME/.bash_improve' >> ~/.bash_profile
