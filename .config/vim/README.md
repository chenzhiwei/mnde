# The Vim Configuration

## Install Node

This vim configuration depends on node, so you need to install it first.

```
VERSION=$(curl -sL https://nodejs.org/dist/index.tab | awk 'NR==2 {print $1}')
curl -LO https://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.xz
tar xf node-$VERSION-linux-x64.tar.xz
```

## Setup

```
rm -f ~/.vimrc

go install golang.org/x/tools/gopls@latest

git clone https://github.com/chenzhiwei/vim ~/.vim

vim +PlugInstall +qall
```

## Commands

* Ctr + o Jump to previous visited locations
* Ctr + i Jump forward to the next locations
* Ctr + g Show the file info that currently edit

## Extended commands

* `CTRL + ]` switch to defination/declaration.
* `CTRL + T` to switch back.
* `:tn` switch to next defination/declaration.
* `:tp` switch to previous defination/declaration.
* `g]` switch between multiple tags.
* `:term` to open terminal, `ctrl-w N` to put terminal into normal mode(jkhl to move cursor)

## Settings

* `:windo set wrap` Wrap lines in vimdiff window

## Debug VIM

Following will generate a `myVim.log` with debug level 9.

```
vim -V9myVim.log filename
```

## Build VIM

```
apt install build-essential libncurses-dev libncurses5-dev python3-dev --no-install-recommends

git clone --depth=1 https://github.com/vim/vim.git
cd vim

./configure --prefix=/usr/local/vim --enable-python3interp=yes --with-features=huge
make VIMRUNTIMEDIR=/usr/local/vim/share/vim/vim9
make install
/usr/local/vim/bin/vim --version
```
