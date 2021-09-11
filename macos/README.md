# MacBook quick start

We now use MacBook Pro as workstation, following are some tips.

## Tweak Control and Command

```
Keyboard --> Modifier Keys... --> Control to Command and Command to Control
```

## Install HyperSwitch

https://bahoom.com/hyperswitch

## Setup proxy

Install your proxy client and connect to your server.

Following is `curl` proxy, many commands like `brew` use `curl` to fetch contents.

```
$ export ALL_PROXY=socks5://127.0.0.1:1080
```

## Install Homebrew

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install packages

```
$ brew install bash-completion binutils coreutils findutils gawk git git-review gnupg gnu-sed gzip nmap tree wget openssl iproute2mac nvm
$ brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
```

## Install Cask packages

```
brew cask install android-platform-tools google-chrome firefox squirrel
```

## Setup ~/.bash_profile

```
cp .bash_profile ~/
```

## Setup Ubuntu env

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

## Clear All DNS Servers

If you update the `/etc/resolv.conf` file or use the GUI to update your DNS servers, it will persist.

The following command can be helpful if you're wanting to fall back to DHCP provided DNS from a router, modem, or similar situation:

```
# networksetup -setdnsservers Wi-Fi empty
# networksetup -setsearchdomains Wi-Fi empty
```
