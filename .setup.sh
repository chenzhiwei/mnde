#!/bin/bash

ROOT_PATH=$(cd $(dirname ${BASH_SOURCE}) && pwd -P)

cd $ROOT_PATH

## NodeJS
function node_install() {
    VERSION=$(curl https://resolve-node.vercel.app/lts)
    URL=https://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.xz
    if type curl &>/dev/null; then
        curl -kL $URL | tar -xz -C /tmp/
    else
        wget -O - $URL | tar -xz -C /tmp/
    fi
}

## Golang installtion
function golang_install() {
    ARCH=$(uname -m|sed 's/x86_64/amd64/g')
    KERNAL=$(uname -s|tr '[:upper:]' '[:lower:]')
    VERSION=$(curl -s https://golang.org/VERSION?m=text)
    URL=https://dl.google.com/go/${VERSION}.${KERNAL}-${ARCH}.tar.gz

    if type curl &>/dev/null; then
        curl -kL $URL | tar -xz -C /tmp/
    else
        wget -O - $URL | tar -xz -C /tmp/
    fi

    rm -rf go && mv /tmp/go go
}
