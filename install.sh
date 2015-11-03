#!/bin/bash

cp ~/.vimrc ~/.vimrc.back
cp ~/.tmux.conf ~/.tmux.conf

cp -f ~/User_Configurations/{.vimrc,.tmux.conf} ~/

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
