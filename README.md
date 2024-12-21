# My Nice Development Environment

A collection of configurations and tools for my workstation.

Quick Start:

```
cd ~
git clone https://github.com/chenzhiwei/mnde .mnde
.mnde/setup.sh
eval $(/opt/mito/bin/mito shellenv)
mito install go
mito install node
go install golang.org/x/tools/gopls@latest
vim +PlugInstall +qall
```
