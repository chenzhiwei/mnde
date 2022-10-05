# Deepin Customizations

## 安装软件

```
sudo apt update
sudo apt install bash-completion git nftables fcitx-rime console-setup flatpak
```

## 修改窗口圆角大小

1. 控制中心 - 个性化- 圆角窗口

    这个方法只在 Deepin 上适用，并且只有三个值：`0`, `8`, `18`

2. 命令行修改

    ```
    sudo apt install libdtkgui5-bin

    /usr/lib/x86_64-linux-gnu/libdtk-5.2.2/DGui/bin/deepin-gui-settings --set "DTK/WindowRadius" -i 5
    ```

## 标题栏宽度调窄

    ```
    vim ~/.local/share/deepin/themes/deepin/light/titlebar.ini
    vim ~/.local/share/deepin/themes/deepin/dark/titlebar.ini

    [Active]
    height=40

    [Inactive]
    height=40
    ```

## 多任务界面去掉桌面

```
vim .config/kwinrc

[TabBox]
ShowDesktopMode=0
```

## 隐藏系统托盘的蓝牙图标

```
gsettings list-recursively

gsettings set com.deepin.dde.daemon bluetooth false
```

## Deepin Terminal

将切换标签（Tab）的快捷键换成`Alt + [1-9]`。

## Flatpak Mirror

```
sudo apt -y install flatpak

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak remote-modify --no-follow-redirect --url=https://mirror.sjtu.edu.cn/flathub flathub

# restart system

flatpak install org.gtk.Gtk3theme.deepin org.gtk.Gtk3theme.deepin-dark \
    org.telegram.desktop us.zoom.Zoom \
    com.slack.Slack org.kde.haruna \
    org.mozilla.firefox com.github.unrud.VideoDownloader \
    org.supertuxproject.SuperTux net.minetest.Minetest
```

`--no-follow-redirect` 表示将此 URL 持久化下来，否则这个 URL 会在更新后被重置回默认值。低版本没有这个参数，需要手动添加`url-is-set=true`到文件`/var/lib/flatpak/repo/config`。

## 修改启动关机界面

```
plymouth-set-default-theme -l
plymouth-set-default-theme deepin-hidpi-ssd-logo -R
```

## 双系统时 Windows 慢8小时

```
timedatectl set-local-rtc 1
```

## 安装最新软件

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 243A16C859595D31

vim /etc/apt/sources.list.d/deepin-beta.list

    deb [trusted=yes] https://proposed-packages.deepin.com/dde-apricot unstable main contrib non-free

sudo apt update
sudo apt install linux-image-deepin-stable-amd64 linux-headers-deepin-stable-amd64
```

## 安装Debian Backports

```
vim /etc/apt/sources.list.d/debian-backports.list

    deb http://deb.debian.org/debian buster-backports main

apt install vim/buster-backports
# or
apt install -t buster-backports vim
```

## 在容器里编译软件

我喜欢让机器保持干净，而深度系统里编译一个它自己的软件需要下载一堆 QT5 的相关库，而这些库平时我根本不用，所以为了让系统不臃肿，我选择在容器里编译。

```
podman run --it --name=deepin debian:10.8 bash

apt update
apt -y install vim ca-certificates gnupg
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 425956BB3E31DF51

vim /etc/apt/sources.list

    deb [by-hash=force] https://community-packages.deepin.com/deepin/ apricot main contrib non-free

apt update
apt -y install git

git clone https://github.com/linuxdeepin/deepin-terminal
cd deepin-terminal
apt build-dep .
mkdir build && cd build
cmake ..
make
```
