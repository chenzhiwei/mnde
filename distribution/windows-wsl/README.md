# Windows

Windows 里的 WSL2 Ubuntu 和 Windows Terminal 配合使用很赞。

## WSL2配置文件

位置：`%UserProfile%\.wslconfig`

```
[wsl2]
dnsTunneling=true
networkingMode=mirrored
kernelCommandLine=cgroup_no_v1=all
```

## WSL2 中挂载盘

```
sudo mkdir /mnt/f
sudo mount -t drvfs F: /mnt/f
```

## Ubuntu设置24小时格式

```
vim /etc/default/locale
LC_TIME=C.UFT-8
```

## 给PowerShell设置profile

```
# Check all the profiles
$PROFILE | Get-Member -Type NoteProperty

# Create the profile file
New-Item -ItemType File -Path $PROFILE -Force

# Use Emacs shortcuts
notepad $PROFILE
Set-PSReadlineOption -EditMode Emacs

# Allow executing profile script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 缩小WSL空间占用

```
wsl --shutdown
diskpart
select vdisk file="C:\Users\chenz\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\ext4.vhdx"
compact vdisk
```

## 命令行工具

```
# 查看监听端口
Get-NetTCPConnection -State Listen
netstat -ano | findstr "LISTENING"

# 查看进程信息
Get-Process -Id 12144

# 查看网卡信息
Get-NetIPAddress
```

## 重装 Windows 和 Office

https://www.microsoft.com/zh-cn/software-download/windows11

1. 打开 https://account.microsoft.com/
2. 在『服务与订阅』页面查找已经购买的 Office 产品，然后下载安装
