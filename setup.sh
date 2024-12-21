#!/usr/bin/env bash
# shellcheck shell=bash

set -eu -o pipefail

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

cd "$ROOT_PATH"

## Setup mito
function setup_mito() {
    sudo mkdir -p /opt/mito && sudo chown -R $USER:$USER /opt/mito
    cp -r mito/* /opt/mito/

    if ! grep -wq /opt/mito/bin/mito $HOME/.bashrc; then
        echo '' >> $HOME/.bashrc
        echo '# mito configuration' >> $HOME/.bashrc
        echo '. /opt/mito/etc/bash_completion' >> $HOME/.bashrc
        echo 'eval $(/opt/mito/bin/mito shellenv)' >> $HOME/.bashrc

        echo 'please run following command'
        echo 'eval $(/opt/mito/bin/mito shellenv)'
    fi
}

## Make config
function make_config() {
    mkdir -p ~/{.ssh,.config}
    ln -sf -t ~/.ssh ../.mnde/.ssh/config
    ln -sf -t ~/.config ../.mnde/.config/{git,go,pip,vim,wezterm}
    ln -sf -t ~ .mnde/{.screenrc,.npmrc}

    if type flatpak &>/dev/null; then
        flatpak override --user --unset-env=QT_IM_MODULE
        flatpak override --user --filesystem=xdg-data/icons:ro
        flatpak override --user --filesystem=xdg-data/themes:ro
        flatpak override --user --filesystem=xdg-config/fontconfig:ro
    fi
}

setup_mito
make_config
