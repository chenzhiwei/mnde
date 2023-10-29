#!/usr/bin/bash
# shellcheck shell=bash

set -eux -o pipefail

MIRROR=${MIRROR:-true}
ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

## Symlink the config
function make_symlink() {
    cd ~
    mkdir -p .ssh .config
    ln -nsf .mnde/.config/vim .vim
    ln -sf -t . .mnde/.screenrc
    ln -sf -t .ssh ../.mnde/.ssh/config
    ln -sf -t .config ../.mnde/.config/{git,wezterm}
    if [[ $MIRROR == "true" ]]; then
        ln -sf -t . .mnde/.npmrc
        ln -sf -t .config ../.mnde/.config/{go,pip}
    fi

    # ln -sf -t .local/share/flatpak/overrides ../../../../.mnde/.local/share/flatpak/overrides/global
    # seems flatpak does not use symlink
    if type flatpak &>/dev/null; then
        flatpak override --user --unset-env=QT_IM_MODULE
        flatpak override --user --filesystem=xdg-config/fontconfig:ro
    fi
}

## Append ~/.bashrc
function append_bashrc() {
    if ! grep -w .mnde/init.bash ~/.bashrc &>/dev/null; then
        cat << 'EOF' >> ~/.bashrc

# mnde configuration
[[ -r ~/.mnde/init.bash ]] && source ~/.mnde/init.bash

EOF
    fi
}

## Go installtion
function go_install() {
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
function node_install() {
    if [[ -d "$ROOT_PATH/node" ]]; then
        echo "Node already installed"
        return
    fi
    local version url
    if [[ $MIRROR == "true" ]]; then
        version=$(curl -sL https://mirrors.aliyun.com/nodejs-release/index.tab | awk 'NR==2 {print $1}')
        url=https://mirrors.aliyun.com/nodejs-release/$version/node-$version-linux-x64.tar.xz
    else
        version=$(curl -sL https://nodejs.org/dist/index.tab | awk 'NR==2 {print $1}')
        url=https://nodejs.org/dist/$version/node-$version-linux-x64.tar.xz
    fi

    curl -kL "$url" | tar -xJ -C /tmp/
    mv "/tmp/node-$version-linux-x64" "$ROOT_PATH/node"
}

make_symlink
append_bashrc

go_install
node_install
