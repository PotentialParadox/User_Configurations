# Path to your oh-my-zsh installation.
export ZSH=/home/dustin/.oh-my-zsh

######################################
#	Applications
######################################
#Gaussion 09
export g09root=/home/dustin/Applications
export GAUSS_SCRDIR=/tmp
source $g09root/g09/bsd/g09.profile
# DDT
export PATH="$PATH:/opt/allinea/forge/bin/"
# Intel
export PATH="$PATH:/opt/intel/compilers_and_libraries/linux/bin/intel64/"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries/linux/lib/intel64"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries/linux/mkl/lib/intel64_lin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/intel/compilers_and_libraries/linux/mpi/lib64"
export MKLROOT=/opt/intel/compilers_and_libraries/linux/mkl
# AMBER
export AMBERHOME="/home/dustin/Downloads/amber16"
export NAESMDHOME="/home/dustin/Documents/Research/SQM-NAESMD"
test -f /home/dustin/Downloads/amber16/amber.sh && source /home/dustin/Downloads/amber16/amber.sh
# CONDA
export PATH="/home/dustin/anaconda3/bin:$PATH"
# Aliases
alias vi='vim'
alias banana="ssh -Y dustin@jarvisbanana.dyndns.org"
alias gator="ssh -Y dtracy@hpg2.rc.ufl.edu"
alias mordor="ssh -Y dtracy@mordor.chem.ufl.edu"
alias sshrsync="rsync -avz -e \"ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null\" --progress"
alias tmux="tmux -2"
alias naesmd="/home/dustin/Documents/Research/SQM-NAESMD/sqmceonaesmd.exe"
# UFVPN
export PATH="$PATH:/opt/cisco/anyconnect/bin"
# Cuda
export PATH="$PATH:/opt/cuda/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/include"
#Turn off Legacy Freezing
export COMMY="/home/dustin/Documents/Research/NAESMD_AMBER/communism_build"
stty -ixon
#MYAPPs
export MYAPPS="/home/dustin/Applications/myapps"

# Prevent Freezing from ctrl-s
stty -ixon

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ls="ls --color=auto"
alias lk="ls -la --color=auto --block-size=KB"
NC_ROOT="/home/dustin/Documents/scratch/NeuroChem-EnergyCalc"
export LD_LIBRARY_PATH="$NC_ROOT/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="$NC_ROOT/lib:$PYTHONPATH"
