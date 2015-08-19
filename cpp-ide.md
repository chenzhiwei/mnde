# CPP IDE

If using VIM as CPP IDE, you need to install package `exuberant-ctags`.

## Install exuberant-ctags

    sudo apt-get install exuberant-ctags

## Generate ctags index for your CPP project

    ctags --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -R project_source_dir/

## Open a source file

    vim main.cpp

## Open source tree and ctags view

In VIM command mode, run `F9` and `F8`, this is defined in `dot_vimrc` file.

## Switch between defination/declaration

In VIM command mode, run:

* `CTRL + ]` switch to defination/declaration.
* `CTRL + T` to switch back.
* `:tn` switch to next defination/declaration.
* `:tp` switch to previous defination/declaration.
* `g]` switch between multiple tags.
* `:tags` show tags in current file.

Currently, above commands are enough for me.
