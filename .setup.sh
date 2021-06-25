#!/bin/bash

ROOT_PATH=$(cd $(dirname ${BASH_SOURCE}) && pwd -P)

if ! type curl &>/dev/null; then
    echo
    echo "this script requires curl to work properly"
    echo
    exit 1
fi

cd $ROOT_PATH

## NodeJS
function node_install() {
    VERSION=$(curl -s https://nodejs.org/dist/index.tab | awk '/Fermium/{print $1;exit}')
    URL=https://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.xz

    curl -kL $URL | tar -xJ -C /tmp/
    rm -rf node && mv /tmp/node-$VERSION-linux-x64 node
}

## Golang installtion
function golang_install() {
    ARCH=$(uname -m|sed 's/x86_64/amd64/g')
    KERNAL=$(uname -s|tr '[:upper:]' '[:lower:]')
    VERSION=$(curl -s https://golang.org/VERSION?m=text)
    URL=https://dl.google.com/go/${VERSION}.${KERNAL}-${ARCH}.tar.gz

    curl -kL $URL | tar -xz -C /tmp/

    rm -rf go && mv /tmp/go go
}

node_install
golang_install
