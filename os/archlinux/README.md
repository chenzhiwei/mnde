# README

## Pacman Use

```
# Install Package
pacman -S git

# Remove Package
pacman -Rs git

# Show Installed Package Info
pacman -Qi git

# List Installed Packages
pacman -Q

# Query File
pacman -Qo /etc/default/useradd

# List Package Files
pacman -Ql git

# Search Package
pacman -Ss git
pacman -Sl | grep git

# Show pkg info
pacman -Si git

# apt update
pacman -Sy

# Update System
pacman -Syu
```

## Disable Baloo

```
balooctl disable
balooctl purge
```

## Konsole ctrl+l behavior

Do not clear scrollbuffer, just push to top.

```
keep_clear() {
    shopt -s checkwinsize 2>/dev/null # get LINES var
    lines=${LINES:-(tput lines)} # fallback if not bash
    lines_beforeend=$(( lines - 1 ))
    for i in $(seq "$lines_beforeend"); do echo; done
    printf "\\33[${lines_beforeend}A"
}
```

Add following to .bashrc:

```
bind -x '"\C-l": shopt -s checkwinsize 2>/dev/null; lines=${LINES:-(tput lines)}; for i in $(seq 2 "$lines_beforeend"); do echo; done; printf "\\33[${lines_beforeend}A"; clear -x'
```

A more simple way if using bash, print N empty lines before clear:

```
bind -x '"\C-l": shopt -s checkwinsize; printf "%.0s\n" $(seq 2 $LINES); clear -x'
```
