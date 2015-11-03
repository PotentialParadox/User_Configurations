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
  if [ ! -d /usr/local/Cellar/zsh ]; then
    brew install zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chsh -s $(which zsh) $(whoami)
  fi
fi

dist=`grep DISTRIB_ID /etc/*-release | awk -F '=' '{print $2}'`

if [ "$dist" == "Ubuntu" ]; then
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install -y vim tmux curl zsh
  if [ ! $SHELL = /usr/bin/zsh ]; then
    echo "zsh installed"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo chsh -s $(which zsh) $(whoami)
  fi
  cp ~/User_Configurations/dustin.zsh-theme ~/.oh-my-zsh/themes
  vim -c "PlugInstall"
fi

python zsh_config.py


if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
