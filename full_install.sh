#!/bin/bash

cp ~/.vimrc ~/.vimrc.back
cp ~/.tmux.conf ~/.tmux.conf

cp -f ~/User_Configurations/{.vimrc,.tmux.conf} ~/

if [ "$(uname)" == "Darwin" ]; then
  if [ ! -f /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update
  if [ ! -d /usr/local/Cellar/vim ]; then
    brew install vim
  fi
  if [ ! -d /usr/local/Cellar/tmux ]; then
    brew uninstall libevent
    sudo chown -R $(whoami) /usr/local
    brew install tmux
  fi
  if [ ! -d /usr/local/Cellar/cmake ]; then
    brew install cmake
  fi
  vim -c "PlugInstall"
fi

dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`

if [ "$dist" == "Ubuntu" ]; then
  sudo apt-get update -y
  sudo apt-get install -y vim tmux curl zsh cmake
  vim -c "PlugInstall"
fi

cp -R ~/.vim/plugged/vim-colorschemes/colors ~/.vim
cd ~/.vim/plugged/youcompleteme
./youcompleteme
