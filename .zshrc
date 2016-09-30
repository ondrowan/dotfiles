echo "Welcome to the world of tomorrow!"

DOTFILES=~/.dotfiles

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ondrej"
ZSH_CUSTOM=$DOTFILES/zsh

# GNU utilities
# Those need to be located before `dircolors` invocation as this command is
# not available in OSX by default.
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

plugins=(git python django zsh-syntax-highlighting history-substring-search brew docker lein pip redis-cli vagrant virtualenvwrapper kubectl)

source $ZSH/oh-my-zsh.sh

# python virtual env wrapper
if [ -f ~/Library/Python/2.7/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/.virtualenvs
    source ~/Library/Python/2.7/bin/virtualenvwrapper.sh
    plugins=("${plugins[@]}" virtualenvwrapper)
fi

# pythonbrew
[[ -s ~/.pythonbrew/etc/bashrc ]] && source ~/.pythonbrew/etc/bashrc

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

eval $( dircolors -b $DOTFILES/LS_COLORS)

# tmux
function safe_tmux() {
    if command -v deactivate > /dev/null 2>&1; then
        deactivate
    fi
    TERM=xterm-256color \tmux;
}

alias tmux='safe_tmux'

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ack='ag'

if [ -f ~/.localrc ]
then
    source ~/.localrc
fi

PATH="/Users/ondrej/Library/Python/2.7/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

alias k=kubectl
