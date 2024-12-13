# MacBook quick start

We now use MacBook as workstation, following are some tips to tweak macos to meet my requirements.

## Tweak Control and Command

* Accessibility --> Pointer Control --> Trackpad options --> double tap to drag without lock # fuck Apple for the 0.5s delay
* Keyboard --> Press 〇 key do nothing
* Keyboard --> Modifier Keys... --> Control to Command and Command to Control
* Trackpad --> Point and Click --> Tap to click
* Trackpad --> Scroll & Zoom --> Natural Scrolling

## Install Applications

* Hyperswitch

    Enable the `ctrl-tab` to switch programs.

    https://bahoom.com/hyperswitch

* Mos

    Seperate the mouse scroll and touchpad scroll.

    https://github.com/Caldis/Mos

* Fcitx5

    Better Input Method Engine for Chinese characters.

    https://github.com/fcitx-contrib/fcitx5-macos

    1. Input Methods --> only leave the Rime
    1. Input Methods --> Preedit Mode --> Follow Global Config
    1. Input Methods --> Share Input State --> Program
    1. Global Config --> Hotkey --> remove all hotkeys
    1. Global Config --> Behavior --> Active By Default --> Check
    1. Global Config --> Behavior --> Reset State on Focus in --> No
    1. Global Config --> Behavior --> Share Input State --> Program
    1. Global Config --> Behavior --> Default page size --> 6

* Item2

    Better terminal emulator, see the subfolder.

* Podman

    Better container management tool.

## Install Homebrew and CLI tools

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install bash bash-completion binutils coreutils findutils gawk git git-review gnupg gnu-sed gzip kubectl nmap tree wget openssl iproute2mac
```

## Setup Bash

```
echo /opt/homebrew/bin/bash >> /private/etc/shells
chsh -s /opt/homebrew/bin/bash
cp .bash_profile ~/
```

## Skills and Tips

### Setup Ubuntu env

Find a vagrant box from <https://vagrantcloud.com>, suppose the box is `ubuntu/trusty64`.

```
$ brew install Caskroom/cask/vagrant
$ brew install Caskroom/cask/virtualbox
$ mkdir vagrant
$ vagrant init ubuntu/trusty64
$ ls .vagrant/machines/default/virtualbox/private_key
$ vim Vagrantfile
config.vm.network "private_network", ip: "192.168.33.10"
config.vm.provider "virtualbox" do |vb|
  vb.gui = false
  vb.memory = "4096"
  vb.cpus = "4"
end
$ vagrant up
$ vagrant ssh
```

### Clear All DNS Servers

If you update the `/etc/resolv.conf` file or use the GUI to update your DNS servers, it will persist.

The following command can be helpful if you're wanting to fall back to DHCP provided DNS from a router, modem, or similar situation:

```
# networksetup -setdnsservers Wi-Fi empty
# networksetup -setsearchdomains Wi-Fi empty
```
