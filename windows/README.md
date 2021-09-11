# Windows

我十年没使用 Windows 了，自从工作以后一直都是使用 Ubuntu 和 MacOS。

最近发现 Windows 里的 WSL2 Ubuntu 和 Windows Terminal 配合使用很赞。


## 删除多余的图标

有时卸载完软件，在系统设置里`选择哪些图标显示在任务栏上`还是会显示残留的图标，让人看着不爽。

打开 PowerShell 并运行以下命令可以解决：

```
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
reg delete "HKCR\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PromotedIconCache /f
taskkill /f /im explorer.exe
explorer.exe
```
