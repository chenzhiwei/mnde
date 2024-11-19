# Windows Subsystem for Linux

## Mount removable media

```
sudo mkdir /mnt/f
sudo mount -t drvfs F: /mnt/f
```

## Install Packages

```
sudo apt update
sudo apt install bash-completion bind9-dnsutils command-not-found curl git gnupg jq tree unzip whois zip
```

## Enable cgroup v2

Check cgroup version:

```
stat -fc %T /sys/fs/cgroup
```

* `tmpfs` means cgroup v1
* `cgroup2fs` means cgroup v2

Enable cgroup v2:

create file `%UserProfile%\.wslconfig`, which is the Windows Home directory.

```
[wsl2]
kernelCommandLine = cgroup_no_v1=all
```

## 24 Hour date format

```
vim /etc/default/locale
LC_TIME=C.UFT-8
```
