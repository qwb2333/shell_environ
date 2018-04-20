#!/bin/bash

pwd=`pwd`
names=('.zshrc' '.tmux.conf' '.vimrc' '.oh-my-zsh')

for x in ${names[@]}; do
    file=~/$x
    if [ -e $file ]; then
        read -p "$file exists. do you delete it? (y/n)? " answer
        if [ ! $answer ]; then answer='n'; fi

        if [ $answer == 'y' ];then
            rm -rf $file
            ln -s $pwd/$x $file
        fi
    else
        ln -s $pwd/$x $file
    fi
done

echo "init ok, please try ssh again."
