# User_Configurations
This repository contains my personal user configurations for a variety of different applications. For those who haven't used any of the following, I believe that these are very good starting points. Note that I personally did not make any of the following plugins and take no credit for them. I've created hyperlinks to the creators github accounts, for more information, please follow thoses.

# Install
These configuration require the installation of vim and tmux. Note that most servers have these already available.

For ubuntu, you will need to install curl as well
```
sudo apt-get install vim tmux curl
```
For mac, <a href="brew.sh">Homebrew</a> will be used. In the following replace username with your username.
```
brew install vim
brew uninstall libevent
sudo chown -R username /usr/local
brew install tmux
```
Once vim and tmux is installed, run the following
```
git clone https://github.com/PotentialParadox/User_Configurations && ~/User_Configurations/install.sh
```
Open vim, (ignore any initial errors for now) and type in the command
```
PlugInstall
```
You're done.

# VIM
Leader key is defaulted to the '\' key.
## Plugins
<a href="https://github.com/scrooloose/nerdtree">NerdTree</a> - Activated by Ctrl-c. Brings up a navigations pane. Navigate by using Ctrl+(h,j,k,l). Useful when you don't quite know the contents of the program you're working on. If you do know the file name that you're looking for, I reccommend using Ctrl-p instead.  

<a href="https://github.com/kien/ctrlp.vim">Ctrl-p</a> - Activated by Ctrl-p. Your bread and butter when it comes to navigation. Simply type the file name and hit enter to quickly jump between files

<a href="https://github.com/bling/vim-airline">Vim Airline</a> - Activated at startup. Gives a visual interface that allows users to easily determine which mode they are in. If it takes up too much of your screen, you can simply comment this line out.

<a href="https://github.com/scrooloose/nerdcommenter"> NerdCommenter</a> - Allows the user to quickly comment up code. Truly awesome! Just highlight the code you want using visual mode, then press leader-cc, or press leader-ci, to inverse a comment state.

<a href="https://github.com/scrooloose/syntastic">Syntastic</a> - An very good syntax checker. However, it will only check after a save. Note that if you don't want to install clang, you'd need to comment out Clang_Complete and Syntastic along with their corresponding options.

<a href="https://github.com/Shougo/neocomplete.vim">NeoComplete</a> - Keyword completion

<a href="https://github.com/Rip-Rip/clang_complete">ClangComplete</a> Keyword completion using clang for c and c++. Note that if you don't want to install clang, you'd need to comment out lines 25-32.

<a href="https://github.com/christoomey/vim-tmux-navigator">vim-tmux-navigator</a> Allows for the seemless integration of vim and tmux.

<a href="https://github.com/terryma/vim-multiple-cursors">vim-multiple-cursors</a> Activated with Ctrl-n. Creates multiple cursors for each duplicate of the word. To back-peddle use the command Ctrl-p.

<a href="https://github.com/klen/python-mode">python-mode</a> Makes vim a python IDE. Please follow the link for more information
