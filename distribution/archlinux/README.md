# README

## Pacman Use

```
# Install Package
pacman -S git

# Install Local Package
pacman -U warp.pkg.tar.zst

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

## Systemd-boot

```
bootctl list
bootctl set-default auto-windows
```

## Disable Baloo

```
balooctl disable
balooctl purge

System Settings -> Search -> uncheck Enable File Search
```

## 24 Hour format date

```
vim /etc/locale.conf
LC_TIME=C.UFT-8
```
