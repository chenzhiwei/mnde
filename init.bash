# shellcheck source=init.bash

## Override PATH
PATH=/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)

## Frequent Used Items
items=(go node tinygo utils)
for item in "${items[@]}"; do
    dir="$ROOT_PATH/$item/bin"
    if [[ -d "$dir" ]]; then
        PATH="$PATH:$dir"
    fi
done

## Golang Specific GOPATH
export GOPATH=$HOME/dev/go
## Export PATH
export PATH="$PATH:$GOPATH/bin"

## Disable Ctrl-s and Ctrl-q
stty -ixon

## Make bash in emacs mode
# set -o emacs

## wezterm shell integration
if [[ -r "$ROOT_PATH/.config/wezterm/shell-integration.sh" ]]; then
    source "$ROOT_PATH/.config/wezterm/shell-integration.sh"
fi

## Reserve all scrollback buffer
function bash::scrollback() {
    # Get Current Cursor Position Rows
    local CURPOS
    echo -en "\E[6n"
    read -rsdR CURPOS
    CURPOS=${CURPOS#*[}
    local rows=${CURPOS%%;*}
    local scroll_rows=$((rows-1))

    # Scrollback $scroll_rows
    echo -n $'\e['"${scroll_rows}S" >/dev/tty # Scroll the terminal
    echo -n $'\e['"${scroll_rows}A" >/dev/tty # Move the cursor back up
}
bind -x '"\C-l": bash::scrollback'
