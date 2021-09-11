## Terminal labal and title
# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\u@\h:\w\$ '
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

## Bash completion
. /usr/local/etc/bash_completion

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

## PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/openssl/bin:$PATH:/usr/local/node-v5.9.1-darwin-x64/bin/"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/gnu-sed/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
