# Archive

Usefull before, but not now.

## 安装第三方内核

```
sudo echo 'deb http://deb.xanmod.org releases main' > /etc/apt/sources.list.d/xanmod-kernel.list
wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -

sudo apt update
sudo apt install linux-xanmod
```
