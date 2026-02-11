#!/usr/bin/env bash
# shellcheck shell=bash

set -eu -o pipefail

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

cd "$ROOT_PATH"

## Setup mito
function setup_mito() {
    if [ ! -d /opt/mito ]; then
        sudo mkdir -p /opt/mito && sudo chown -R $USER:$USER /opt/mito
    fi

    cp -r mito/* /opt/mito/
}

## Make config
function make_config() {
    mkdir -p ~/{.ssh,.config}
    ln -sf -t ~/.ssh ../.mnde/.ssh/config
    ln -sf -t ~/.config ../.mnde/.config/{git,go,pip,vim,wezterm,ghostty}
    ln -sf -t ~ .mnde/{.screenrc,.npmrc}

    if type flatpak &>/dev/null; then
        flatpak override --user --unset-env=QT_IM_MODULE
        flatpak override --user --filesystem=xdg-data/icons:ro
        flatpak override --user --filesystem=xdg-data/themes:ro
        flatpak override --user --filesystem=xdg-config/fontconfig:ro
    fi
}

## Tips
function tips() {
    echo
    echo "source ~/.mnde/bashrc"
    echo "mito install go"
    echo "mito install gopls"
    echo "mito install node"
    echo
}

setup_mito
make_config
