## Terminal labal and title
# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\u@\h:\w\$ '
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

## Bash completion
. /opt/homebrew/etc/bash_completion

## Add trailing slash for symlinked  directory
bind 'set mark-symlinked-directories on'

## Alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree --charset=ascii'
alias pstree='pstree -A'

# Disable Ctrl-s and Ctrl-q
stty -ixon

# Make bash in emacs mode, this makes Bash shortcuts working
set -o emacs

# Golang
export GOPATH=$HOME/dev/go
export PATH=$PATH:$HOME/.mnde/node/bin:$HOME/.mnde/go/bin:$HOME/dev/go/bin

eval "$(/opt/homebrew/bin/brew shellenv)"
