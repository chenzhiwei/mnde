# The Vim Configuration

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

## Operations

* `:g/pattern/d` remove matched `pattern` globally
* `:1,50/pattern/d` remove matched `pattern` between line 1 and 50
* `:v/pattern/d` remove unmatched `pattern` globally
* `:g!/pattern/d` remove unmatched `pattern` globally
* `:%s/string/replace/g` replace the string

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
