#!/usr/bin/env bash
# shellcheck shell=bash

set -eu -o pipefail

MIRROR=${MIRROR:-true}
ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

param=${1:-unknown}

## Make config
function make_config() {
    mkdir -p ~/{.ssh,.config}
    ln -sf -t ~/.ssh .ssh/config
    ln -sf -t ~/.config .config/{git,go,pip,vim,wezterm}
    ln -sf -t ~ ./{.screenrc,.npmrc}

    if type flatpak &>/dev/null; then
        flatpak override --user --unset-env=QT_IM_MODULE
        flatpak override --user --filesystem=xdg-data/icons:ro
        flatpak override --user --filesystem=xdg-data/themes:ro
        flatpak override --user --filesystem=xdg-config/fontconfig:ro
    fi

    if ! grep -w .mnde/init.bash ~/.bashrc &>/dev/null; then
        echo '' >> ~/.bashrc
        echo '# mnde configuration' >> ~/.bashrc
        echo '[[ -r ~/.mnde/init.bash ]] && source ~/.mnde/init.bash' >> ~/.bashrc
    fi
}

## Go installtion
function install_go() {
    if [[ -d "$ROOT_PATH/go" ]]; then
        echo "Go already installed"
        return
    fi
    local arch kernel version url
    arch=$(uname -m|sed 's/x86_64/amd64/g')
    kernel=$(uname -s|tr '[:upper:]' '[:lower:]')
    if [[ $MIRROR == "true" ]]; then
        version=$(curl -sL https://golang.google.cn/VERSION?m=text|head -1)
        url=https://golang.google.cn/dl/$version.$kernel-$arch.tar.gz
    else
        version=$(curl -sL https://go.dev/VERSION?m=text|head -1)
        url=https://go.dev/dl/$version.$kernel-$arch.tar.gz
    fi

    curl -kL "$url" | tar -xz -C /tmp/
    mv /tmp/go "$ROOT_PATH/go"
}

## NodeJS installation
function install_node() {
    if [[ -d "$ROOT_PATH/node" ]]; then
        echo "Node already installed"
        return
    fi
    local version url
    if [[ $MIRROR == "true" ]]; then
        version=$(curl -sL https://mirrors.huaweicloud.com/nodejs/index.tab | awk 'NR==2 {print $1}')
        url=https://mirrors.huaweicloud.com/nodejs/$version/node-$version-linux-x64.tar.xz
    else
        version=$(curl -sL https://nodejs.org/dist/index.tab | awk 'NR==2 {print $1}')
        url=https://nodejs.org/dist/$version/node-$version-linux-x64.tar.xz
    fi

    curl -kL "$url" | tar -xJ -C /tmp/
    mv "/tmp/node-$version-linux-x64" "$ROOT_PATH/node"
}

case $param in
    config)
        make_config
        ;;
    go)
        install_go
        ;;
    node)
        install_node
        ;;
    *)
        echo "unable to recognize command $@"
        exit 1
esac
