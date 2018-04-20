# shell_environ
build linux shell work environment quickly.

```
yum install zsh, tmux # different system are different
yun install astyle # used in vim, as format code
chsh -s /bin/zsh

git clone git@github.com:qwb2333/shell_environ.git
cd shell_environ
./init_user.sh

# then reconnect your ssh, I recommend you to use mosh to connect instead of ssh.

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git

vim
:PluginInstall # in vim

# if you want to use YouCompleMe, you required vim version 8.0+, and surpose python.
```

## More Infomation
[http://blog.csustacm.com/article.php?pid=60](http://blog.csustacm.com/article.php?pid=60)
http://blog.csustacm.com/article.php?pid=60
