# User\_Configurations
This repository contains my personal user configurations for a variety of different applications. 
For those who haven't used any of the following, I believe that these are very good starting points. 
Note that I personally did not make any of the following plugins and take no credit for them. 
I've created hyperlinks to the creators github accounts. 
For more information, please follow thoses.

# Install
These configuration require the installation of vim and tmux. 
Note that most servers have these already available.

## Three step (does not install zsh)
### Dependencies
For ubuntu, you only need to copy and paste this into your terminal
```
sudo apt-get install vim tmux curl clang cmake
```
For mac, <a href="brew.sh">Homebrew</a> will be used. 
In the following replace username with your username.
```
brew install vim
brew install cmake
brew uninstall libevent
sudo chown -R username /usr/local
brew install tmux
```
### Install configurations 
Once vim and tmux is installed, run the following
```
git clone https://github.com/PotentialParadox/User\_Configurations && ~/User\_Configurations/install.sh
```
Open vim, (ignore any initial errors for now) and type in the command
```
PlugInstall
```
## Get the solarized theme working
You now need to move the color theme folder over, this can be done with the command
```
cp -R ~/.vim/plugged/vim-colorschemes/colors ~/.vim/
```
## Get YouCompleteMe working
YouCompleteMe needs to be compliled before it can work.
```
cd ~/.vimr/plugged/YouCompleteMe
./install.py
```
You complete me uses a configuration file called .ycm_extra_conf.py.
It will search for this whenever you open a c/c++ coding project.
Its recommended that you place it in your working directory.
However, a lazy work around is to use one primary one for all.
This can be done by placing the file in a very high directory.
```
cp ~/User\_Configurations/.ycm_extra_conf.py ~/
```
I've added some very common include directories.
If its not working the readme, it is very good.

<!--## One step (very very beta, use at your own risk)-->
<!--For mac and ubuntu copy and paste this into your terminal-->
<!--```-->
<!--git clone https://github.com/PotentialParadox/User\_Configurations && ~/User\_Configurations/full_install.sh-->
<!--`-->``


# VIM
Vim is the successor to vi, a very keyboard shortcut optimized editor. 
I've modified it with a couple of plugins.
## Plugins
<a href="https://github.com/scrooloose/nerdtree">NerdTree</a> - 
Activated by Ctrl-c. 
Brings up a navigations pane. 
Navigate by using Ctrl+(h,j,k,l). 
Useful when you don't quite know the contents of the program you're working on. 
If you do know the file name that you're looking for, I reccommend using Ctrl-p instead.  

<a href="https://github.com/kien/ctrlp.vim">Ctrl-p</a> - 
Activated by Ctrl-p. Your bread and butter when it comes to navigation. 
Simply type the file name and hit enter to quickly jump between files

<a href="https://github.com/tpope/vim-fugitive">VimFugitive</a> -
One of the best Git wrappers available.
Extremely useful.
Spend a few minutes and watch the screencasts on the link.

<a href="https://github.com/bling/vim-airline">VimAirline</a> - 
Activated at startup. 
Gives a visual interface that allows users to easily determine which mode they are in. 
If it takes up too much of your screen, you can simply comment this line out.

<a href="https://github.com/scrooloose/nerdcommenter"> NerdCommenter</a> - 
Allows the user to quickly comment up code. 
Truly awesome! 
Just highlight the code you want using visual mode, then press leader-cc, or press leader-ci, to inverse a comment state.

<a href="https://github.com/scrooloose/syntastic">Syntastic</a> - 
An very good syntax checker. 
However, it will only check after a save. 
Note that if you don't want to install clang, you'd need to comment out Clang_Complete and Syntastic along with their corresponding options.

<a href="https://github.com/valloric/youcompleteme">YouCompleteMe</a> - 
Keyword completion

<a href="https://github.com/christoomey/vim-tmux-navigator">VimTmuxNavigator</a> 
Allows for the seemless integration of vim and tmux.

<a href="https://github.com/terryma/vim-multiple-cursors">VimMultipleCursors</a> 
Activated with Ctrl-n. 
Creates multiple cursors for each duplicate of the word. 
To back-peddle use the command Ctrl-p.

<a href="https://github.com/klen/python-mode">PythonMode</a> 
Makes vim a python IDE. 
Please follow the link for more information

<a href="https://github.com/tpope/vim-surround">VimSurround</a>
Tag controller, most useful for html

<a href="https://github.com/tpope/vim-repeat">VimRepeat</a>
Adds more power to the '.' command

<a href="https://github.com/benmills/vimux">Vimux</a>
Creates an alternative way to interact with tmux

## Common Plugin Shortcuts
Function                        | Key 
------------------------------- | ----------------
leader                          | \
NerdCommenter - set as commment | leader-cc
NerdCommenter - unset comment   | leader-ci
Ctrl-p - open search            | Ctrl-p
Ctrl-p - move up/down           | Ctrl-k/j
NerdTree - open search          | Ctrl-c
NerdTree - move up/down/l/r     | k/j/h/;
Code Completion                 | Ctrl-n in insert
Multiple Cursors - select       | Ctrl-n in normal
Multiple Cursors - deselect     | Ctrl-p
Vimux - open terminal           | leader-t
Vimux - run last command        | leader-r

## User Defined Vim Shortcuts
Function             | Key 
-------------------- | -------
Vertical Split       | leader-v
Horizontal Split     | leader-h
Quick Save           | leader-s
Quick Save-Close     | leader-q
SpellCheck Toggle    | leader-f
Paste from clipboard | leader-p
Copy to clipboad     | leader-y

# TMUX
Tmux is very similar to the now sort of depricated gnu-screen. 
Its used to split the terminal into multiple panes within the terminal. 
I've included some of the most useful commands

## TMUX Shortcuts
Function             | Key 
-------------------- | ------------------------------------------
Leader               | Ctrl-b
Move to upper pane   | Ctrl-k
Move to lower pane   | Ctrl-j
Move to right pane   | Ctrl-;
Move to left pane    | Ctrl-h
Split vertically     | leader-%
Split horizontally   | leader-"
Close                | leader-x
Resize a pane        | leader:resize-pane -/+(U,D,R,L) 'amount'

