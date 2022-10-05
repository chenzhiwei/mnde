#!/bin/bash

ROOT_PATH=$(cd $(dirname ${BASH_SOURCE}) && pwd -P)

HOME_PATH="$ROOT_PATH/home"

cd $HOME

ln -sf $HOME_PATH/.bashrc       .bashrc
ln -sf $HOME_PATH/.gitconfig    .gitconfig
ln -sf $HOME_PATH/.npmrc        .npmrc
ln -sf $HOME_PATH/.ssh/config   .ssh/config

\cp -r $HOME_PATH/.config/go    .config/
