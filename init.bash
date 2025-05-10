# shellcheck source=init.bash

## disable ctrl-s and ctrl-q
stty -ixon

## make bash in emacs mode
set -o emacs

## python no bytecode(__pycache__)
export PYTHONDONTWRITEBYTECODE=1

## enable wezterm shell integration
[[ "$TERM_PROGRAM" == "WezTerm" ]] && source $HOME/.mnde/.config/wezterm/shell-integration.sh

## mito
GOPATH=$HOME/dev/go
for path in /opt/mito/bin /opt/mito/go/bin /opt/mito/node/bin $GOPATH/bin; do
    if [[ "$PATH" != *$path* ]]; then
        PATH="$path:$PATH"
    fi
done
export PATH=$PATH
export GOPATH=$GOPATH
source /opt/mito/etc/bash_completion
