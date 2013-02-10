echo "Welcome to the world of tomorrow!"

DOTFILES=~/.dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ondrej"
ZSH_CUSTOM=$DOTFILES/zsh

plugins=(git python django symfony2 zsh-syntax-highlighting composer virtualenvwrapper history-substring-search)

source $ZSH/oh-my-zsh.sh

# python virtual env wrapper
export WORKON_HOME=~/.virtualenvs
source ~/.local/bin/virtualenvwrapper.sh

# pythonbrew
[[ -s ~/.pythonbrew/etc/bashrc ]] && source ~/.pythonbrew/etc/bashrc

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

eval $( dircolors -b $DOTFILES/LS_COLORS)

# tmux
alias tmux="TERM=xterm-256color tmux"

if [ -f ~/.localrc ]
then
    source ~/.localrc
fi
