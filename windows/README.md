# Windows

我十年没使用 Windows 了，自从工作以后一直都是使用 Ubuntu 和 MacOS。

最近发现 Windows 里的 WSL2 Ubuntu 和 Windows Terminal 配合使用很赞。

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

## 删除多余的图标

有时卸载完软件，在系统设置里`选择哪些图标显示在任务栏上`还是会显示残留的图标，让人看着不爽。

打开 PowerShell 并运行以下命令可以解决：

```
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PromotedIconCache /f
taskkill /f /im explorer.exe
explorer.exe
```
