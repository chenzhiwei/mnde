# Home

```
$ git clone --recursive https://github.com/chenzhiwei/home.git
$ rsync -a home/.[a-z0-9]* --exclude='.git' --exclude='.gitignore' --exclude='.gitmodules' ~
$ echo '. $HOME/.bash_improve' >> ~/.bashrc
```
